-- $Id: $
-- File name:   sd_control.vhd
-- Created:     2/20/2012
-- Author:      Spencer Julian
-- Lab Section: 337-02
-- Version:     1.0  Initial Design Entry
-- Description: SD CArd Control


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;


entity sd_control is
  port (
		clk                 : in  std_logic;
  		rst		               : in  std_logic;
		sd_clock            : in  std_logic;
		fifo_empty          : in  std_logic;
		data_in             : in  std_logic_vector(7 downto 0);
		data_out            : out std_logic_vector(7 downto 0);
		clk_mode            : out std_logic;
		tsr_load            : out std_logic;
		sd_enable           : out std_logic;
		clk_enable          : out std_logic;
		data_read           : out std_logic
	);
end entity sd_control;

architecture sd_arch of sd_control is
  type sdState is (qs, start,syncClock,idle,spi,blank,chksum,ackWait,cmd1,cycWait,cmd25,beginWriteWait,writeStart,writeByte,endWrite);
  signal sd, nextSd: sdState;
  signal count1, nextCount1 : std_logic_vector(6 downto 0);
  signal count2, nextCount2 : std_logic_vector(4 downto 0);
  signal count3, nextCount3 : std_logic_vector(2 downto 0);
  signal sdc, sd_clock1, sd_clock2 : std_logic;

  begin
    GREGI: process(rst, clk)
        begin
          if(rst = '0') then --reset
            sd <= qs;
            count1 <= "0000000";
            count2 <= "00000";
            count3 <= "000";
            sd_clock1 <= '0';
            sd_clock2 <= '0';
            sdc <= '0';
          elsif(rising_edge(clk)) then
          		sd <= nextSd; --next state
          		count1 <= nextCount1;
          		count2 <= nextCount2;
          		count3 <= nextCount3;
          		if (sd_clock2 = '0' and sd_clock1 = '1') then --sd clock edge detector
          		  sdc <= '1';
        		  else
        		    sdc <= '0';
      		    end if;
          		sd_clock2 <= sd_clock1;
          		sd_clock1 <= sd_clock;
          end if;
    end process GREGI;

    NXT: process(sd,nextSd,sdc,data_in,fifo_empty,count1,count2,count3)
    begin
 	    -- defaults
 	    nextSd <= sd;
	    nextCount1 <= (others => '0');
	    nextCount2 <= (others => '0');
	    nextCount3 <= (others => '0');
	    
	case sd is --outputs: data_out, clk_mode, tsr_load, sd_enable, clk_enable
	  when qs => --start state - should fix weird startup error with nextcount
	    if (sdc = '1') then nextSd <= syncClock;
      else nextSd <= qs;
      end if;
		when start => --turn cs off (pull high), loop with syncClock 80 times
		  nextCount1 <= count1;
		  if (sdc = '1') then nextSd <= syncClock;
		  else nextSd <= start;
	    end if;
		when syncClock => --loop with above 79 times (80th comes from idle state)
		  if (count1 = 77) then nextSd <= idle;
		  else nextCount1 <= count1 + 1;
		    nextSd <= start;
	    end if;
		when idle => --reset nextcount, load cmd0 into tsr
		  if (sdc='1') then nextSd <= spi;
		  else nextSd <= idle;
		  end if;
		when spi => --output command to sd card
      if (sdc='1' and count1 < 7) then nextCount1 <= count1 + 1;
        nextSd <= spi;
      elsif(sdc='1' and count1 = 7) then nextSd <= blank;
      else nextSd <= spi;
        nextCount1 <= count1;
      end if;
		when blank => --output 4 blank bytes
      if (sdc='1' and count1 < 7) then nextCount1 <= count1 + 1;
        nextSd <= blank;
        nextCount2 <= count2;
      elsif(sdc='1' and count1 = 7 and count2 < 2) then nextSd <= blank;
        nextCount2 <= count2 + 1;
      elsif(sdc='1' and count1 = 7 and count2 = 2) then 
        nextSd <= chksum;
      else nextSd <= blank;
        nextCount2 <= count2;
        nextCount1 <= count1;
      end if;
		when chksum => --output the checksum
      if (sdc='1' and count1 < 7) then nextCount1 <= count1 + 1;
        nextSd <= chksum;
      elsif(sdc='1' and count1 = 7) then nextSd <= ackWait;
      else nextSd <= chksum;
        nextCount1 <= count1;
      end if;
		when ackWait => --wait for ack
      nextCount3 <= count3;
		  if (sdc = '1' and count1 < 7) then nextCount1 <= count1 + 1;
		    nextCount2 <= count2;
		    nextSd <= ackWait;
	    elsif (sdc = '1' and count1 = 7 and count2 < 1) then nextCount2 <= count2 + 1;
	      nextSd <= ackWait;
      elsif (sdc = '1' and count1 = 7 and count2 = 1 and count3 < 5) then
        nextSd <= cmd1;
      elsif (sdc = '1' and count1 = 7 and count2 = 1 and count3 = 5) then
        nextSd <= cycWait;
      else nextSd <= ackWait;
        nextCount1 <= count1;
        nextCount2 <= count2;
      end if;
		when cmd1 => --send command 1 (are you ready? signal)
		  if (sdc = '1' and count1 < 7) then nextCount1 <= count1 + 1;
		    nextSd <= cmd1;
		    nextCount3 <= count3;
	    elsif (sdc = '1' and count1 = 7 and count3 < 5) then nextCount3 <= count3 + 1;
	      nextSd <= ackWait;
      else nextSd <= cmd1;
        nextCount1 <= count1;
        nextCount3 <= count3;
      end if;
		when cycWait => --wait for period (16 clocks)
		  if (sdc = '1' and count1 < 7) then nextCount1 <= count1 + 1;
		    nextSd <= cycWait;
		    nextCount2 <= count2;
      elsif (sdc = '1' and count1 = 7) then
        nextSd <= cmd25;
      else nextSd <= cycWait;
        nextCount1 <= count1;
      end if;
		when cmd25 => --send command 25 (begin write signal)
		  if (sdc = '1' and count1 < 7) then nextCount1 <= count1 + 1;
		    nextSd <= cmd25;
      elsif (sdc = '1' and count1 = 7) then 
        nextSd <= beginWriteWait;
      else nextSd <= cmd25;
        nextCount1 <= count1;
      end if;
		when beginWriteWait => --wait for period (16 clocks)
		  if (sdc = '1' and count1 < 7) then nextCount1 <= count1 + 1;
		    nextSd <= beginWriteWait;
		    nextCount2 <= count2;
	    elsif (sdc = '1' and count1 = 7 and count2 < 1) then nextCount2 <= count2 + 1;
	      nextSd <= beginWriteWait;
      elsif (sdc = '1' and count1 = 7 and count2 = 1) then
        nextSd <= writeStart;
      else nextSd <= beginWriteWait;
        nextCount1 <= count1;
        nextCount2 <= count2;
      end if;
		when writeStart => -- write start of packet
	    if (count1 = 7 and fifo_empty = '1') then
	      nextCount1 <= "0000111"; --want to continue back to this if/elsif condition
      end if;
		  if (sdc = '1' and count1 < 7) then nextCount1 <= count1 + 1;
		    nextSd <= writeStart;
      elsif (sdc = '1' and count1 = 7 and fifo_empty = '0') then
        nextSd <= writeByte;
      else nextSd <= writeStart;
        nextCount1 <= count1;
      end if;
		when writeByte => --Write each byte out, pause if no byte to write
		  if (sdc = '1' and count1 < 7) then nextCount1 <= count1 + 1;
		    nextSd <= writeByte;
      elsif (sdc = '1' and count1 = 7) then
        nextSd <= endWrite;
      else nextSd <= writeByte;
        nextCount1 <= count1;
      end if;
		when endWrite => --write end of each byte, prepare for next byte
		  if (sdc = '1' and count1 < 7) then nextCount1 <= count1 + 1;
		    nextSd <= endWrite;
      elsif (sdc = '1' and count1 = 7) then
        nextSd <= beginWriteWait;
      else nextSd <= endWrite;
        nextCount1 <= count1;
      end if;
  when others => nextSd <= qs;
	end case;
	end process NXT;
    
  THINGS: process(sd,nextSd,count1,count2,count3,data_in,fifo_empty)
  begin
     -- defaults
	    data_out <= "11111111";
	    clk_mode <= '1';
	    tsr_load <= '0';
	    sd_enable <= '0';
	    clk_enable <= '1';
	    data_read <= '0';
	    
	case sd is --outputs: data_out, clk_mode, tsr_load, sd_enable, clk_enable
	  when qs => --start state - should fix weird startup error with nextcount
	    clk_mode <= '0';
	    sd_enable <= '1';
		when start => --turn cs off (pull high), loop with syncClock 80 times
		  clk_mode <= '0'; --0 for 400 kHz, 1 for 25 MHz-ish
		  sd_enable <= '1'; -- active low
		when syncClock => --loop with above 79 times (80th comes from idle state)
		  clk_mode <= '0';
		  sd_enable <= '1';
		when idle => --reset nextcount, load cmd0 into tsr
		  clk_mode <= '0';
		  data_out <= x"40";
		  tsr_load <= '1';
		when spi => --output command to sd card
		  clk_mode <= '0';
      if (count1 = 7) then --last bit outputed, load next thing
        tsr_load <= '1';
      end if;
		when blank => --output 4 blank bytes
		  clk_mode <= '0';
      if (count2 = 2 and count1 = 7) then --load checksum instead of blank
        data_out <= x"95";
      elsif (count2 < 2 and count1 = 7) then --load blank instead of checksum
        data_out <= x"00";
      end if;
      if (count1 = 7) then --last bit outputed, load next thing
        tsr_load <= '1';
      end if;
		when chksum => --output the checksum
		  clk_mode <= '0';
      if (count1 = 7) then --last bit outputed, load next thing
        tsr_load <= '1';
      end if;
		when ackWait => --wait for ack
		  clk_mode <= '0';
		  if (count1 = 7 and (count2 < 1 or count3 = 5)) then --last bit outputted, load next thing
		    tsr_load <= '1';
		  elsif (count1 = 7 and count2 = 1 and count3 < 5) then
		    tsr_load <= '1';
		    data_out <= x"41";
		  end if;
		when cmd1 => --send command 1 (are you ready? signal)
		  clk_mode <='0';
		  if (count1 = 7 and count3 <= 4) then --last bit outputted, load next thing
		      tsr_load <= '1';
	    end if;
		when cycWait => --wait for period (16 clocks)
		  if (count1 = 7) then --last bit outputted, load next thing
		    tsr_load <= '1';
	      data_out <= x"59"; -- prepare command 25
		  end if;
		when cmd25 => --send command 25 (begin write signal)
		  if (count1 = 7) then --last bit outputted, load next thing
		    tsr_load <= '1';
		  end if;
		when beginWriteWait => --wait for period (16 clocks)
		  if (count1 = 7 and count2 < 1) then --last bit outputted, load next thing
		    tsr_load <= '1';
		  elsif (count1 = 7 and count2 = 1) then
		    tsr_load <= '1';
		    data_out <= x"FC";
		  end if;
		when writeStart => -- write start of packet
		  if (count1 = 7 and fifo_empty = '0') then --last bit outputted, load next thing
		    tsr_load <= '1';
		    data_out <= data_in;
		    data_read <= '1';
	    elsif (count1 = 7 and fifo_empty = '1') then
	      clk_enable <= '0'; --pause the clock while waiting for data in fifo
      end if;
		when writeByte =>
		  if (count1 = 7) then --last bit outputted, load next thing
		    tsr_load <= '1';
		    data_out <= x"3F";
      end if;
		when endWrite =>
		  if (count1 = 7) then --last bit outputted, load next thing
		    tsr_load <= '1';
		    data_out <= x"FF";
      end if;
    end case;
  end process THINGS;
end sd_arch;
