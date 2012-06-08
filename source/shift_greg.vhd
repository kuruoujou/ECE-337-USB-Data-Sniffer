Library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


-- Simple 8-bit shift register. Same as the one in Lab 5 except no STOP bit necessary. 
ENTITY shift_greg is
  port(clk, rst, shift_en, data_in: IN STD_LOGIC;
    data_out: out STD_LOGIC_VECTOR(7 downto 0);
    data_ready: out STD_LOGIC
  );
end ENTITY;

architecture shift of shift_greg is
 signal pre_val, nxt_val: STD_LOGIC_VECTOR(7 downto 0);
 signal cnt, nxt_cnt: STD_LOGIC_VECTOR(2 downto 0);
 signal nxt_data_ready, cur_data_ready: STD_LOGIC;
 begin 
   
  se1: process(clk, rst)
  begin
    if rst = '0' then
      pre_val <= x"00";
      cur_data_ready <= '0';
      cnt <= "000";
    elsif (clk'event and clk = '1') then
      pre_val <= nxt_val;
      cnt <= nxt_cnt;
      cur_data_ready <= nxt_data_ready;
    end if;
  end process;
  
  nxt_data_ready <= '1' when (cnt = "000" AND rst = '1') else '0';
  nxt_val <= data_in & pre_val(7 downto 1)  when shift_en = '1'
         else pre_val;
  nxt_cnt <= cnt + 1 when shift_en = '1' else cnt;
  data_out <= pre_val;
  data_ready <= cur_data_ready;
end architecture;
