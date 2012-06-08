-- $Id: $
-- File name:   tb_ClkDivide.vhd
-- Created:     2/29/2012
-- Author:      David Kauer
-- Lab Section: 2
-- Version:     1.0  Initial Test Bench

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_SpiClkDivide is
  generic( CLK_PERIOD : Time := 10 ns );
end tb_SpiClkDivide;

architecture TEST of tb_SpiClkDivide is

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

  component SpiClkDivide
    PORT(
         clk : in std_logic;
         resetN : in std_logic;
         sclEnable : in std_logic;
         tsrEnable : out std_logic;
         scl       : out std_logic
    );
  end component;

  signal clk : std_logic;
  signal resetN : std_logic;
  signal sclEnable : std_logic;
  signal tsrEnable : std_logic;
  signal scl : std_logic;

begin
  
  process
    begin
    clk <= '1';
    wait for CLK_PERIOD/2;
    clk <= '0';
    wait for CLK_PERIOD/2;
  end process;
  
  
  DUT: SpiClkDivide port map(
                clk => clk,
                resetN => resetN,
                tsrEnable => tsrEnable,
                sclEnable => sclEnable,
                scl => scl
                );

process
  begin
   sclEnable <= '1'; 
    
   -- run for 1000 ns
   resetN <= '0';
   wait for 10 ns;

   resetN <= '1';
  
   wait;

  end process;
end TEST;
