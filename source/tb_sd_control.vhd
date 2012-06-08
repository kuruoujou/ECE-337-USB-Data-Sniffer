-- $Id: $
-- File name:   tb_sd_control.vhd
-- Created:     4/21/2012
-- Author:      Spencer Julian
-- Lab Section: 337-02
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_sd_control is
generic (Period : Time := 10 ns);
end tb_sd_control;

architecture TEST of tb_sd_control is

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

  component sd_control
    PORT(
         clk : in std_logic;
         rst : in std_logic;
         sd_clock : in std_logic;
         fifo_empty : in std_logic;
         data_in : in std_logic_vector(7 downto 0);
         data_out : out std_logic_vector(7 downto 0);
         clk_mode : out std_logic;
         tsr_load : out std_logic;
         tsr_enable : out std_logic;
         sd_enable : out std_logic;
         clk_enable : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst : std_logic;
  signal sd_clock : std_logic;
  signal fifo_empty : std_logic;
  signal data_in : std_logic_vector(7 downto 0);
  signal data_out : std_logic_vector(7 downto 0);
  signal clk_mode : std_logic;
  signal tsr_load : std_logic;
  signal tsr_enable : std_logic;
  signal sd_enable : std_logic;
  signal clk_enable : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: sd_control port map(
                clk => clk,
                rst => rst,
                sd_clock => sd_clock,
                fifo_empty => fifo_empty,
                data_in => data_in,
                data_out => data_out,
                clk_mode => clk_mode,
                tsr_load => tsr_load,
                tsr_enable => tsr_enable,
                sd_enable => sd_enable,
                clk_enable => clk_enable
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process --sd clock generator
    variable sd_clk_tmp: std_logic := '0';
  begin
    if (clk_enable = '1') then
        sd_clk_tmp := not sd_clock;
        sd_clock <= sd_clk_tmp;
      if (clk_mode = '0') then
        wait for Period*10;
      else
        wait for Period*2;
      end if;
    else
      sd_clk_tmp := '0';
      sd_clock <= sd_clk_tmp;
      wait for Period;
    end if;  
end process;

process

  begin

-- Insert TEST BENCH Code Here

    fifo_empty <= '1'; --Reset ALL THE THINGS.
    data_in <= (others => '0');
    rst <= '0';
    wait for Period;
    rst <= '1'; --Finish reset, insert test data (doesn't matter what it is, just testing output), say fifo is no longer empty
    data_in <= "10101010";
    fifo_empty <= '0';
    wait for Period*10000; --wait for a LOONG time to ensure that we see proper microSD setup, as that's this block's primary challenge.
    fifo_empty <= '1'; --at this point we should have written things. Several times. Claim the fifo is empty now.
    wait; --If that worked, then this should work as expected. TO THE TOP LEVEL!

  end process;
end TEST;
