-- $Id: $
-- File name:   SpiSlaveFifoWrite
-- Created:     3/17/2012
-- Author:      David Kauer
-- Lab Section: 
-- Version:     1.0  Initial Design Entry
-- Description: SPI Slave Fifo Write Counter

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity FifoWrite is
  generic
  (
    gregLength : integer := 16;
    addrSize  : integer := 4  -- 2^addrSize = gregLength
  );
  port (
    clk      : in std_logic;
    resetN   : in std_logic;
    wEnable  : in std_logic;
    fifoFull : in std_logic;
    wSel     : out std_logic_vector(addrSize-1 downto 0)
    );
end FifoWrite;

architecture FifoWrite_arch of FifoWrite is
   signal count,nextCount : std_logic_vector(addrSize-1 downto 0); 
begin
  process(clk,resetN)
  begin
    if resetN = '0' then
      count <= (others => '0');
    elsif rising_edge(clk) then
      count <= nextCount;
    end if;
  end process;
  
  nextCount <= count when fifoFull = '1' -- cannot write if fifo is full
               else (others => '0') when ((conv_integer(count) = gregLength-1) and wEnable = '1')
               else (count + 1) when wEnable = '1'
               else count;
                 
  wSel <= count;
   
end FifoWrite_arch;
