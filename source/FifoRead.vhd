-- $Id: $
-- File name:   SpiSlaveFifoRead
-- Created:     3/17/2012
-- Author:      David Kauer
-- Lab Section: 
-- Version:     1.0  Initial Design Entry
-- Description: SPI Slave Fifo Read Counter

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity FifoRead is
  generic
  (
    gregLength : integer := 16;
    addrSize  : integer := 4  -- 2^addrSize = gregLength
  );
  port (
    clk       : in std_logic;
    resetN    : in std_logic;
    rEnable   : in std_logic;
    fifoEmpty : in std_logic;
    rSel      : out std_logic_vector(addrSize-1 downto 0)
    );
end FifoRead;

architecture FifoRead_arch of FifoRead is
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
  
nextCount <=   count when fifoEmpty = '1' -- cannot read if fifo empty
               else (others => '0') when ((conv_integer(count)) = gregLength-1) and rEnable = '1' -- reset
               else count+1 when rEnable = '1' -- increment
               else count;
                   
  rSel <= count;
   
end FifoRead_arch;
