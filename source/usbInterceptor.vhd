-- $Id: $
-- File name:   usbInterceptor.vhd
-- Created:     4/8/2012
-- Author:      John Wyant
-- Lab Section: 337-02
-- Version:     1.0  Initial Design Entry
-- Description: Runs data from the USB to the computer and intercepts the handshake when the intercept flag is thrown to output usb 1.1.


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity usbInterceptor is
 port ( usbClk, rst, intercept, usbDataPlus, usbDataMinus, usbLock, clk, eop: in std_logic;
        usbDataPlusOutput, usbDataMinusOutput : out std_logic);
end usbInterceptor;

architecture behavioral of usbInterceptor is
   type stateType is (idle, waitState, bit0, bit1, bit2, bit3, bit4, eop_wait, eop_found);
   signal state, nextstate : stateType;
   signal usbInt1,usbInt2 : std_logic;
   signal nextEopReg,eopReg, usbDataPlusSync,usbDataPlusSync2,usbDataMinusSync,usbDataMinusSync2,nextUsbDataPlusOutputReg,nextUsbDataMinusOutputReg,usbDataPlusOutputReg,usbDataMinusOutputReg : std_logic;
   signal cntr, nextCntr : std_logic_vector ( 4 downto 0 );
begin
usbDataMinusOutput <= usbDataMinusOutputReg; -- shifts output register to the output
usbDataPlusOutput <= usbDataPlusOutputReg;
nextEopReg <= eop;
 
 greg : process ( rst, clk )
 begin
   if rst = '0' then -- resets all registers
     usbDataPlusOutputReg <= '1'; -- register for usb output
     usbDataMinusOutputReg <= '0';
     state <= idle; -- next state logic for outputting USB 1.1
     cntr <= (others => '0'); --cntr for next state logic
     usbDataPlusSync <= '1'; -- synchronizer for usb data line
     usbDataMinusSync <= '0';
     usbDataPlusSync2 <= '1';
     usbDataMinusSync2 <= '0';
     eopReg <= '0'; -- end of packet register
     usbInt2 <= '0'; -- usb clock detection
     usbInt1 <= '0';
   elsif clk'event and clk = '1' then -- updates all registers
     usbInt2 <= usbInt1;
     usbInt1 <= usbClk;
     state <= nextstate;
     cntr <= nextCntr;
     eopReg <= nextEopReg;
     usbDataMinusOutputReg <= nextUsbDataMinusOutputReg;
     usbDataPlusOutputReg <= nextUsbDataPlusOutputReg;
     if usbInt2 = '0' and usbInt1 = '1' then -- if it is a USB clock cycle it updates the usb synchronizers
       usbDataPlusSync <= usbDataPlus;
       usbDataMinusSync <= usbDataMinus;
       usbDataPlusSync2 <= usbDataPlusSync;
       usbDataMinusSync2 <= usbDataMinusSync;
     end if;
   end if;
 end process greg;

 -- change usb data description FSM
 logic : process (eopReg,usbDataPlusOutputReg,usbDataMinusOutputReg,eop,cntr,intercept,usbDataPlusSync,usbInt1,usbInt2,usbDataMinusSync,usbDataPlusSync2,usbDataMinusSync2,state,usbLock,usbDataPlus,usbDataMinus)
 begin
   
    if usbLock = '1' and eop = '0' then -- if the usb output is locked and it is not an end of packet it outputs the usb dataline to the computer
     nextUsbDataPlusOutputReg <= usbDataPlusOutputReg;
     nextUsbDataMinusOutputReg <= usbDataMinusOutputReg;
   elsif usbLock = '1' and eop = '1' then -- if the usb output is locked and an end of packet is detected it outputs end of packet
     nextUsbDataPlusOutputReg <= '0';
     nextUsbDataMinusOutputReg <= '0';
   else -- otherwise it outputs idle
     nextUsbDataPlusOutputReg <= '1';
     nextUsbDataMinusOutputReg <= '0';
   end if;
   
   nextState <= state; -- latch prevention
   nextCntr <= cntr;
     
   case state is
     when idle =>
       if intercept = '1' then -- if an intercept is detected -> enter cycle to output USB 1.1
         nextstate <= waitState;
       end if;
       nextCntr <= (others => '0');

       if usbLock = '1' and usbInt2 = '0' and usbInt1 = '1' then -- if usb is locket and usb clock cycle
         if (usbDataPlusSync2 = '1' and usbDataPlusSync = '0') or (usbDataPlusSync2 = '0' and usbDataPlusSync = '1') then -- if the usb data line swapped, swap the output
           nextUsbDataPlusOutputReg <= not usbDataPlusSync2;
         else 
           nextUsbDataPlusOutputReg <= usbDataPlusSync2;
         end if;
         
         if (usbDataMinusSync2 = '1' and usbDataMinusSync = '0') or (usbDataMinusSync2 = '0' and usbDataMinusSync = '1') then -- if the usb data line swapped, swap the output
           nextUsbDataMinusOutputReg <= not usbDataMinusSync2;
         else
           nextUsbDataMinusOutputReg <= usbDataMinusSync2;
         end if;
       end if;
       
       -- waits for 2 bytes in data packet on bus
       when waitState =>
         if cntr = "10001" then
           nextstate <= bit0;
           nextCntr <= (others => '0');
         end if;
         
         if usbInt2 = '0' and usbInt1 = '1' then
           nextCntr <= cntr + 1;
           if (usbDataPlusSync2 = '1' and usbDataPlusSync = '0') or (usbDataPlusSync2 = '0' and usbDataPlusSync = '1') then
             nextUsbDataPlusOutputReg <= not usbDataPlusOutputReg;
           else 
             nextUsbDataPlusOutputReg <= usbDataPlusOutputReg;
           end if;
           if (usbDataMinusSync2 = '1' and usbDataMinusSync = '0') or (usbDataMinusSync2 = '0' and usbDataMinusSync = '1') then
             nextUsbDataMinusOutputReg <= not usbDataMinusOutputReg;
           else
             nextUsbDataMinusOutputReg <= usbDataMinusOutputReg;
           end if;
         end if;
         
        -- sends seven zeros on bus 
       when  bit0 =>
         if cntr = "00111" then
           nextstate <= bit1;
           nextCntr <= (others => '0');
         elsif usbInt2 = '0' and usbInt1 = '1' then
           nextCntr <= cntr + 1;
           nextUsbDataMinusOutputReg <= not usbDataMinusOutputReg;
           nextUsbDataPlusOutputReg <= not usbDataPlusOutputReg;
         end if;
         
        -- sends 1 on bus    
       when  bit1 =>
         if cntr = "00001" then
           nextstate <= bit2;
           nextCntr <= (others => '0');
         elsif usbInt2 = '0' and usbInt1 = '1' then
           nextCntr <= cntr + 1; 
           nextUsbDataMinusOutputReg <= usbDataMinusOutputReg;
           nextUsbDataPlusOutputReg <= usbDataPlusOutputReg;
         end if;
    
       -- sends 3 zeros on bus
       when  bit2 =>
         if cntr = "00011" then
           nextstate <= bit3;
           nextCntr <= (others => '0');
         elsif usbInt2 = '0' and usbInt1 = '1' then
           nextCntr <= cntr + 1;
           nextUsbDataMinusOutputReg <= not usbDataMinusOutputReg;
           nextUsbDataPlusOutputReg <= not usbDataPlusOutputReg; 
         end if;
       
       -- sends 1 on bus
       when  bit3 =>
         if cntr = "00001" then
           nextstate <= bit4;
           nextCntr <= (others => '0');
         elsif usbInt2 = '0' and usbInt1 = '1' then
           nextCntr <= cntr + 1;  
           nextUsbDataMinusOutputReg <= usbDataMinusOutputReg;
           nextUsbDataPlusOutputReg <= usbDataPlusOutputReg; 
         end if;
    
       -- sends 4 zeros on bus
       when  bit4 =>
         if cntr = "00100" then
           nextstate <= eop_wait;
           nextCntr <= (others => '0');
         elsif usbInt2 = '0' and usbInt1 = '1' then
           nextCntr <= cntr + 1;
           nextUsbDataMinusOutputReg <= not usbDataMinusOutputReg;
           nextUsbDataPlusOutputReg <= not usbDataPlusOutputReg; 
         end if;
       
       -- follows the output register and flips when bus driver flips  
       when eop_wait =>
       if (eop = '0') then
         if usbInt2 = '0' and usbInt1 = '1' then
         if (usbDataPlusSync2 = '1' and usbDataPlusSync = '0') or (usbDataPlusSync2 = '0' and usbDataPlusSync = '1') then
           nextUsbDataPlusOutputReg <= not usbDataPlusOutputReg;
         else 
           nextUsbDataPlusOutputReg <= usbDataPlusOutputReg;
         end if;
         
         if (usbDataMinusSync2 = '1' and usbDataMinusSync = '0') or (usbDataMinusSync2 = '0' and usbDataMinusSync = '1') then
           nextUsbDataMinusOutputReg <= not usbDataMinusOutputReg;
         else
           nextUsbDataMinusOutputReg <= usbDataMinusOutputReg;
         end if;
       end if;
       else 
         nextCntr <= cntr + 1;
         if cntr = "0011" then
           nextState <= eop_found;
           nextCntr <= (others => '0');
         end if;
       end if;
       
       -- waits until eop ends before going to idle again, outputs default of '0' on both lines
       when eop_found =>
         nextUsbDataPlusOutputReg <= UsbDataPlus;
         nextUsbDataMinusOutputReg <= UsbDataMinus;
       if (eop = '0') then
         nextCntr <= cntr + 1;
         if cntr = "0011" then
         nextState <= idle;
       end if;
       end if;
         
    
   end case;
 end process logic;
end architecture;
