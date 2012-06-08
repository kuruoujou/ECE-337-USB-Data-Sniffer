-- $Id: $
-- File name:   tb_tristate.vhd
-- Created:     4/19/2012
-- Author:      John Wyant
-- Lab Section: 337-02
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_tristate is
end tb_tristate;

architecture TEST of tb_tristate is

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

  component tristate
    PORT(
         lock : in std_logic;
         interceptorInput : out std_logic;
         interceptorOutput : in std_logic;
         dataLine : inout std_logic
    );
  end component;

-- Insert signals Declarations here
  signal lock : std_logic;
  signal interceptorInput : std_logic;
  signal interceptorOutput : std_logic;
  signal dataLine : std_logic;

-- signal <name> : <type>;

begin
  DUT: tristate port map(
                lock => lock,
                interceptorInput => interceptorInput,
                interceptorOutput => interceptorOutput,
                dataLine => dataLine
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here
    
    
    -- interceptor drives bus
    lock <= '1';
    interceptorOutput <= '1';
    dataLine <= 'Z';
    wait for 70 ns;
    interceptorOutput <= '0';
    wait for 70 ns;
    interceptorOutput <= '1';
    wait for 70 ns;
    interceptorOutput <= '0';
    wait for 70 ns;
    interceptorOutput <= '1';
    
    -- usb drives bus
    lock <= '0';
    dataLine <= '1';
    wait for 70 ns;
    dataLine <= '0';
    wait for 70 ns;
    dataLine <= '1';
    wait for 70 ns;
    dataLine <= '0';
    
    -- interceptor drives bus
    lock <= '1';
    dataLine <= 'Z';
    wait for 70 ns;
    
  end process;
end TEST;