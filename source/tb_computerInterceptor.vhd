-- $Id: $
-- File name:   tb_computerInterceptor.vhd
-- Created:     4/19/2012
-- Author:      John Wyant
-- Lab Section: 337-02
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_computerInterceptor is
generic (Period : Time := 70 ns);
end tb_computerInterceptor;

architecture TEST of tb_computerInterceptor is

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

  component computerInterceptor
    PORT(
         usbClk : in std_logic;
         rst : in std_logic;
         computerDataPlus : in std_logic;
         computerDataMinus : in std_logic;
         computerDataPlusOutput : out std_logic;
         computerDataMinusOutput : out std_logic;
         computerLock : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal usbClk : std_logic;
  signal rst : std_logic;
  signal computerDataPlus : std_logic;
  signal computerDataMinus : std_logic;
  signal computerDataPlusOutput : std_logic;
  signal computerDataMinusOutput : std_logic;
  signal computerLock : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable usbClk_tmp: std_logic := '0';
begin
  usbClk_tmp := not usbClk_tmp;
  usbClk <= usbClk_tmp;
  wait for Period/2;
end process;

  DUT: computerInterceptor port map(
                usbClk => usbClk,
                rst => rst,
                computerDataPlus => computerDataPlus,
                computerDataMinus => computerDataMinus,
                computerDataPlusOutput => computerDataPlusOutput,
                computerDataMinusOutput => computerDataMinusOutput,
                computerLock => computerLock
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst <= '1';
    computerDataPlus <= '1';
    computerDataMinus <= '1';
    wait for 70 ns;
    rst <= '0';
    wait for 70 ns;
    rst <= '1';
    computerDataPlus <= '0';
    wait for 70 ns;
    computerDataPlus <= '1';
    computerDataMinus <= '0';
    wait for 70 ns;
    computerDataPlus <= '0';
    computerDataMinus <= '1';
    wait for 70 ns;
    computerDataPlus <= '1';
    computerDataMinus <= '0';
    wait for 70 ns;
    computerDataPlus <= '0';
    computerDataMinus <= '1';
    wait for 70 ns;
    computerDataPlus <= '1';
    computerDataMinus <= '0';
    wait for 70 ns;
    computerDataPlus <= '0';
    computerDataMinus <= '1';
    wait for 70 ns;
    computerDataPlus <= '1';
    computerDataMinus <= '0';
    wait for 140 ns;
    computerDataPlus <= '0';
    computerDataMinus <= '1';
    wait for 70 ns;
    computerDataPlus <= '1';
    computerDataMinus <= '0';
    wait for 70 ns;
    computerDataPlus <= '0';
    computerDataMinus <= '1';
    wait for 70 ns;
    computerDataPlus <= '1';
    computerDataMinus <= '0';
    wait for 70 ns;
    computerDataPlus <= '0';
    computerDataMinus <= '1';
    wait for 70 ns;
    computerDataPlus <= '1';
    computerDataMinus <= '0';
    wait for 70 ns;
    computerDataPlus <= '0';
    computerDataMinus <= '1';
    wait for 70 ns;
    computerDataPlus <= '1';
    computerDataMinus <= '0';
    wait for 70 ns;
    computerDataPlus <= '0';
    computerDataMinus <= '1';
    wait for 70 ns;
    computerDataPlus <= '1';
    computerDataMinus <= '0';
    wait for 70 ns;
    computerDataPlus <= '0';
    computerDataMinus <= '1';
    wait for 70 ns;
    computerDataPlus <= '1';
    computerDataMinus <= '0';
    wait for 70 ns;
    computerDataPlus <= '0';
    computerDataMinus <= '1';
    wait for 70 ns;
    computerDataPlus <= '1';
    computerDataMinus <= '0';
    wait for 70 ns;
    computerDataPlus <= '0';
    computerDataMinus <= '1';
    wait for 70 ns;
    computerDataPlus <= '1';
    computerDataMinus <= '0';
    wait for 70 ns;
    computerDataPlus <= '0';
    computerDataMinus <= '1';
    wait for 70 ns;
    computerDataPlus <= '1';
    wait for 700 ns;

  end process;
end TEST;