Library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Timing the entire decoding sequence blocks.
-- provide a proper speed data clock for the interceptor to output data at the same speed as USB.

ENTITY timer is
  port(clk, rst:IN STD_LOGIC;
  egde_det, f_egde_det, EOP:IN STD_LOGIC; -- edge use to re-synchronize the timer, falling edge start the timer, EOP ends the timer.
  data_clk:OUT STD_LOGIC; -- output proper data clock
  shift_en:OUT STD_LOGIC -- enable shifting for shift register AND update the NRZI decoder.
  );
end timer;



architecture FSM of timer is
type states is (P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12);
  signal CS, NS: states;
  signal dclk_cur, dclk_nxt: STD_LOGIC;
  signal cur_shift_en, nxt_shift_en: STD_LOGIC;
  
begin
  shift_en <= cur_shift_en;
  data_clk <= dclk_cur;
  
  seq1:process(clk, rst)
  begin
    if rst = '0' then
      -- reset here
      cur_shift_en <= '0';
      dclk_cur <= '0';
      CS <= P0;
    elsif (clk'event and clk = '1') then
      CS <= NS;
      cur_shift_en <= nxt_shift_en;
      dclk_cur <= dclk_nxt;
    end if;
    

    
  end process;
  
  seq2:process(CS, f_egde_det, egde_det, EOP)
  begin
    NS <= CS;
    case CS is
    when P0 =>
      if f_egde_det = '1' then
        NS <= P1;
      else
        NS <= P0;
      end if;
    when P1 =>
      if egde_det = '1' then
        NS <= P1; -- resynchronize
      elsif EOP = '1' then
        NS <= P0; -- end of packed, return and wait for new SYNC
      else
        NS <= P2; -- move forward
      end if;
    when P2 =>
      if egde_det = '1' then
        NS <= P1; -- resynchronize
      elsif EOP = '1' then
        NS <= P0; -- end of packed, return and wait for new SYNC
      else
        NS <= P3; -- move forward
      end if;
    when P3 =>
      if egde_det = '1' then
        NS <= P1; -- synchronize
      elsif EOP = '1' then
        NS <= P0; -- end of packed, return and wait for new SYNC
      else
        NS <= P4; -- move forward
      end if;
    when P4 =>
      if egde_det = '1' then
        NS <= P1; -- resynchronize
      elsif EOP = '1' then
        NS <= P0; -- end of packed, return and wait for new SYNC
      else
        NS <= P5; -- move forward
      end if;
    when P5 =>
      if egde_det = '1' then
        NS <= P1; -- resynchronize
      elsif EOP = '1' then
        NS <= P0; -- end of packed, return and wait for new SYNC
      else
        NS <= P6; -- move forward
      end if;
    when P6 =>
      if egde_det = '1' then
        NS <= P1; -- resynchronize
      elsif EOP = '1' then
        NS <= P0; -- end of packed, return and wait for new SYNC
      else
        NS <= P7; -- move forward
      end if;
    when P7 =>
      if egde_det = '1' then
        NS <= P1; -- resynchronize
      elsif EOP = '1' then
        NS <= P0; -- end of packed, return and wait for new SYNC
      else
        NS <= P8; -- move forward
      end if;
    when P8 =>
      if egde_det = '1' then
        NS <= P1; -- resynchronize
      elsif EOP = '1' then
        NS <= P0; -- end of packed, return and wait for new SYNC
      else
        NS <= P9; -- move forward
      end if;
    when P9 =>
      if egde_det = '1' then
        NS <= P1; -- resynchronize
      elsif EOP = '1' then
        NS <= P0; -- end of packed, return and wait for new SYNC
      else
        NS <= P10; -- move forward
      end if;
    when P10 =>
      if egde_det = '1' then
        NS <= P1; -- resynchronize
      elsif EOP = '1' then
        NS <= P0; -- end of packed, return and wait for new SYNC
      else
        NS <= P11; -- move forward
      end if;
    when P11 =>
      if egde_det = '1' then
        NS <= P1; -- resynchronize
      elsif EOP = '1' then
        NS <= P0; -- end of packed, return and wait for new SYNC
      else
        NS <= P12; -- move forward
      end if;
    when P12 =>
      if egde_det = '1' then
        NS <= P1; -- resynchronize
      elsif EOP = '1' then
        NS <= P0; -- end of packed, return and wait for new SYNC
      else
        NS <= P1; -- move forward, NOTICE not back to P0, which is a lock state
      end if;
    
    end case;
  end process;
  
  seq3: process(CS)
  begin
    case CS is
    when P0 =>
      dclk_nxt <= '0';
      nxt_shift_en <= '0';
    when P1 =>
      dclk_nxt <= '1'; -- data clock stay high until the middle of packet.
      nxt_shift_en <= '0';
    when P2 =>
      dclk_nxt <= '1'; -- data clock stay high until the middle of packet.
      nxt_shift_en <= '0';
    when P3 =>
      dclk_nxt <= '1'; -- data clock stay high until the middle of packet.
      nxt_shift_en <= '0';
    when P4 =>
      nxt_shift_en <= '1'; -- shift in data at the middle of the entire data packet (a little forward since out clock is slightly less than 12 times faster than USB data.)
      dclk_nxt <= '1'; -- data clock stay high until the middle of packet.
    when P5 =>
      nxt_shift_en <= '0';
      dclk_nxt <= '1'; -- data clock stay high until the middle of packet.
    when P6 =>
      nxt_shift_en <= '0';
      dclk_nxt <= '1'; -- data clock stay high until the middle of packet.
    when others =>
      nxt_shift_en <= '0';
      dclk_nxt <= '0';
    end case;
  end process;
end architecture;

    
