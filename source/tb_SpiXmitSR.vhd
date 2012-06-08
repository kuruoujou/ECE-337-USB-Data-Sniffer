-- $Id: $
-- File name:   tb_XmitSR.vhd
-- Created:     3/2/2012
-- Author:      David Kauer
-- Lab Section: 2
-- Version:     1.0  Initial Test Bench

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_SpiXmitSR is
  generic
	(
	  srWidth       : integer := 8;
		CLK_PERIOD				: Time := 10 ns
	);
end tb_SpiXmitSR;

architecture TEST of tb_SpiXmitSR is

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

  component SpiXmitSR
    PORT(
         clk : in std_logic;
         resetN : in std_logic;
         tsrEnable : in std_logic;
         shiftCtrl : in std_logic;
         tsrLoad : in std_logic;
         tsrData : in std_logic_vector(srWidth-1 downto 0);
         mosi : out std_logic
    );
  end component;

  signal clk : std_logic;
  signal resetN : std_logic;
  signal tsrEnable : std_logic;
  signal shiftCtrl : std_logic;
  signal tsrLoad : std_logic;
  signal tsrData : std_logic_vector(srWidth-1 downto 0);
  signal mosi : std_logic;

begin
  process
    begin
    clk <= '1';
    wait for CLK_PERIOD/2;
    clk <= '0';
    wait for CLK_PERIOD/2;
  end process;
  
  DUT: SpiXmitSR port map(
                clk => clk,
                resetN => resetN,
                tsrEnable => tsrEnable,
                shiftCtrl => shiftCtrl,
                tsrLoad => tsrLoad,
                tsrData => tsrData,
                mosi => mosi
                );

process
  begin
    -- run for 400 ns
    tsrEnable <= '0';
    shiftCtrl <= '0';
    tsrLoad <= '0';
    tsrData <= "00000000";

   -- Reset System
   resetN <= '0';
   wait for 10 ns;

   resetN <= '1';
   
   -- Load data into SR
   tsrLoad <= '1';
   tsrData <= "10101010";
   wait for 10 ns;
   tsrLoad <= '0';
   
   -- Shift data out
   shiftCtrl <= '1';
   for i in 0 to 7 loop
     tsrEnable <= '1';
     wait for 10 ns;
     tsrEnable <= '0';
     wait for 40 ns;
   end loop;
   shiftCtrl <= '0';
   wait for 10 ns;
   
   -- Load data into SR
   tsrLoad <= '1';
   tsrData <= "11001100";
   wait for 10 ns;
   tsrLoad <= '0';
   
   wait;

  end process;
end TEST;
