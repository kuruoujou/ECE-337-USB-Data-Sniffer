-- $Id: $
-- File name:   tb_SpiSlaveFifo.vhd
-- Created:     3/17/2012
-- Author:      David Kauer
-- Lab Section: 
-- Version:     1.0  Initial Test Bench

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_FifoTop is
    GENERIC (
      gregLength : integer := 16;
      gregWidth  : integer := 8;
      addrSize  : integer := 4;      -- 2^addrSize = gregLength
      CLK_PERIOD : Time := 10 ns
   );
end tb_FifoTop;

architecture TEST of tb_FifoTop is

  function UINT_TO_STD_LOGIC( X: INTEGER; NumBits: INTEGER )
     return STD_LOGIC_VECTOR is
  begin
    return std_logic_vector(to_unsigned(X, NumBits));
  end;

  function STD_LOGIC_TO_UINT( X: std_logic_vector)
     return integer is
  begin
    return to_integer(unsigned(x));
  end;

  component SpiSlaveFifo
    PORT(
         clk : IN std_logic;
         rEnable : IN std_logic;
         resetN : IN std_logic;
         wData : IN std_logic_vector (gregWidth-1 DOWNTO 0);
         wEnable : IN std_logic;
         fifoEmpty : OUT std_logic;
         fifoFull : OUT std_logic;
         rdata : OUT std_logic_vector (gregWidth-1 DOWNTO 0)
    );
  end component;

  signal clk : std_logic;
  signal rEnable : std_logic;
  signal resetN : std_logic;
  signal wData : std_logic_vector (gregWidth-1 DOWNTO 0);
  signal wEnable : std_logic;
  signal fifoEmpty : std_logic;
  signal fifoFull : std_logic;
  signal rdata : std_logic_vector (gregWidth-1 DOWNTO 0);

begin
  
 	CLKGEN : process
	begin
		clk <= '1';
		wait for CLK_PERIOD / 2;
		clk <= '0';
		wait for CLK_PERIOD / 2;
	end process;
  DUT: SpiSlaveFifo port map(
                clk => clk,
                rEnable => rEnable,
                resetN => resetN,
                wData => wData,
                wEnable => wEnable,
                fifoEmpty => fifoEmpty,
                fifoFull => fifoFull,
                rdata => rdata
                );

process
  begin
    -- run for 700 ns
    wData <= x"00";
    wEnable <= '0';
    rEnable <= '0';

   -- Reset System
   resetN <= '0';
   wait for 10 ns;

   resetN <= '1';
   wait for 10 ns;
   
   -- test for general functionality
    wData <= "11000011";
    wEnable <= '1';
    wait for 10 ns;
    wData <= "00111100";
    wait for 10 ns;
    wait for 20 ns;
    
    wEnable <= '0';
    rEnable <= '1';
    wait for 20 ns;
    
    wEnable <= '1';
    rENable <= '0';
    for i in 0 to 3 loop
      wData <= UINT_TO_STD_LOGIC(i,8);
      wait for 10 ns;
    end loop;
    
    wEnable <= '0';
    rEnable <= '1';
    wait for 50 ns;
    
    -- test for empty fifo
    wEnable <= '1';
    rEnable <= '0';
    for i in 0 to 2 loop
      wData <= UINT_TO_STD_LOGIC(i,8);
      wait for 10 ns;
    end loop;
    
    wEnable <= '0';
    rEnable <= '1';
    wait for 40 ns;
    
    -- test for full fifo
    rEnable <= '0';
    wEnable <= '1';
    for i in 0 to 19 loop
      wData <= UINT_TO_STD_LOGIC(i,8);
      wait for 10 ns;
    end loop;      
    wEnable <= '0';
    wait for 30 ns;
    
    -- read from full fifo
    rEnable <= '1';
    wait for 100 ns;
    
    -- test for full fifo
    rEnable <= '0';
    wEnable <= '1';
    for i in 0 to 5 loop
      wData <= UINT_TO_STD_LOGIC(i,8);
      wait for 10 ns;
    end loop;      
    wEnable <= '0';
    wait for 30 ns;
    
    wait;

  end process;
end TEST;
