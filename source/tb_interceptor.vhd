-- $Id: $
-- File name:   tb_interceptor.vhd
-- Created:     4/19/2012
-- Author:      John Wyant
-- Lab Section: 337-02
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_interceptor is
generic (Period : Time := 70 ns;
         CLK_PERIOD : Time := 10 ns);
end tb_interceptor;

architecture TEST of tb_interceptor is

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

  component interceptor
    PORT(
         clk : IN std_logic;
         intercept : IN std_logic;
         rst : IN std_logic;
         usbClk : IN std_logic;
         dataMinusComputer : INOUT std_logic;
         dataMinusUsb : INOUT std_logic;
         dataPlusComputer : INOUT std_logic;
         dataPlusUsb : INOUT std_logic;
         dataPlus : out std_logic;
         dataMinus : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal intercept : std_logic;
  signal rst : std_logic;
  signal usbClk : std_logic;
  signal dataMinusComputer : std_logic;
  signal dataMinusUsb : std_logic;
  signal dataPlusComputer : std_logic;
  signal dataPlusUsb : std_logic;
  signal dataPlus : std_logic;
  signal dataMinus : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable usbClk_tmp: std_logic := '0';
begin
  usbClk_tmp := not usbClk_tmp;
  usbClk <= usbClk_tmp;
  wait for Period/2;
end process;

CLKGEN2: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for CLK_PERIOD/2;
end process;

  DUT: interceptor port map(
                clk => clk,
                intercept => intercept,
                rst => rst,
                usbClk => usbClk,
                dataMinusComputer => dataMinusComputer,
                dataMinusUsb => dataMinusUsb,
                dataPlusComputer => dataPlusComputer,
                dataPlusUsb => dataPlusUsb,
                dataPlus => dataPlus,
                dataMinus => dataMinus
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    intercept <= '0';
    rst <= '1';
    dataMinusComputer <= '1';
    dataPlusComputer <= '1';
    dataMinusUsb <= '1';
    dataPlusUsb <= '1';
    wait for 350 ns;
    rst <= '0';
    wait for 70 ns;
    rst <= '1';
    wait for 340 ns;
    
    -- usb driving bus
    dataPlusUsb <= '1';
    dataMinusUsb <= '0';
    wait for 70 ns;
    dataPlusUsb <= '0';
    dataMinusUsb <= '1';
    wait for 70 ns;
    dataMinusComputer <= 'Z';
    dataPlusComputer <= 'Z';
    dataPlusUsb <= '1';
    dataMinusUsb <= '0';
    wait for 70 ns;
    dataPlusUsb <= '1';
    dataMinusUsb <= '0';
    wait for 70 ns;
    intercept <= '1';
    dataPlusUsb <= '0';
    dataMinusUsb <= '1';
    wait for 70 ns;
    intercept <= '0';
    dataPlusUsb <= '1';
    dataMinusUsb <= '0';
    wait for 70 ns;
    dataPlusUsb <= '0';
    dataMinusUsb <= '1';
    wait for 70 ns;
    dataPlusUsb <= '1';
    dataMinusUsb <= '0';
    wait for 70 ns;
    dataPlusUsb <= '0';
    dataMinusUsb <= '1';
    wait for 70 ns;
    dataPlusUsb <= '1';
    dataMinusUsb <= '0'; -- SIX ZEROS
    wait for 70 ns;
    dataPlusUsb <= '0';
    dataMinusUsb <= '1';
    wait for 70 ns;
    dataPlusUsb <= '1';
    dataMinusUsb <= '0';
    wait for 70 ns;
    dataPlusUsb <= '0';
    dataMinusUsb <= '1';
    wait for 70 ns;
    dataPlusUsb <= '1';-- TEN ZEROS
    dataMinusUsb <= '0';
    wait for 70 ns;
    dataPlusUsb <= '1';
    dataMinusUsb <= '0';
    wait for 70 ns;
    dataPlusUsb <= '0';
    dataMinusUsb <= '1';
    wait for 70 ns;
    dataPlusUsb <= '1';
    dataMinusUsb <= '0';
    wait for 70 ns;
    dataPlusUsb <= '0';
    dataMinusUsb <= '1';
    wait for 70 ns;
    dataPlusUsb <= '1';
    dataMinusUsb <= '0';
    wait for 70 ns;
    dataPlusUsb <= '0';
    dataMinusUsb <= '1';
    wait for 350 ns;
    dataPlusUsb <= '1';
    dataMinusUsb <= '0';
    wait for 210 ns;
    dataPlusUsb <= '1';
    dataMinusUsb <= '1';
    wait for 140 ns;
    dataMinusComputer <= '1';
    dataPlusComputer <= '1';
    
    wait for 210 ns;
    
    -- intercept driving bus to usb
    dataPlusComputer <= '1';
    dataMinusComputer <= '1';
    dataPlusUsb <= '1';
    dataMinusUsb <= '1';
    wait for 70 ns; 
    dataPlusComputer <= '1';
    dataMinusComputer <= '0';
    wait for 70 ns;
    dataPlusComputer <= '0';
    dataMinusComputer <= '1';
    wait for 70 ns;
    dataPlusUsb <= 'Z';
    dataMinusUsb <= 'Z';
    dataPlusComputer <= '1';
    dataMinusComputer <= '0';
    wait for 70 ns;
    dataPlusComputer <= '0';
    dataMinusComputer <= '1';
    wait for 70 ns;
    dataPlusComputer <= '1';
    dataMinusComputer <= '1';
    wait for 140 ns;
    dataPlusUsb <= '1';
    dataMinusUsb <= '1';
    
    -- test interceptor commands
    
    
    wait;

  end process;
end TEST;