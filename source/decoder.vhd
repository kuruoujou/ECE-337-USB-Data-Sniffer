Library IEEE;

use IEEE.STD_LOGIC_1164.all;

-- TOP level of the decoder block. 
-- contains: SEE_det, NRZI decode, shift_greg, timer
-- also contains a top-level state machine to coordinate all the blocks.

ENTITY decoder is
  port(clk, rst, data0, data1:in STD_LOGIC; -- data0 = data+, data1 = data-
     halt: in STD_LOGIC; -- Halt when intercept is in progress. No need to decode our data.
     data: out STD_LOGIC_VECTOR(1 downto 0); -- 00 indicates IDLE, 01 indicated recieving valid data, 11 indicates valid data received.
     inst: out STD_LOGIC_VECTOR(3 downto 0); -- decoded PID. let the other blocks know what kind of packet this is.
     data_out: out STD_LOGIC_VECTOR(7 downto 0); -- output data to all other blocks
     dclk: out STD_LOGIC; -- data clock. divide the device clock to data rate and resynchronize if necessary. Also let interceptor to work correctly.
     eopOut : out STD_LOGIC -- OUTPUT EOP detected
);
  
end decoder;

architecture BLK of decoder is
  
  component SEE_det
    port(clk, rst, data0, data1: in STD_LOGIC;
     EGDE, F_EGDE:OUT STD_LOGIC; 
     EOP: OUT STD_LOGIC
    );
  end component;
  
  component NRZIdecode
    port(clk, rst, data0: IN STD_LOGIC; -- data0 = data+, data1 = data-, clk goes to normal clock
      enable: IN STD_LOGIC;
      EOP: IN STD_LOGIC;
      data_out: OUT STD_LOGIC
    );
  end component;
  
  component shift_greg
    port(clk, rst, shift_en, data_in: IN STD_LOGIC;
      data_out: out STD_LOGIC_VECTOR(7 downto 0);
      data_ready: out STD_LOGIC
    );
  end component;
  
  component timer
    port(clk, rst:IN STD_LOGIC;
      egde_det, f_egde_det, EOP:IN STD_LOGIC;
      data_clk: OUT STD_LOGIC;
      --NRZI_en: OUT STD_LOGIC;
      shift_en:OUT STD_LOGIC
    );
  end component;
  
  -- internal signal
  signal egde, fegde, act_data: STD_LOGIC;
  signal data_buf: STD_LOGIC_VECTOR(7 downto 0);
  signal eop: STD_LOGIC;
  signal shift_enable: STD_LOGIC; -- shift data in and update NRZI decoder
  signal data_ready: STD_LOGIC;
  
  -- output signal
  signal cur_sync, nxt_sync: STD_LOGIC;
  signal cur_data, nxt_data: STD_LOGIC_VECTOR(1 downto 0);
  signal cur_inst, nxt_inst: STD_LOGIC_VECTOR(3 downto 0);
  signal cur_addr, nxt_addr: STD_LOGIC;
  signal data_ready_0, data_ready_1: STD_LOGIC;
 
  type states is (IDLE, SYNCS, WAIT1, PID, WAITADDR, TRANSA, WAITDATA, TRANSD, INTER, HALTS);
    signal CS, NS: states;
  
  
  begin
    eopOut <= eop;
    data <= cur_data;
    inst <= cur_inst;
   -- address <= cur_addr;
    data_out <= data_buf;
    seq1:process(clk, rst)
    begin
      if rst = '0' then
        CS <= IDLE;
        cur_sync <= '0';
        cur_inst <= x"0";
        cur_data <= "00";
        cur_addr <= '0';
        data_ready_0 <= '0';
        data_ready_1 <= '0';
      elsif (clk'event AND clk = '1') then
        CS <= NS;
        cur_data <= nxt_data;
        cur_addr <= nxt_addr;
        cur_inst <= nxt_inst;
        cur_sync <= nxt_sync;
        data_ready_0 <= data_ready;
        data_ready_1 <= data_ready_0;
        
      end if;
    end process; -- reset - clock process. 
    
    seq2:process(CS, data_ready_0, data_ready_1, halt, data_buf, EOP)
    begin
      NS <= CS;
      case CS is
      when IDLE => -- IDLE state when nothing is on the BUS or just waiting for a non-data packet to pass.
        if (data_ready_0 = '1' AND data_ready_1 = '0') then
          NS <= SYNCS;
        end if;
      when SYNCS => -- Sync state, after receive the 1st byte , check if it is SYNC.
        if data_buf = x"80" then -- sync match
          NS <= WAIT1;
        else
          NS <= IDLE;
        end if;
      when WAIT1 => -- if it is SYNC, wait for the next packet.
        if (data_ready_0 = '1' AND data_ready_1 = '0') then
          NS <=  PID;
        end if;
      when PID => -- the byte following should be PID. decode the PID in this state.
        if (data_buf = x"87" OR data_buf = x"96" OR data_buf = x"A5" OR data_buf = x"B4") then
          NS <= WAITADDR;
        elsif (data_buf = x"C3" OR data_buf = x"D2" OR data_buf = x"E1" OR data_buf = x"F0") then
          NS <= WAITDATA;
        else
          NS <= IDLE;
        end if;
      when WAITADDR => -- if it is a token, wait for it and give the PID out to controller
        if EOP = '1' then
          NS <= IDLE;
        elsif (data_ready_0 = '1' AND data_ready_1 = '0') then
          NS <= TRANSA;
        end if;
      when TRANSA => -- token received and being transfered to other blocks
        if EOP = '1' then
          NS <= IDLE;
        else
          NS <= WAITADDR; -- Unless EOP detected, otherwise keep transfer the TOKEN block.
        end if;
      when WAITDATA => -- if it is a datapacket, wait for data byte being transferred.
        if EOP = '1' then 
          NS <= IDLE;
        elsif halt = '1' then 
          NS <= HALTS; -- within data state, interceptor might work. Thus this machine will go to HALT state unless EOP found.
        elsif (data_ready_0 = '1' AND data_ready_1 = '0') then
          NS <= TRANSD; -- if data byte recieved, process it.
        end if;
      when TRANSD => -- keep receiving data byte unless EOP found.
        if EOP = '1' then
          NS <= IDLE;
        elsif halt = '1' then
          NS <= HALTS;
        else
          NS <= WAITDATA;
        end if;
      when HALTS => -- HALT the state machine while interceptor is working.
        if EOP = '1' then
          NS <= IDLE;
        end if;
      when others =>
        NS <= IDLE;
      end case;
    end process;
    
    
   
    seq3: process(CS, data_buf)
    begin
      case CS is
      when IDLE =>
        nxt_data <= "00";
        nxt_addr <= '0';
        nxt_sync <= '0';
        nxt_inst <= x"0";
      when SYNCS =>
        nxt_data <= "00";
        nxt_addr <= '0';
        nxt_sync <= '1';
        nxt_inst <= x"0";
      when WAIT1 =>
        nxt_data <= "00";
        nxt_addr <= '0';
        nxt_sync <= '0';
        nxt_inst <= x"0";
      when PID =>
        nxt_data <= "00";
        nxt_addr <= '0';
        nxt_sync <= '0';
        nxt_inst <= data_buf(4) & data_buf(5) & data_buf(6) & data_buf(7); -- USB transfer data LSB first, so re-format the PID. 
      when WAITADDR =>
        nxt_data <= "00";
        nxt_addr <= '0';
        nxt_sync <= '0';
        nxt_inst <= x"0";  
      when TRANSA =>
        nxt_data <= "00";
        nxt_addr <= '1'; -- indicate TOKED is being transferred
        nxt_sync <= '0';
        nxt_inst <= x"0";
      when WAITDATA =>
        nxt_data <= "01"; -- indicate getting a valid data is.
        nxt_addr <= '0';
        nxt_sync <= '0';
        nxt_inst <= x"0";  
      when TRANSD =>
        nxt_data <= "11"; -- indicate the data is ready to transfer out.
        nxt_addr <= '0';
        nxt_sync <= '0';
        nxt_inst <= x"0"; 
      when HALTS =>
        nxt_data <= "00";
        nxt_addr <= '0';
        nxt_sync <= '0';
        nxt_inst <= x"0";
      when others =>
        nxt_data <= "00";
        nxt_addr <= '0';
        nxt_sync <= '0';
        nxt_inst <= x"0";
      end case;
    end process;
       
    
    part2:SEE_det
    port map(
      clk => clk,
      rst => rst,
      data0 => data0,
      data1 => data1,
      EGDE => egde,
      F_EGDE => fegde,
      EOP => eop
    );
    
    part3:NRZIdecode
    port map(
      clk => clk,
      rst => rst,
      data0 => data0,
      enable => shift_enable,
      EOP => eop,
      data_out => act_data
    );
    
    part4:shift_greg
    port map(
      clk => clk, 
      rst => rst, 
      shift_en => shift_enable, 
      data_in => act_data,
      data_out => data_buf,
      data_ready => data_ready
    );
    
    part5:timer
    port map(
      clk => clk, 
      rst => rst,
      egde_det => egde, 
      f_egde_det => fegde,
      EOP => eop,
      data_clk => dclk,
      shift_en => shift_enable
    );
    
    
    
end architecture;
