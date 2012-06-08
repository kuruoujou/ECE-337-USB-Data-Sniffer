-- $Id: $
-- File name:   computerInterceptor.vhd
-- Created:     4/8/2012
-- Author:      John Wyant
-- Lab Section: 337-02
-- Version:     1.0  Initial Design Entry
-- Description: Runs the data line between the interceptor and the computer.


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity computerInterceptor is
 port ( usbClk, rst, computerDataPlus, computerDataMinus, computerLock, clk, eop: in std_logic;
        computerDataPlusOutput, computerDataMinusOutput : out std_logic);
end computerInterceptor;

architecture behavioral of computerInterceptor is
   signal usbInt1,usbInt2 : std_logic;
   signal eopInt1,eopInt2,computerDataPlusSync, computerDataMinusSync, nextComputerLock, nextComputerDataPlusOutput, nextComputerDataMinusOutput : std_logic;
begin

 greg : process ( rst, clk )
 begin
   if rst = '0' then --resets all registers
     computerDataMinusOutput <= '0'; --resets output to USB device
     computerDataPlusOutput <= '1'; --resets output to USB device
     computerDataPlusSync <= '1'; --resets sync for computer input
     computerDataMinusSync <= '0'; --resets sync for computer input
     usbInt2 <= '0'; --resets idle detection
     usbInt1 <= '1'; --resets idle detection
     eopInt1 <= '0'; --resets end of packet sync
     eopInt2 <= '0'; --resets end of packet sync
   elsif clk'event and clk = '1' then --updates all registers
     usbInt2 <= usbInt1;
     usbInt1 <= usbClk;
     computerDataPlusSync <= computerDataPlus;
     computerDataMinusSync <= computerDataMinus;
     eopInt1 <= eop;
     eopInt2 <= eopInt1;
     if (usbInt2 = '0' and usbInt1 = '1') or (eop = '1') then --if the input goes idle or an end of pack is detected
       computerDataMinusOutput <= nextComputerDataMinusOutput; --then it updates the output (lines output up with USB clock)
       computerDataPlusOutput <= nextComputerDataPlusOutput;
    end if;
    if (eopInt1 = '0' and eopInt2 = '1') then --when the end of packet shows idle the output should go idle
      computerDataPlusOutput <= '1';
      computerDataMinusOutput <= '0';
    end if;
 end if;
 end process greg;


 logic : process (eop,computerDataPlusSync,computerDataMinusSync,computerLock) --state
 begin
   
   if computerLock = '1' and eop = '0' then -- if the lock is for the computer to run then the input should be prepared to shift into the output
     nextComputerDataPlusOutput <= computerDataPlusSync;
     nextComputerDataMinusOutput <= computerDataMinusSync;
   elsif computerLock = '1' and eop = '1' then -- if it is an end of packet the output line needs to be prepared for end of packet
     nextComputerDataPlusOutput <= '0';
     nextComputerDataMinusOutput <= '0';
   else
     nextComputerDataPlusOutput <= '1'; -- otherwise the output needs to be prepared to go idle
     nextComputerDataMinusOutput <= '0';
   end if;
     
 end process logic;
end architecture;