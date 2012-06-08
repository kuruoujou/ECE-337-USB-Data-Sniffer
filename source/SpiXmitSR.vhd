-- $Id: $
-- File name:   ShiftRegister.vhd
-- Created:     2/29/2012
-- Author:      David Kauer
-- Lab Section: 2
-- Version:     1.0  Initial Design Entry
-- Description: Parameterizable Shift Register

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity SpiXmitSR is
  generic(
    srWidth: integer := 8
  );
  port
	(
	  clk         : in std_logic;
		resetN      :	in	std_logic;
		tsrEnable   :	in	std_logic;
		tsrLoad     : in std_logic;
		tsrData     : in std_logic_vector(srWidth-1 downto 0);
		dataOut     : out std_logic
	);
end entity SpiXmitSR;

architecture SpiXmitSR_arch of SpiXmitSR is
  signal tsrDummyReg,nextTsrDummyReg,tsrDataReg,nextTsrDataReg : std_logic_vector(srWidth-1 downto 0);
  signal load1, load2, load: std_logic;
begin
  GREG: process(clk,resetN)
  begin
    if resetN = '0' then
      tsrDataReg <= (others => '1');
      tsrDummyReg <= (others => '1');
      load2 <= '0';
      load1 <= '0';
      load <= '0';
    elsif rising_edge(clk) then
      tsrDataReg <= nextTsrDataReg; -- shifts SR 
      tsrDummyReg <= nextTsrDummyReg;
      if (load2 = '0' and load1 = '1') then
        load <= '1';
      else
        load <= '0';
      end if;
      load2 <= load1;
      load1 <= tsrLoad;
    end if;
  end process;
  
 	-- Next State Logic
	nextTsrDataReg	<= tsrDataReg(srWidth-2 downto 0) & tsrDummyReg(0) when tsrEnable = '1'
	                  else tsrData when load = '1'
	                  else tsrDataReg; 
	                    
	nextTsrDummyReg <= tsrData when load = '1'
	                   else tsrDummyReg;
	
  -- Output Logic
  dataOut <= tsrDataReg(7);
  
end architecture SpiXmitSR_arch;
