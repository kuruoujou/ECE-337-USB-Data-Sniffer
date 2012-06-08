Library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- this block will detect edge on the USB data BUS, start condition of a packet(falling edge) and end of packet.
ENTITY SEE_det is
port(clk, rst, data0, data1: in STD_LOGIC; -- data0 = data+, data1 = data-
     EGDE: OUT STD_LOGIC; -- general egde for everything
     F_EGDE: OUT STD_LOGIC; -- falling egde for starting condition
     EOP: OUT STD_LOGIC -- end of packet dtection
    );
end SEE_det; 

architecture SOP_EOP of SEE_det is
signal cur_EOP, nxt_EOP: STD_LOGIC;
signal cur_EGDE, nxt_EGDE: STD_LOGIC;
signal cur_FEGDE, nxt_FEGDE: STD_LOGIC; -- flip flop all output signals
signal d1, d2: STD_LOGIC;  -- input edge detection flip-flop

begin

EGDE <= cur_EGDE;
F_EGDE <= cur_FEGDE;
EOP <= cur_EOP;

  
  seq1:process(clk, rst) -- overall process for clock
  begin
    if rst = '0' then
      cur_EOP <= '0';
      cur_EGDE <= '0';
      cur_FEGDE <= '0';
      d1 <= '1';
      d2 <= '1';
    elsif (clk'event AND clk = '1') then
      d1 <= data0;
      d2 <= d1;
      cur_EOP <= nxt_EOP;
      cur_EGDE <= nxt_EGDE;
      cur_FEGDE <= nxt_FEGDE;
    end if;
  end process;

  nxt_EGDE <= d1 XOR d2 when rst = '1' else '0'; -- edge detection, for re-synchronizing signals
  nxt_FEGDE <= d2 AND (NOT d1) when rst = '1' else '0'; -- falling edge only
  nxt_EOP <= data0 NOR data1 when rst = '1' else '0'; -- since USB will not keep sending EOP, so a combinational will be sufficient.
 
end architecture;
