Library IEEE;

use IEEE.STD_LOGIC_1164.all;

-- this block decode the Non-Return-to-Zero Inverted encoded data on USB bus.
ENTITY NRZIdecode is
  port(clk, rst, data0: IN STD_LOGIC; -- data0 = data+, data1 = data-, clk goes to normal clock
    enable: IN STD_LOGIC; -- when this line is high (for a clock cycle), the decoder will be updated for the current value on the BUS. Thus this line should only be high after a successful data shift in.
    EOP: IN STD_LOGIC; -- END of Packet, tell the block to stop itself.
    data_out: OUT STD_LOGIC -- the decoded data.
    );
    
end NRZIdecode;

architecture NRZI of NRZIdecode is
  signal data0_buf0: STD_LOGIC;
  --signal nxt_data_out: STD_LOGIC;
  
  begin
    seq1: process(clk, rst, data0, enable)
    begin
      if rst = '0' then
        data_out <= '1'; -- PAY attention here! go back to IDLE, not 0
        data0_buf0 <= '1';  -- so as the data buffer.
      elsif (clk'event and clk = '1') then
        if EOP = '1' then
          data0_buf0 <= '1'; -- idle high
        else
          if data0 = data0_buf0 then
            data_out <= '1'; -- NRZI decoding by XOR logic on every clock cycle.
          else 
            data_out <= '0'; -- NRZI decoding by XOR logic on every clock cycle.
          end if;
        end if;
      end if;
      if enable = '1' then
          data0_buf0 <= data0; -- update stored value 
      end if;
    end process;
    

  end architecture;
