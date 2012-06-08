-- $Id: $
-- File name:   SpiSlaveFifoRam.vhd
-- Created:     3/17/2012
-- Author:      David Kauer
-- Lab Section: 
-- Version:     1.0  Initial Design Entry
-- Description: SPI Slave Fifo RAM or Register File (supports overwrite)

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity FifoRam is
  generic
  (
    gregLength : integer := 4;
    gregWidth  : integer := 8;
    addrSize  : integer := 2  -- 2^addrSize = gregLength
  );
  port (
    clk      : in std_logic;
    resetN   : in std_logic;
    wEnable  : in std_logic;
    wData    : in std_logic_vector(gregWidth-1 downto 0);
    wSel     : in std_logic_vector(addrSize-1 downto 0);
    rSel     : in std_logic_vector(addrSize-1 downto 0);
    rData    : out std_logic_vector(gregWidth-1 downto 0);
    fifoEmpty : out std_logic;
    fifoFull  : out std_logic
    );
end FifoRam;

architecture FifoRam_arch of FifoRam is
  type REGFILE is array(gregLength-1 downto 0) of std_logic_vector(gregWidth-1 downto 0);
	signal gregData,nextRegData : REGFILE;
	signal fifoEmptyReg,nextFifoEmptyReg,fifoFullReg,nextFifoFullReg : std_logic;
begin
  
  -- empty and full comb logic
  nextFifoEmptyReg <= '1' when (wSel = rSel) else '0';
  nextFifoFullReg <= '1' when (conv_integer(rSel) = (conv_integer((wSel+1)) mod conv_integer(gregLength))) else '0'; -- rsel = (wsel+1) mod gregLength
  
  fifoEmpty <= fifoEmptyReg;
  fifoFull <= fifoFullReg;
  
  process(clk,resetN)
  begin
    if resetN = '0' then
      for i in 0 to gregLength-1 loop
        gregData(i) <= (others => '0');
        fifoEmptyReg <= '1';
        fifoFullReg <= '0';
      end loop;
    elsif rising_edge(clk) then
      gregData <= nextRegData;
      fifoEmptyReg <= nextFifoEmptyReg;
      fifoFullReg <= nextFifoFullReg;
    end if;
  end process;
  
  -- write process (decoder)
  process(gregData,wEnable,wSel,wData,fifoFullReg)
  begin
    nextRegData <= gregData;
    
    if wEnable = '1' and fifoFullReg = '0' then
      nextRegData(conv_integer(wSel)) <= wData;
    end if;
  end process;
  
  -- read logic (mux)
  rData <= gregData(conv_integer(rSel));
  
end FifoRam_arch;
