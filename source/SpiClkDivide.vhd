-- $Id: $
-- File name:   clk_divide
-- Created:     2/19/2012
-- Author:      David Kauer
-- Lab Section: 2
-- Version:     1.0  Initial Design Entry
-- Description: System Clock Divider

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity SpiClkDivide is
  generic(
    spiDivSlow : std_logic_vector(8 downto 0) := "101100101"; -- 357, clocks downto 400 kHz
    spiDivFast : std_logic_vector(1 downto 0) := "11"; -- 3, clocks downto 28 MHz-ish
    sclPol : integer := 0;
    sclPha : integer := 0
  );
  port (
    clk        : in std_logic;
    resetN     : in std_logic;
    sclEnable : in std_logic;
    sclSpeed  : in std_logic;
    tsrEnable : out std_logic;
    scl       : out std_logic
    );
end SpiClkDivide;

architecture SpiClkDivide_arch of SpiClkDivide is
   signal count,nextcount : std_logic_vector(8 downto 0);
   signal prevSclEnable,nextPrevSclEnable : std_logic;
   signal nextSclReg,sclReg : std_logic;
begin
  nextPrevSclEnable <= sclEnable;
  scl <= sclReg;
  
  process(clk,resetN)
  begin
    if resetN = '0' then
      count <= (others => '0');
      prevSclEnable <= '0';
      sclReg <= '0';
    elsif rising_edge(clk) then
      count <= nextcount;
      prevSclEnable <= nextPrevSclEnable;
      sclReg <= nextSclReg;
    end if;
  end process;
  
  process(count,sclEnable,sclSpeed,sclReg)
  begin
    
  tsrEnable <= '0';
  nextSclReg <= '0';

 
  
  -- Polarity = 0
  if sclEnable = '1' then
    -- scl
    if sclSpeed = '0' then --slow mode
      if (conv_integer(count) >= 0) and (conv_integer(count) < conv_integer(spiDivSlow)/2) then
        nextSclReg <= '1';
      elsif conv_integer(count) >= conv_integer(spiDivSlow)/2 then
        nextSclReg <= '0';
      end if;
    else --fast mode
        if (conv_integer(count) >= 0) and (conv_integer(count) < conv_integer(spiDivFast)/2) then
          nextSclReg <= '1';
        elsif conv_integer(count) >= conv_integer(spiDivFast)/2 then
          nextSclReg <= '0';
        end if;
    end if;
  end if;
 
  
  -- Phase = 0;
  if sclEnable = '1' then
    -- tsrEnable logic
    if sclSpeed = '0' then --slow mode
      if conv_integer(count) = (conv_integer(spiDivSlow))/2 then
        tsrEnable <= '1';
      end if; 
    else --fast mode
      if conv_integer(count) = (conv_integer(spiDivFast))/2 then
       tsrEnable <= '1';
     end if;
    end if;
end if;

  end process;
  
  nextcount <= (others => '0') when sclEnable = '0'
               else (others => '0') when count >= (spiDivSlow-1) and sclSpeed = '0'
               else (others => '0') when count >= (spiDivFast-1) and sclSpeed = '1'
               else (count + 1);
                   
end SpiClkDivide_arch;
