-- VHDL Entity my_project1_lib.SpiSlaveFifo.symbol
--
-- Created:
--          by - David Kauer (srge03.ecn.purdue.edu)
--          at - 14:50:18 03/17/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2010.2a (Build 7)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY FifoTop IS
  GENERIC (
      gregLength : integer := 4;
      gregWidth  : integer := 8;
      addrSize  : integer := 2      -- 2^addrSize = gregLength
   );
   PORT( 
      clk       : IN     std_logic;
      rEnable   : IN     std_logic;
      resetN    : IN     std_logic;
      wData     : IN     std_logic_vector (gregWidth-1 DOWNTO 0);
      wEnable   : IN     std_logic;
      fifoEmpty : OUT    std_logic;
      fifoFull  : OUT    std_logic;
      rData     : OUT    std_logic_vector (gregWidth-1 DOWNTO 0)
   );

-- Declarations

END FifoTop ;

--
-- VHDL Architecture my_project1_lib.SpiSlaveFifo.struct
--
-- Created:
--          by - mg147.bin (srge03.ecn.purdue.edu)
--          at - 14:50:18 03/17/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2010.2a (Build 7)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ARCHITECTURE struct OF FifoTop IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL rSel : std_logic_vector(addrSize-1 DOWNTO 0);
   SIGNAL wSel : std_logic_vector(addrSize-1 DOWNTO 0);
   SIGNAL fifoEmpty_internal : std_logic;
   SIGNAL fifoFull_internal  : std_logic;

   -- Component Declarations
   COMPONENT FifoRam
   GENERIC (
      gregLength : integer := 4;
      gregWidth  : integer := 8;
      addrSize  : integer := 2      -- 2^addrSize = gregLength
   );
   PORT (
      clk       : IN     std_logic;
      rSel      : IN     std_logic_vector (addrSize-1 DOWNTO 0);
      resetN    : IN     std_logic;
      wData     : IN     std_logic_vector (gregWidth-1 DOWNTO 0);
      wEnable   : IN     std_logic;
      wSel      : IN     std_logic_vector (addrSize-1 DOWNTO 0);
      fifoEmpty : OUT    std_logic;
      fifoFull  : OUT    std_logic;
      rData     : OUT    std_logic_vector (gregWidth-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT FifoRead
   GENERIC (
      gregLength : integer := 4;
      addrSize  : integer := 2      -- 2^addrSize = gregLength
   );
   PORT (
      clk     : IN     std_logic;
      rEnable : IN     std_logic;
      resetN  : IN     std_logic;
      fifoEmpty : in std_logic;
      rSel    : OUT    std_logic_vector (addrSize-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT FifoWrite
   GENERIC (
      gregLength : integer := 4;
      addrSize  : integer := 2      -- 2^addrSize = gregLength
   );
   PORT (
      clk     : IN     std_logic;
      resetN  : IN     std_logic;
      wEnable : IN     std_logic;
      fifoFull : in std_logic;
      wSel    : OUT    std_logic_vector (addrSize-1 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : FifoRam
      GENERIC MAP (
         gregLength => gregLength,
         gregWidth  => gregWidth,
         addrSize  => addrSize         -- 2^addrSize = gregLength
      )
      PORT MAP (
         clk       => clk,
         resetN    => resetN,
         wEnable   => wEnable,
         wData     => wData,
         wSel      => wSel,
         rSel      => rSel,
         rData     => rData,
         fifoEmpty => fifoEmpty_internal,
         fifoFull  => fifoFull_internal
      );
   U_1 : FifoRead
      GENERIC MAP (
         gregLength => gregLength,
         addrSize  => addrSize         -- 2^addrSize = gregLength
      )
      PORT MAP (
         clk     => clk,
         resetN  => resetN,
         rEnable => rEnable,
         fifoEmpty => fifoEmpty_internal,
         rSel    => rSel
      );
   U_2 : FifoWrite
      GENERIC MAP (
         gregLength => gregLength,
         addrSize  => addrSize         -- 2^addrSize = gregLength
      )
      PORT MAP (
         clk     => clk,
         resetN  => resetN,
         wEnable => wEnable,
         wSel    => wSel,
         fifoFull => fifoFull_internal
      );
      
   fifoEmpty <= fifoEmpty_internal;
   fifoFull  <= fifoFull_internal;
   
END struct;
