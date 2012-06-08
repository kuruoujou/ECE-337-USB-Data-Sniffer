-- $Id: $
-- File name:   tb_sniffer_top.vhd
-- Created:     4/19/2012
-- Author:      David Kauer
-- Lab Section: 337-02
-- Version:     1.0  Initial Test Bench

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_sniffer_top is
  generic(
    CLK_PERIOD : Time := 7 ns;
    USBCLK_PERIOD : Time := 84 ns
  );
end tb_sniffer_top;

architecture TEST of tb_sniffer_top is
  
  -- NRZI encode function
  function encode(dataUSB : std_logic; orgData : std_logic) return std_logic is
    variable result : std_logic;
  begin
  if orgData = '0' then -- invert
	    result := not dataUSB;
	else  -- orgData = '1' then stay the same
	    result := dataUSB;
	end if;
	return result;
	end;
  
  constant NUM_PACKETS	: natural := 33;	
	
	type busPacket is
		record
			-- Test Packet Fields
			sync  : std_logic_vector(7 downto 0); -- sync field
			pid   : std_logic_vector(7 downto 0); -- PID field
			addr  : std_logic_vector(6 downto 0); -- Address field
			endp  : std_logic_vector(3 downto 0); -- Endpoint field
			data  : std_logic_vector(63 downto 0); -- Data field (8 bytes for low speeds - actual data lengths may vary but padding is added to ensure 8 byte transfers)
			crc5  : std_logic_vector(4 downto 0); -- Cyclic Redundancy Checks (token packets = 5 bits, data packets = 16 bits)
			crc16 : std_logic_vector(15 downto 0);
	--  eop   : std_logic_vector(1 downto 0); -- end of packet (+0;-0)				 							

		end record;
	
	type busPacketArray is array(0 to NUM_PACKETS-1) of busPacket;
	
	-- test vectors -> packets on the USB bus
	constant	busPackets : busPacketArray := (	
	-- Sync        PID       ADDR     ENDP          DATA         CRC5    CRC16  EOP --
	
	-- Test 1 : Intercept USB 3.0 handshake and convert to 1.1
	-- Computer requests USB device description
	("10000000","10110100","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 1 : Setup Token
	("10000000","11000011","0000001","0000",x"8000000080008000","00000",x"0000"),	-- Packet 2 : Data0 Packet (request description)
  ("10000000","01001011","0000001","0000",x"0000000000000000","00000",x"0000"), -- Packet 3 : Ack from device
  
  -- USB sends device description
  ("10000000","10010110","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 1 : In Token
  ("10000000","11010010","0000001","0000",x"FF00000F0300F0F0","00000",x"0000"),	-- Packet 2 : Data1 Packet (send description USB 3.0)
  ("10000000","01001011","0000001","0000",x"0000000000000000","00000",x"0000"), -- Packet 3 : Ack from host
  
  -- Transaction Check
  ("10000000","10000111","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 1 : Out Token
  ("10000000","11010010","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 2 : Data1 Packet (zero length)
  ("10000000","01001011","0000001","0000",x"0000000000000000","00000",x"0000"), -- Packet 3 : Ack from device
  
  -- Test 2 : Intercept USB 2.0 handshake and convert to 1.1
  -- Computer requests USB device description
	("10000000","10110100","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 1 : Setup Token
	("10000000","11000011","0000001","0000",x"8000000080008000","00000",x"0000"),	-- Packet 2 : Data0 Packet (request description)
  ("10000000","01001011","0000001","0000",x"0000000000000000","00000",x"0000"), -- Packet 3 : Ack from device
  
  -- USB sends device description
  ("10000000","10010110","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 1 : In Token
  ("10000000","11010010","0000001","0000",x"FF00000F0200F0F0","00000",x"0000"),	-- Packet 2 : Data1 Packet (send description USB 3.0)
  ("10000000","01001011","0000001","0000",x"0000000000000000","00000",x"0000"), -- Packet 3 : Ack from host
  
  -- Transaction Check
  ("10000000","10000111","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 1 : Out Token
  ("10000000","11010010","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 2 : Data1 Packet (zero length)
  ("10000000","01001011","0000001","0000",x"0000000000000000","00000",x"0000"), -- Packet 3 : Ack from device
  
  
   -- Test 3 : Data is sent from Device to Host  
  ("10000000","10010110","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 1 : In Token
	("10000000","11010010","0000001","0000",x"deadbeefdeadbeef","00000",x"0000"),	-- Packet 2 : Data1 Packet (data from device)
  ("10000000","01001011","0000001","0000",x"0000000000000000","00000",x"0000"), -- Packet 3 : Ack from host
  
   -- Test 4 : Data is sent from Device to Host  
  ("10000000","10010110","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 1 : In Token
	("10000000","11010010","0000001","0000",x"AAABBBCCCDDDEEEF","00000",x"0000"),	-- Packet 2 : Data1 Packet (data from device)
  ("10000000","01001011","0000001","0000",x"0000000000000000","00000",x"0000"), -- Packet 3 : Ack from host
  
   -- Test 5 : Data is sent from Device to Host  
  ("10000000","10010110","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 1 : In Token
	("10000000","11010010","0000001","0000",x"FFF9998887776665","00000",x"0000"),	-- Packet 2 : Data1 Packet (data from device)
  ("10000000","01001011","0000001","0000",x"0000000000000000","00000",x"0000"), -- Packet 3 : Ack from host
  
   -- Test 6 : Data is sent from Device to Host  
  ("10000000","10010110","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 1 : In Token
	("10000000","11010010","0000001","0000",x"1010101010f00730","00000",x"0000"),	-- Packet 2 : Data1 Packet (data from device)
  ("10000000","01001011","0000001","0000",x"0000000000000000","00000",x"0000"), -- Packet 3 : Ack from host
  
   -- Test 7 : Data is sent from Host to Device 
  ("10000000","10000111","0000001","0000",x"0000000000000000","00000",x"0000"),	-- Packet 1 : Out Token
	("10000000","11010010","0000001","0000",x"1337933244881122","00000",x"0000"),	-- Packet 2 : Data1 Packet (data from host)
  ("10000000","01001011","0000001","0000",x"0000000000000000","00000",x"0000")  -- Packet 3 : Ack from device
  
  );
  
  
  
  -- PROCEDURES --
  
  -- **TOKENS** --
     -- SYNC
     -- PID
     -- ADDR
     -- ENDP
     -- CRC
     -- EOP
     
  -- tokens should always be coming from the host
  procedure token_packet(	signal dataPlusUsb_signal   : inout std_logic;
	                        signal dataMinusUsb_signal  : inout std_logic;
	                        signal dataPlusComp_signal  : inout std_logic;
	                        signal dataMinusComp_signal : inout std_logic;
	                        signal sync                 : in std_logic_vector(7 downto 0);
	                        signal pid                  : in std_logic_vector(7 downto 0);
	                        signal addr                 : in std_logic_vector(6 downto 0);
	                        signal endp                 : in std_logic_vector(3 downto 0);
	                        signal crc5                 : in std_logic_vector(4 downto 0)
	                       -- signal eop                  : in std_logic_vector(1 downto 0);
	                      ) is
	begin
	report "token";
	dataPlusUsb_signal <= 'H';
  dataMinusUsb_signal <= 'L';
  
  -- send SYNC (LSB first)
  for i in 0 to 7 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,sync(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,sync(i));
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- send PID
  for i in 0 to 7 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,pid(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,pid(i));
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- send ADDR
  for i in 0 to 6 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,addr(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,addr(i));
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- send ENDP
  for i in 0 to 3 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,endp(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,endp(i));
  wait for USBCLK_PERIOD;
  end loop; 
  
  -- send CRC5
  for i in 0 to 4 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,crc5(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,crc5(i));
  wait for USBCLK_PERIOD;
  end loop;   
  
  -- send EOP (D+ and D- driven low for 2 bus cycles)
  for i in 0 to 1 loop
  dataPlusComp_signal <= '0';
  dataMinusComp_signal <= '0';
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- bus goes idle after transfer
  dataPlusComp_signal <= 'H';
  dataMinusComp_signal <= 'L';
  dataPlusUsb_signal <= 'H';
  dataMinusUsb_signal <= 'L';
  wait for 2*USBCLK_PERIOD;
	end procedure token_packet;
	
	
  
  -- **DATA PACKETS** --
     -- SYNC
	   -- PID
	   -- DATA
	   -- CRC
	   -- EOP

  -- Data Packet from Device
  procedure DEVICEdata_packet(	signal dataPlusUsb_signal   : inout std_logic;
	                             signal dataMinusUsb_signal  : inout std_logic;
	                             signal dataPlusComp_signal  : inout std_logic;
	                             signal dataMinusComp_signal : inout std_logic;
	                             signal sync                 : in std_logic_vector(7 downto 0);
	                             signal pid                  : in std_logic_vector(7 downto 0);
	                             signal data                 : in std_logic_vector(63 downto 0);
	                             signal crc16                : in std_logic_vector(15 downto 0)
	                           ) is
	begin
	report "DEVICEdata_packet";
	dataPlusComp_signal <= 'H';
  dataMinusComp_signal <= 'L';  
	  
	-- send SYNC (LSB first)
  for i in 0 to 7 loop
  dataPlusUsb_signal <= encode(dataPlusUsb_signal,sync(i));
  dataMinusUsb_signal <= not encode(dataPlusUsb_signal,sync(i));
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- send PID
  for i in 0 to 7 loop
  dataPlusUsb_signal <= encode(dataPlusUsb_signal,pid(i));
  dataMinusUsb_signal <= not encode(dataPlusUsb_signal,pid(i));
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- send DATA
  for i in 0 to 63 loop
  report "device data";
  dataPlusUsb_signal <= encode(dataPlusUsb_signal,data(i));
  dataMinusUsb_signal <= not encode(dataPlusUsb_signal,data(i));
  wait for USBCLK_PERIOD;
  end loop;   

  -- send CRC16
  for i in 0 to 15 loop
  dataPlusUsb_signal <= encode(dataPlusUsb_signal,crc16(i));
  dataMinusUsb_signal <= not encode(dataPlusUsb_signal,crc16(i));
  wait for USBCLK_PERIOD;
  end loop;   
  
  -- send EOP (D+ and D- driven low for 2 bus cycles)
  for i in 0 to 1 loop
  dataPlusUsb_signal <= '0';
  dataMinusUsb_signal <= '0';
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- bus goes idle after transfer
  dataPlusUsb_signal <= 'H';
  dataMinusUsb_signal <= 'L';
  dataPlusComp_signal <= 'H';
  dataMinusComp_signal <= 'L';
  wait for 2*USBCLK_PERIOD;
	end procedure DEVICEdata_packet;
	
	
	-- Data Packet from Host
	procedure HOSTdata_packet(	signal dataPlusUsb_signal   : inout std_logic;
	                           signal dataMinusUsb_signal  : inout std_logic;
	                           signal dataPlusComp_signal  : inout std_logic;
	                           signal dataMinusComp_signal : inout std_logic;
	                           signal sync                 : in std_logic_vector(7 downto 0);
	                           signal pid                  : in std_logic_vector(7 downto 0);
	                           signal data                 : in std_logic_vector(63 downto 0);
	                           signal crc16                : in std_logic_vector(15 downto 0)
	                         ) is
	begin
	report "HOSTdata_packet";
	dataPlusUsb_signal <= 'H';
  dataMinusUsb_signal <= 'L';
  
  -- send SYNC (LSB first)
  for i in 0 to 7 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,sync(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,sync(i));
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- send PID
  for i in 0 to 7 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,pid(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,pid(i));
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- send DATA
  for i in 0 to 63 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,data(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,data(i));
  wait for USBCLK_PERIOD;
  end loop;   
  
  -- send CRC16
  for i in 0 to 15 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,crc16(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,crc16(i));
  wait for USBCLK_PERIOD;
  end loop;   
  
  -- send EOP (D+ and D- driven low for 2 bus cycles)
  for i in 0 to 1 loop
  dataPlusComp_signal <= '0';
  dataMinusComp_signal <= '0';
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- bus goes idle after transfer
  dataPlusComp_signal <= 'H';
  dataMinusComp_signal <= 'L';
  dataPlusUsb_signal <= 'H';
  dataMinusUsb_signal <= 'L';
  wait for 2*USBCLK_PERIOD;
	end procedure HOSTdata_packet;
	
	-- Zero Length Data Packet from Host (transmission check)
	procedure HOSTdatazero_packet(	signal dataPlusUsb_signal   : inout std_logic;
	                           signal dataMinusUsb_signal  : inout std_logic;
	                           signal dataPlusComp_signal  : inout std_logic;
	                           signal dataMinusComp_signal : inout std_logic;
	                           signal sync                 : in std_logic_vector(7 downto 0);
	                           signal pid                  : in std_logic_vector(7 downto 0);
	                           signal data                 : in std_logic_vector(63 downto 0);
	                           signal crc16                : in std_logic_vector(15 downto 0)
	                         ) is
	begin
	report "HOSTdata_packet";
	dataPlusUsb_signal <= 'H';
  dataMinusUsb_signal <= 'L';
  
  -- send SYNC (LSB first)
  for i in 0 to 7 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,sync(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,sync(i));
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- send PID
  for i in 0 to 7 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,pid(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,pid(i));
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- send CRC16
  for i in 0 to 15 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,crc16(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,crc16(i));
  wait for USBCLK_PERIOD;
  end loop;   
  
  -- send EOP (D+ and D- driven low for 2 bus cycles)
  for i in 0 to 1 loop
  dataPlusComp_signal <= '0';
  dataMinusComp_signal <= '0';
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- bus goes idle after transfer
  dataPlusComp_signal <= 'H';
  dataMinusComp_signal <= 'L';
  dataPlusUsb_signal <= 'H';
  dataMinusUsb_signal <= 'L';
  wait for 2*USBCLK_PERIOD;
	end procedure HOSTdatazero_packet;
	
	
	-- **ACK/NACK PACKETS** -- 
     -- SYNC
	   -- PID
	   -- EOP
	   
	-- ACK/NACK Packet from Device
	procedure DEVICEack_packet(	signal dataPlusUsb_signal   : inout std_logic;
	                            signal dataMinusUsb_signal  : inout std_logic;
	                            signal dataPlusComp_signal  : inout std_logic;
	                            signal dataMinusComp_signal : inout std_logic;
	                            signal sync                 : in std_logic_vector(7 downto 0);
	                            signal pid                  : in std_logic_vector(7 downto 0)
	                          ) is
	begin
	report "DEVICEack_packet";
	dataPlusComp_signal <= 'H';
  dataMinusComp_signal <= 'L';
	
	-- send SYNC (LSB first)
  for i in 0 to 7 loop
  dataPlusUsb_signal <= encode(dataPlusUsb_signal,sync(i));
  dataMinusUsb_signal <= not encode(dataPlusUsb_signal,sync(i));
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- send PID
  for i in 0 to 7 loop
  dataPlusUsb_signal <= encode(dataPlusUsb_signal,pid(i));
  dataMinusUsb_signal <= not encode(dataPlusUsb_signal,pid(i));
  wait for USBCLK_PERIOD;
  end loop;   
  
  -- send EOP (D+ and D- driven low for 2 bus cycles)
  for i in 0 to 1 loop
  dataPlusUsb_signal <= '0';
  dataMinusUsb_signal <= '0';
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- bus goes idle after transfer
  dataPlusUsb_signal <= 'H';
  dataMinusUsb_signal <= 'L';
  dataPlusComp_signal <= 'H';
  dataMinusComp_signal <= 'L';
  wait for 2*USBCLK_PERIOD;
	end procedure DEVICEack_packet;
	
	
	-- ACK/NACK Packet from Host
	procedure HOSTack_packet(	signal dataPlusUsb_signal   : inout std_logic;
	                          signal dataMinusUsb_signal  : inout std_logic;
	                          signal dataPlusComp_signal  : inout std_logic;
	                          signal dataMinusComp_signal : inout std_logic;
	                          signal sync                 : in std_logic_vector(7 downto 0);
	                          signal pid                  : in std_logic_vector(7 downto 0) 
	                         ) is               
	                       
	begin
	report "HOSTack_packet";
	dataPlusUsb_signal <= 'H';
  dataMinusUsb_signal <= 'L';
  
  -- send SYNC (LSB first)
  for i in 0 to 7 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,sync(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,sync(i));
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- send PID
  for i in 0 to 7 loop
  dataPlusComp_signal <= encode(dataPlusComp_signal,pid(i));
  dataMinusComp_signal <= not encode(dataPlusComp_signal,pid(i));
  wait for USBCLK_PERIOD;
  end loop;   
  
  -- send EOP (D+ and D- driven low for 2 bus cycles)
  for i in 0 to 1 loop
  dataPlusComp_signal <= '0';
  dataMinusComp_signal <= '0';
  wait for USBCLK_PERIOD;
  end loop;  
  
  -- bus goes idle after transfer
  dataPlusComp_signal <= 'H';
  dataMinusComp_signal <= 'L';
  dataPlusUsb_signal <= 'H';
  dataMinusUsb_signal <= 'L';
  wait for 2*USBCLK_PERIOD;
	end procedure HOSTack_packet;
		

  component sniffer_top
    PORT(
         clk : IN std_logic;
         rst : IN std_logic;
         dataOut : OUT std_logic;
         scl : OUT std_logic;
         sd_enable : OUT std_logic;
         dataMinusComputer : INOUT std_logic;
         dataMinusUsb : INOUT std_logic;
         dataPlusComputer : INOUT std_logic;
         dataPlusUsb : INOUT std_logic
    );
  end component;

  -- internal signals
  signal clk : std_logic;
  signal rst : std_logic;
  signal dataOut : std_logic;
  signal scl : std_logic;
  signal sd_enable : std_logic;
  signal dataMinusComputer : std_logic;
  signal dataMinusUsb : std_logic;
  signal dataPlusComputer : std_logic;
  signal dataPlusUsb : std_logic;
  signal tb_sync : std_logic_vector(7 downto 0);
  signal tb_pid : std_logic_vector(7 downto 0);
  signal tb_addr : std_logic_vector(6 downto 0);
  signal tb_endp : std_logic_vector(3 downto 0);
  signal tb_data : std_logic_vector(63 downto 0);
  signal tb_crc5 : std_logic_vector(4 downto 0);
  signal tb_crc16 : std_logic_vector(15 downto 0);
  signal packetNum : integer := 0;
  


begin
  
  -- system clock generator
  CLKGEN : process
    begin
    clk <= '1';
    wait for CLK_PERIOD/2;
    clk <= '0';
    wait for CLK_PERIOD/2;
  end process;
  
  DUT: sniffer_top port map(
                clk => clk,
                rst => rst,
                dataOut => dataOut,
                scl => scl,
                sd_enable => sd_enable,
                dataMinusComputer => dataMinusComputer,
                dataMinusUsb => dataMinusUsb,
                dataPlusComputer => dataPlusComputer,
                dataPlusUsb => dataPlusUsb
                );
                
-- assign record values to test bench signals
tb_sync  <= busPackets(packetNum).sync;
tb_pid   <= busPackets(packetNum).pid;
tb_addr  <= busPackets(packetNum).addr;
tb_endp  <= busPackets(packetNum).endp;
tb_data  <= busPackets(packetNum).data;
tb_crc5  <= busPackets(packetNum).crc5;
tb_crc16 <= busPackets(packetNum).crc16;

-- simulate USB Bus
process
  begin
    -- run for 1 ms
    
    -- default
    dataPlusComputer <= 'H';
    dataMinusComputer <= 'L';
    dataPlusUsb <= 'H';
    dataMinusUsb <= 'L';
    packetNum <= 0;
    
    -- restart system
    rst <= '0';
    wait for 7 ns;
    rst <= '1'; 
    wait for USBCLK_PERIOD;
    
    report "Test1";
    -- Test 1
    -- Computer requests USB device description
    token_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_addr,tb_endp,tb_crc5);
    packetNum <= packetNum + 1;
    HOSTdata_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_data,tb_crc16);
    packetNum <= packetNum + 1;
    DEVICEack_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid);
    packetNum <= packetNum + 1;
    
    -- USB sends device description
    token_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_addr,tb_endp,tb_crc5);
    packetNum <= packetNum + 1;
    DEVICEdata_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_data,tb_crc16);
    packetNum <= packetNum + 1;
    HOSTack_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid);
    packetNum <= packetNum + 1;
    
    -- Transaction Check
    token_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_addr,tb_endp,tb_crc5);
    packetNum <= packetNum + 1;
    HOSTdatazero_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_data,tb_crc16);
    packetNum <= packetNum + 1;
    DEVICEack_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid);
    packetNum <= packetNum + 1;
    
    
    dataPlusComputer <= 'H';
    dataMinusComputer <= 'L';
    dataPlusUsb <= 'H';
    dataMinusUsb <= 'L';
    
    wait for 25 us;
    
    
    -- restart system
    rst <= '0';
    wait for 7 ns;
    rst <= '1'; 
    
    wait for 25 us;
    
    wait for USBCLK_PERIOD;
    
    report "Test2";
    -- Test 2
    -- Computer requests USB device description
    token_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_addr,tb_endp,tb_crc5);
    packetNum <= packetNum + 1;
    HOSTdata_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_data,tb_crc16);
    packetNum <= packetNum + 1;
    DEVICEack_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid);
    packetNum <= packetNum + 1;
    
    -- USB sends device description
    token_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_addr,tb_endp,tb_crc5);
    packetNum <= packetNum + 1;
    DEVICEdata_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_data,tb_crc16);
    packetNum <= packetNum + 1;
    HOSTack_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid);
    packetNum <= packetNum + 1;
    
    -- Transaction Check
    token_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_addr,tb_endp,tb_crc5);
    packetNum <= packetNum + 1;
    HOSTdatazero_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_data,tb_crc16);
    packetNum <= packetNum + 1;
    DEVICEack_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid);
    packetNum <= packetNum + 1;
    
    wait for 50 us;
    
    report "Test3";
    -- Test 3
    -- Device sends data to Host 
    token_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_addr,tb_endp,tb_crc5);
    packetNum <= packetNum + 1;
    DEVICEdata_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_data,tb_crc16);
    packetNum <= packetNum + 1;
    HOSTack_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid);
    packetNum <= packetNum + 1;
    
    wait for 50 us;
    
    report "Test4";
    -- Test 4
    -- Device sends data to Host 
    token_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_addr,tb_endp,tb_crc5);
    packetNum <= packetNum + 1;
    DEVICEdata_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_data,tb_crc16);
    packetNum <= packetNum + 1;
    HOSTack_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid);
    packetNum <= packetNum + 1;
    
    wait for 50 us;
    
    report "Test5";
    -- Test 5
    -- Device sends data to Host 
    token_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_addr,tb_endp,tb_crc5);
    packetNum <= packetNum + 1;
    DEVICEdata_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_data,tb_crc16);
    packetNum <= packetNum + 1;
    HOSTack_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid);
    packetNum <= packetNum + 1;
    
   
   wait for 400 us;
   
    report "Test6";
    -- Test 6
    -- Device sends data to Host 
    token_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_addr,tb_endp,tb_crc5);
    packetNum <= packetNum + 1;
    DEVICEdata_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_data,tb_crc16);
    packetNum <= packetNum + 1;
    HOSTack_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid);
    packetNum <= packetNum + 1;
   
    report "Test7";
    -- Test 7
    -- Host sends data to Device
    token_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_addr,tb_endp,tb_crc5);
    packetNum <= packetNum + 1;
    HOSTdata_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid,tb_data,tb_crc16);
    packetNum <= packetNum + 1;
    DEVICEack_packet(dataPlusUsb,dataMinusUsb,dataPlusComputer,dataMinusComputer,tb_sync,tb_pid);
   -- packetNum <= packetNum + 1;
    
    
    
  
    report "end";
    wait;

  end process;
end TEST;