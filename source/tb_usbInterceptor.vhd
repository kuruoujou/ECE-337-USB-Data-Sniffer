-- $Id: $
-- File name:   tb_usbInterceptor.vhd
-- Created:     4/18/2012
-- Author:      John Wyant
-- Lab Section: 337-02
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_usbInterceptor is
generic (Period : Time := 70 ns);
end tb_usbInterceptor;

architecture TEST of tb_usbInterceptor is

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

  component usbInterceptor
    PORT(
         usbClk : in std_logic;
         rst : in std_logic;
         intercept : in std_logic;
         usbDataPlus : in std_logic;
         usbDataMinus : in std_logic;
         usbDataPlusOutput : out std_logic;
         usbDataMinusOutput : out std_logic;
         usbLock : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal usbClk : std_logic;
  signal rst : std_logic;
  signal intercept : std_logic;
  signal usbDataPlus : std_logic;
  signal usbDataMinus : std_logic;
  signal usbDataPlusOutput : std_logic;
  signal usbDataMinusOutput : std_logic;
  signal usbLock : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable usbClk_tmp: std_logic := '0';
begin
  usbClk_tmp := not usbClk_tmp;
  usbClk <= usbClk_tmp;
  wait for Period/2;
end process;

  DUT: usbInterceptor port map(
                usbClk => usbClk,
                rst => rst,
                intercept => intercept,
                usbDataPlus => usbDataPlus,
                usbDataMinus => usbDataMinus,
                usbDataPlusOutput => usbDataPlusOutput,
                usbDataMinusOutput => usbDataMinusOutput,
                usbLock => usbLock
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst <= '1';
    intercept <= '0';
    usbDataPlus <= '1';
    usbDataMinus <= '1';
    wait for 70 ns;
    rst <= '0';
    wait for 70 ns;
    rst <= '1';
    usbDataPlus <= '0';
    wait for 70 ns;
    usbDataPlus <= '1';
    usbDataMinus <= '0';
    wait for 70 ns;
    usbDataPlus <= '0';
    usbDataMinus <= '1';
    wait for 70 ns;
    usbDataPlus <= '1';
    usbDataMinus <= '0';
    wait for 70 ns;
    intercept <= '1';
    usbDataPlus <= '0';
    usbDataMinus <= '1';
    wait for 70 ns;
    intercept <= '0';
    wait for 1050 ns;
    usbDataPlus <= '0';
    usbDataMinus <= '1';
    wait for 70 ns;
    usbDataPlus <= '1';
    usbDataMinus <= '0';
    wait for 140 ns;
    usbDataPlus <= '0';
    usbDataMinus <= '1';
    wait for 70 ns;
    usbDataPlus <= '1';
    usbDataMinus <= '0';
    wait for 70 ns;
    usbDataPlus <= '0';
    usbDataMinus <= '1';
    wait for 70 ns;
    usbDataPlus <= '1';
    usbDataMinus <= '0';
    wait for 70 ns;
    usbDataPlus <= '0';
    usbDataMinus <= '1';
    wait for 70 ns;
    usbDataPlus <= '1';
    usbDataMinus <= '0';
    wait for 70 ns;
    usbDataPlus <= '0';
    usbDataMinus <= '1';
    wait for 70 ns;
    usbDataPlus <= '1';
    usbDataMinus <= '0';
    wait for 70 ns;
    usbDataPlus <= '0';
    usbDataMinus <= '1';
    wait for 70 ns;
    usbDataPlus <= '1';
    usbDataMinus <= '0';
    wait for 70 ns;
    usbDataPlus <= '0';
    usbDataMinus <= '1';
    wait for 70 ns;
    usbDataPlus <= '1';
    usbDataMinus <= '0';
    wait for 70 ns;
    usbDataPlus <= '0';
    usbDataMinus <= '1';
    wait for 70 ns;
    usbDataPlus <= '1';
    usbDataMinus <= '0';
    wait for 70 ns;
    usbDataPlus <= '0';
    usbDataMinus <= '1';
    wait for 70 ns;
    usbDataPlus <= '1';
    usbDataMinus <= '0';
    wait for 70 ns;
    usbDataPlus <= '0';
    usbDataMinus <= '1';
    wait for 70 ns;
    usbDataPlus <= '1';
    wait for 7000 ns;

  end process;
end TEST;