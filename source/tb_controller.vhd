-- $Id: $
-- File name:   tb_controller.vhd
-- Created:     4/10/2012
-- Author:      Spencer Julian
-- Lab Section: 337-02
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_controller is
generic (Period : Time := 10 ns;
	 USB : Time := 100 ns);
end tb_controller;

architecture TEST of tb_controller is

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

  component controller
    PORT(
                clk                 : in  std_logic;
                rst                            : in  std_logic;
                usb_clock           : in  std_logic;
                fifo_full           : in  std_logic;
                fifo_empty          : in  std_logic;
                decoder_instruction : in  std_logic_vector(3 downto 0);
                addr_ready          : in  std_logic;
                data_ready          : in  std_logic_vector(1 downto 0);
                eop_found           : in  std_logic;
                sd_transmit             : in  std_logic;
                sd_enable           : out std_logic; -- active low
                sd_clock            : out std_logic;
                fifo_read           : out std_logic;
                fifo_write               : out std_logic;
                gregister_read       : out std_logic;
                intercept           : out std_logic
    );
  end component;
  
--  procedure send_byte( signal sda : inout std_logic;
--                       signal scl : inout std_logic;
--                       signal byte : in std_logic_vector(7 downto 0)) is
--  begin  
--  end procedure send_byte;

	
-- Insert signals Declarations here
-- signal <name> : <type>;
signal  clk                 :  std_logic;
signal  rst                 :  std_logic;
signal  usb_clock           :  std_logic;
signal  fifo_full           :  std_logic;
signal  fifo_empty          :  std_logic;
signal  decoder_instruction :  std_logic_vector(3 downto 0);
signal  addr_ready          :  std_logic;
signal  data_ready          :  std_logic_vector(1 downto 0);
signal  eop_found           :  std_logic;
signal  sd_transmit         :  std_logic;
signal  sd_enable           : std_logic; -- active low
signal  sd_clock            : std_logic;
signal  fifo_read           : std_logic;
signal  fifo_write          : std_logic;
signal  gregister_read       : std_logic;
signal  intercept           : std_logic;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: controller port map(
                clk => clk,
		rst => rst,
		usb_clock => usb_clock,
		fifo_full => fifo_full,
		fifo_empty => fifo_empty,
		decoder_instruction => decoder_instruction,
		addr_ready => addr_ready,
		data_ready => data_ready,
		eop_found => eop_found,
		sd_transmit => sd_transmit,
		sd_enable => sd_enable,
		sd_clock => sd_clock,
		fifo_read => fifo_read,
		fifo_write => fifo_write,
		gregister_read => gregister_read,
		intercept => intercept
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process
  begin
-- Insert TEST BENCH Code Here

	--usb_clock, fifo_full, fifo_empty, decoder_instruction, addr_read, data_read, eop_found, sd_transmit
	
	--currently just testing for correct state transitions.
	fifo_empty <= '0';
	usb_clock <= '0';
	decoder_instruction <= "1101";
	wait for USB*4;
	decoder_instruction <= "1001";
	wait for USB*4;
	decoder_instruction <= "1011";
	wait for 3*Period;
	--The above would be an interception. Now for a data read...
	data_ready <= "01";
	decoder_instruction <= "0011"; --Test with correct PID
	for i in 0 to 7 loop
	 usb_clock <= '1';
	 wait for USB/2;
	 usb_clock <= '0';
	 wait for USB/2;
	end loop;
	decoder_instruction <= "0000"; --Incorrect PID
	data_ready <= "11";
	wait for Period;
	data_ready <= "00";
	eop_found <= '1';
	wait for Period;
	decoder_instruction <= "0011"; --Again, correct PID, this time with something in the FIFO
	data_ready <= "01";
	wait for Period;
	for i in 0 to 7 loop
	  usb_clock <= '1';
	  sd_transmit <= '1';
	  wait for Period;
	  sd_transmit <= '0';
	  wait for USB/2;
	  usb_clock <= '0';
	  wait for USB/2;
	end loop;
	data_ready <= "11";
	fifo_empty <= '1';
	decoder_instruction <= "0000"; --Again, incorrect PID
	wait for Period;
	fifo_empty <= '0';
	data_ready <= "00";
	eop_found <= '1';
	for i in 0 to 7 loop
	   usb_clock <= '1';
	   sd_transmit <= '1';
	   wait for Period;
  	  sd_transmit <= '0';
	   usb_clock <= '1';
	   wait for USB/2;
	   usb_clock <= '0';
	   wait for USB/2;
	end loop;
	fifo_empty <= '1';
	
wait;

  end process;
end TEST;
