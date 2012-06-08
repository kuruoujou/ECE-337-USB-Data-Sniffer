-- $Id: $
-- File name:   tristate.vhd
-- Created:     4/8/2012
-- Author:      John Wyant
-- Lab Section: 337-02
-- Version:     1.0  Initial Design Entry
-- Description: Runs the tristate for the bidirectional wires between the usb 
--              and intercept and between the computer and interceptor.


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;


entity tristate is
 port ( lock, interceptorOutput : in std_logic;
        interceptorInput : out std_logic;
        dataLine : inout std_logic);
end tristate;

architecture behavioral of tristate is
  
begin

-- output to bus logic
dataLine <= interceptorOutput when lock = '1'
            else 'Z';
              
-- input from bus logic             
interceptorInput <= '1' when (dataLine = '1' and lock = '0') or lock = '1'
                    else '0';
  

end architecture;