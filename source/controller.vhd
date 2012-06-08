--- $Id: $
-- File name:   controller.vhd
-- Created:     4/7/2012
-- Author:      Spencer Julian
-- Lab Section: 337-02
-- Version:     1.0  Initial Design Entry
-- Description: Controller for the USB Sniffer


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;


entity controller is
  port (
		clk                 : in  std_logic;
  		rst		               : in  std_logic;
		fifo_full           : in  std_logic;
		decoder_instruction : in  std_logic_vector(3 downto 0);
		data_ready          : in  std_logic_vector(1 downto 0);
		eop_found           : in  std_logic;
		data_read : in std_logic;
		fifo_read           : out std_logic;
		fifo_write	         : out std_logic;
		intercept           : out std_logic
	);
end entity controller;

architecture controller_arch of controller is
  type usbState is (idle,requestIntercept,prepareIntercept,doIntercept,waitTrans,writeDelay,writePrep,write,eop);
  type sdState is (idle,fifoRead);
  signal usb, nextUsb: usbState;
  signal sd, nextSd: sdState;
  signal beginSd: std_logic;
  signal dr1, dr2, dr : std_logic;
  signal eopCount, nexteopCount: std_logic_vector(2 downto 0);
  signal writeCount, nextWriteCount : std_logic_vector(2 downto 0);
  signal eop1, eop2, eopf: std_logic;

  begin
    GREGI: process(rst, clk)
        begin
          if(rst = '0') then --Reset everything
            usb <= idle;
            sd <= idle;
            eopCount <= "000";
            writeCount <= "000";
            eop1 <= '0';
            eop2 <= '0';
            dr1 <= '0';
            dr2 <= '0';
            dr <= '0';
          elsif(rising_edge(clk)) then --Clock edge
            usb <= nextUsb; --Next states
          		sd <= nextSd;
          		eopCount <= nexteopCount;
          		writeCount <= nextWriteCount;
          		if (eop2 = '0' and eop1 = '1') then --Edge detector on our eop signal, only want to do things once.
          		  eopf <= '1';
        		  else
        		    eopf <= '0';
      		    end if;
     		     if(dr2 = '0' and dr1 = '1') then --Edge detector for the "data_read" signal, don't want to continously empty the fifo
              dr <= '1';
            else
              dr <= '0';
            end if;
            dr2 <= dr1;
            dr1 <= data_read;
      		    eop2 <= eop1;
      		    eop1 <= eop_found;
          end if;
    end process GREGI;

    NXT: process(fifo_full,decoder_instruction,data_ready,eopf,writeCount,nextWriteCount,eopCount,nexteopCount,eop_found,dr,beginSd,nextUsb,nextSd,usb,sd)
    begin
      
      nexteopCount <= eopCount;
      nextWriteCount <= writeCount;
      nextUsb <= usb;
  case usb is --State machine 1
		when idle => --Idle, waiting for PID (PIDs are inverse due to LSB first)
		  nexteopCount <= "000";
		  nextWriteCount <= "000";
        		if (decoder_instruction = "1101") then nextUsb <= requestIntercept;
			elsif (decoder_instruction = "0011") then nextUsb <= writeDelay;
			elsif (decoder_instruction = "1011") then nextUsb <= writeDelay;
			elsif (decoder_instruction = "0111") then nextUsb <= writeDelay;
			else nextUsb <= idle;
			end if;
		when requestIntercept => --if PID was a setup PID, wait for "IN" PID
		  nexteopCount <= "000";
  		  nextWriteCount <= "000";
			if (decoder_instruction = "1001") then nextUsb <= prepareIntercept;
			else nextUsb <= requestIntercept;
			end if;
		when prepareIntercept => --Now if the PID is an "IN" PID, wait for "Data" PID
		  nexteopCount <= "000";
 		  nextWriteCount <= "000";
			if (decoder_instruction = "1011") then nextUsb <= doIntercept;
			else nextUsb <= prepareIntercept;
			end if;
		when doIntercept => --Once we see Data PID, we know we're transmitting data, so prepare to intercept. 
		  nexteopCount <= "000";
  		  nextWriteCount <= "000";
			nextUsb <= waitTrans;
		when waitTrans => -- Now we need to wait until we see the appropriate number of "eop's" so we know we're done with the device descriptor packet.
  		  nextWriteCount <= "000";
		  if (eopCount = "101") then nexteopCount <= "000"; 
		    nextUsb <= idle;
		  elsif (eopCount < 5 and eopf = '1') then nexteopCount <= eopCount + 1;
		    nextUsb <= waitTrans;
	    else nexteopCount <= eopCount;
	     nextUsb <= waitTrans;
      end if;
		when writeDelay => --This delays the write state due to internal delays
		  nexteopCount <= "000";
		  if (data_ready = "01") then nextUsb <= writePrep;
	    else nextUsb <= writeDelay;
      end if;
		when writePrep =>  --This delays the write state until we have a full byte to write
		  nexteopCount <= "000";
		  if (data_ready = "11") then nextUsb <= write;
		  else nextUsb <= writePrep;
		  end if;
		when write => --This allows bytes to enter the fifo until it's full or we see an eop.
		  nexteopCount <= "000";
		  nextWriteCount <= writeCount + 1;
			if (eop_found = '1' or fifo_full = '1' or writeCount = 7) then nextUsb <= eop;
			else nextUsb <= writeDelay;
			end if;
		when eop => --Once we see an eop (or a full fifo), begin the next state machine (below).
  		  nextWriteCount <= "000";
		  nexteopCount <= "000";
			nextUsb <= idle;
when others => nextUsb <= idle;
	end case;
          nextSd <= sd;
	case sd is --Next state machine
		when idle => --If data hasn't been read by the sd controller yet, just sit there.
			if (dr = '1') then nextSd <= fifoRead;
			else nextSd <= idle;
			end if;
		when fifoRead => --Otherwise, increment the fifo's counter.
		  nextSd <= idle;
when others => nextSd <= idle;
	end case;
     end process NXT;
    OUTL: process(usb, nextUsb, sd, nextSd) --This process just outputs specific values. It's seperated for readability. The states are described above.
      begin
fifo_write <= '0';
			intercept <= '0';
			beginSd <= '0';	
        case usb is --fifo_write, intercept, beginSd, lockCode
		when idle =>
			fifo_write <= '0';
			intercept <= '0';
			beginSd <= '0';		
		when requestIntercept =>
			fifo_write <= '0';
			intercept <= '0';
			beginSd <= '0';
		when prepareIntercept =>
			fifo_write <= '0';
			intercept <= '0';
			beginSd <= '0';
		when doIntercept =>
			fifo_write <= '0';
			intercept <= '1';
			beginSd <= '0';
		when waitTrans =>
		  fifo_write <= '0';
		  intercept <= '0';
		  beginSd <= '0';
		when writeDelay =>
		  fifo_write <= '0';
		  intercept <= '0';
		  beginSd <= '0';
		when writePrep =>
			fifo_write <= '0';
			intercept <= '0';
			 beginSd <= '0';
		when write =>
			fifo_write <= '1';
			intercept <= '0';
			beginSd <= '0';
		when eop =>
			fifo_write <= '0';
			intercept <= '0';
			beginSd <= '1';
--when others => nextUsb <= idle;
		
  end case;
fifo_read <= '0';
	case sd is --sd_enable(!), sd_clock, fifo_read, nextBitCount, gregister_read
		when idle =>
			fifo_read <= '0';
		when fifoRead =>
			fifo_read <= '1';

--when others => nextSd <= idle;
	end case;
    end process OUTL;
    
end controller_arch;
