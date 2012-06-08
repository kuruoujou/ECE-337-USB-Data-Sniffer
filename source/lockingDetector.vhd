-- $Id: $
-- File name:   lockingDetector.vhd
-- Created:     4/8/2012
-- Author:      John Wyant
-- Lab Section: 337-02
-- Version:     1.0  Initial Design Entry
-- Description: Runs the data lines until a handshake is occurring. When the USB version is about to come up the lines are cut until the interceptor has injected the correct version.


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity lockingDetector is
  port ( endOfPacket, rst : in std_logic;
         clk : in std_logic;
         inst : in std_logic_vector ( 3 downto 0 );
         usbLock : out std_logic;
         computerLock : out std_logic);
end lockingDetector;

architecture behavioral of lockingDetector is
  type stateType is (idle, preIdle, lockUsb,ackUsb, lockComp, ackComp, unknown, ackUnknown);
  signal state, nextState : stateType;
  signal nlocku, locku, nlockc, lockc : std_logic;
  signal eopIn1, eopIn2, eopFound : std_logic;
  begin
    
    greg : process ( clk, rst )
    begin
      if rst = '0' then
        state <= idle;
        lockc <= '1';
        computerLock <= '1';
        locku <= '0';
        usbLock <= '0';
        eopIn1 <= '0';
        eopIn2 <= '0';
      elsif clk'event and clk = '1' then
        if eopIn1 = '0' and eopIn2 = '1' then
          eopFound <= '1';
        else
          eopFound <= '0';
        end if;
        eopIn1 <= endOfPacket;
        eopIn2 <= eopIn1;
        state <= nextState;
        computerLock <= lockc;
        usbLock <= locku;
        lockc <= nlockc;
        locku <= nlocku;
      end if;
    end process;
    
    logic : process ( state, inst, eopFound, lockc, locku,endOfPacket,eopIn1,eopIn2)
    begin
       nlockc <= '1';
          nlocku <= '0';

      case state is 
        --depending on the command sent from the controller - locks the appropriate side to allow output
        when idle =>
          if (inst = "0000") then nextState <= idle;
          elsif (inst = "0001" or inst = "1101" or inst = "0101") then nextState <= lockComp;
          elsif (inst = "1001") then nextState <= lockUsb;
          else nextState <= unknown;
          end if;
          nlockc <= '1';
          nlocku <= '0';
        --maintains the appropriate lock until an end of packet is detected
        when preIdle =>
          if (eopFound = '1') then nextState <= idle;
          else nextState <= preIdle;
          end if;
          nlockc <= lockc;
          nlocku <= locku;
        --changes the lock so that the usb outputs
        when lockUsb =>
          if (eopFound = '1') then nextState <= ackUsb;
            nlockc <= '0';
            nlocku <= '1';
          else nextState <= lockUsb;
            nlockc <= lockc;
            nlocku <= locku;
          end if;
        -- waits until the usb device has finished acking before switching the lock back to computer output
        when ackUsb =>
          if (eopFound = '1') then nextState <= preIdle;
            nlockc <= '1';
            nlocku <= '0';
          else nextState <= ackUsb;
            nlockc <= lockc;
            nlocku <= locku;
          end if;
        --changes the lock so that the computer outputs
        when lockComp =>
          if (eopFound = '1') then nextState <= ackComp;
            nlockc <= '1';
            nlocku <= '0';
          else nextState <= lockComp;
            nlockc <= lockc;
            nlocku <= locku;
          end if;
        -- waits until the usb device has finished acking before switching the lock back to usb output
        when ackComp =>
          if (eopFound = '1') then nextState <= preIdle;
            nlockc <= '0';
            nlocku <= '1';
          else nextState <= ackComp;
            nlockc <= lockc;
            nlocku <= locku;
          end if;
        -- in the event of an unknown state it maintains current locks until an end of packet is detected
        when unknown =>
          if (eopFound = '1') then nextState <= ackUnknown;
          else nextState <= unknown;
          end if;
          nlockc <= lockc;
          nlocku <= locku;
        -- in the event of an unknown state it waits for an end of packet before switching locks
        when ackUnknown =>
          if (eopFound = '1') then nextState <= preIdle;
            nlockc <= not lockc;
            nlocku <= not locku;
          else nextState <= ackUnknown;
            nlockc <= lockc;
            nlocku <= locku;
          end if;

      when others => nextstate <= idle;
      end case;
    end process;
  end architecture;