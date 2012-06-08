
library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

package CONV_PACK_sniffer_top is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_sniffer_top;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity SpiClkDivide_165_3_0_0_DW01_inc_0 is

   port( A : in std_logic_vector (8 downto 0);  SUM : out std_logic_vector (8 
         downto 0));

end SpiClkDivide_165_3_0_0_DW01_inc_0;

architecture SYN_rpl of SpiClkDivide_165_3_0_0_DW01_inc_0 is

   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component HAX1
      port( A, B : in std_logic;  YC, YS : out std_logic);
   end component;
   
   signal carry_8_port, carry_7_port, carry_6_port, carry_5_port, carry_4_port,
      carry_3_port, carry_2_port : std_logic;

begin
   
   U1_1_7 : HAX1 port map( A => A(7), B => carry_7_port, YC => carry_8_port, YS
                           => SUM(7));
   U1_1_6 : HAX1 port map( A => A(6), B => carry_6_port, YC => carry_7_port, YS
                           => SUM(6));
   U1_1_5 : HAX1 port map( A => A(5), B => carry_5_port, YC => carry_6_port, YS
                           => SUM(5));
   U1_1_4 : HAX1 port map( A => A(4), B => carry_4_port, YC => carry_5_port, YS
                           => SUM(4));
   U1_1_3 : HAX1 port map( A => A(3), B => carry_3_port, YC => carry_4_port, YS
                           => SUM(3));
   U1_1_2 : HAX1 port map( A => A(2), B => carry_2_port, YC => carry_3_port, YS
                           => SUM(2));
   U1_1_1 : HAX1 port map( A => A(1), B => A(0), YC => carry_2_port, YS => 
                           SUM(1));
   U1 : INVX2 port map( A => A(0), Y => SUM(0));
   U2 : XOR2X1 port map( A => carry_8_port, B => A(8), Y => SUM(8));

end SYN_rpl;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity sd_control_DW01_inc_0 is

   port( A : in std_logic_vector (6 downto 0);  SUM : out std_logic_vector (6 
         downto 0));

end sd_control_DW01_inc_0;

architecture SYN_rpl of sd_control_DW01_inc_0 is

   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component HAX1
      port( A, B : in std_logic;  YC, YS : out std_logic);
   end component;
   
   signal carry_6_port, carry_5_port, carry_4_port, carry_3_port, carry_2_port 
      : std_logic;

begin
   
   U1_1_5 : HAX1 port map( A => A(5), B => carry_5_port, YC => carry_6_port, YS
                           => SUM(5));
   U1_1_4 : HAX1 port map( A => A(4), B => carry_4_port, YC => carry_5_port, YS
                           => SUM(4));
   U1_1_3 : HAX1 port map( A => A(3), B => carry_3_port, YC => carry_4_port, YS
                           => SUM(3));
   U1_1_2 : HAX1 port map( A => A(2), B => carry_2_port, YC => carry_3_port, YS
                           => SUM(2));
   U1_1_1 : HAX1 port map( A => A(1), B => A(0), YC => carry_2_port, YS => 
                           SUM(1));
   U1 : INVX2 port map( A => A(0), Y => SUM(0));
   U2 : XOR2X1 port map( A => carry_6_port, B => A(6), Y => SUM(6));

end SYN_rpl;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity tristate_2 is

   port( lock, interceptorOutput : in std_logic;  interceptorInput : out 
         std_logic;  dataLine : inout std_logic);

end tristate_2;

architecture SYN_behavioral of tristate_2 is

   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component TBUFX1
      port( A, EN : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   dataLine_tri : TBUFX1 port map( A => n1, EN => lock, Y => dataLine);
   U1 : INVX1 port map( A => interceptorOutput, Y => n1);
   U2 : OR2X1 port map( A => dataLine, B => lock, Y => interceptorInput);

end SYN_behavioral;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity tristate_1 is

   port( lock, interceptorOutput : in std_logic;  interceptorInput : out 
         std_logic;  dataLine : inout std_logic);

end tristate_1;

architecture SYN_behavioral of tristate_1 is

   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component TBUFX1
      port( A, EN : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   dataLine_tri : TBUFX1 port map( A => n1, EN => lock, Y => dataLine);
   U1 : INVX1 port map( A => interceptorOutput, Y => n1);
   U2 : OR2X1 port map( A => dataLine, B => lock, Y => interceptorInput);

end SYN_behavioral;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity tristate_0 is

   port( lock, interceptorOutput : in std_logic;  interceptorInput : out 
         std_logic;  dataLine : inout std_logic);

end tristate_0;

architecture SYN_behavioral of tristate_0 is

   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component TBUFX1
      port( A, EN : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   dataLine_tri : TBUFX1 port map( A => n1, EN => lock, Y => dataLine);
   U1 : INVX1 port map( A => interceptorOutput, Y => n1);
   U2 : OR2X1 port map( A => dataLine, B => lock, Y => interceptorInput);

end SYN_behavioral;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity usbInterceptor is

   port( usbClk, rst, intercept, usbDataPlus, usbDataMinus, usbLock, clk, eop :
         in std_logic;  usbDataPlusOutput, usbDataMinusOutput : out std_logic);

end usbInterceptor;

architecture SYN_behavioral of usbInterceptor is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component MUX2X1
      port( B, A, S : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI22X1
      port( A, B, C, D : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI22X1
      port( A, B, C, D : in std_logic;  Y : out std_logic);
   end component;
   
   component AND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component HAX1
      port( A, B : in std_logic;  YC, YS : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal usbDataPlusOutput_port, usbDataMinusOutput_port, state_3_port, 
      state_2_port, state_1_port, state_0_port, cntr_4_port, cntr_3_port, 
      cntr_2_port, cntr_1_port, cntr_0_port, usbDataPlusSync, usbDataMinusSync,
      usbDataPlusSync2, usbDataMinusSync2, usbInt2, usbInt1, n124, n125, n126, 
      n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, 
      n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, 
      n151, n152, n153, n155, r118_carry_2_port, r118_carry_3_port, 
      r118_carry_4_port, r118_SUM_1_port, r118_SUM_2_port, r118_SUM_3_port, n1,
      n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, 
      n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32
      , n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, 
      n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61
      , n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, 
      n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90
      , n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, 
      n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, 
      n116, n117, n118, n119, n120 : std_logic;

begin
   usbDataPlusOutput <= usbDataPlusOutput_port;
   usbDataMinusOutput <= usbDataMinusOutput_port;
   
   usbInt1_reg : DFFSR port map( D => usbClk, CLK => clk, R => rst, S => n144, 
                           Q => usbInt1);
   usbInt2_reg : DFFSR port map( D => usbInt1, CLK => clk, R => rst, S => n143,
                           Q => usbInt2);
   cntr_reg_0_inst : DFFSR port map( D => n147, CLK => clk, R => rst, S => n142
                           , Q => cntr_0_port);
   cntr_reg_4_inst : DFFSR port map( D => n155, CLK => clk, R => rst, S => n141
                           , Q => cntr_4_port);
   state_reg_1_inst : DFFSR port map( D => n151, CLK => clk, R => rst, S => 
                           n140, Q => state_1_port);
   state_reg_0_inst : DFFSR port map( D => n153, CLK => clk, R => rst, S => 
                           n139, Q => state_0_port);
   cntr_reg_1_inst : DFFSR port map( D => n148, CLK => clk, R => rst, S => n138
                           , Q => cntr_1_port);
   cntr_reg_2_inst : DFFSR port map( D => n149, CLK => clk, R => rst, S => n137
                           , Q => cntr_2_port);
   cntr_reg_3_inst : DFFSR port map( D => n150, CLK => clk, R => rst, S => n136
                           , Q => cntr_3_port);
   state_reg_3_inst : DFFSR port map( D => n120, CLK => clk, R => rst, S => 
                           n135, Q => state_3_port);
   state_reg_2_inst : DFFSR port map( D => n152, CLK => clk, R => rst, S => 
                           n134, Q => state_2_port);
   usbDataMinusSync_reg : DFFSR port map( D => n133, CLK => clk, R => rst, S =>
                           n132, Q => usbDataMinusSync);
   usbDataMinusSync2_reg : DFFSR port map( D => n131, CLK => clk, R => rst, S 
                           => n130, Q => usbDataMinusSync2);
   usbDataMinusOutputReg_reg : DFFSR port map( D => n145, CLK => clk, R => rst,
                           S => n129, Q => usbDataMinusOutput_port);
   usbDataPlusSync_reg : DFFSR port map( D => n128, CLK => clk, R => n127, S =>
                           rst, Q => usbDataPlusSync);
   usbDataPlusSync2_reg : DFFSR port map( D => n126, CLK => clk, R => n125, S 
                           => rst, Q => usbDataPlusSync2);
   usbDataPlusOutputReg_reg : DFFSR port map( D => n146, CLK => clk, R => n124,
                           S => rst, Q => usbDataPlusOutput_port);
   n124 <= '1';
   n125 <= '1';
   n127 <= '1';
   n129 <= '1';
   n130 <= '1';
   n132 <= '1';
   n134 <= '1';
   n135 <= '1';
   n136 <= '1';
   n137 <= '1';
   n138 <= '1';
   n139 <= '1';
   n140 <= '1';
   n141 <= '1';
   n142 <= '1';
   n143 <= '1';
   n144 <= '1';
   r118_U1_1_1 : HAX1 port map( A => cntr_1_port, B => cntr_0_port, YC => 
                           r118_carry_2_port, YS => r118_SUM_1_port);
   r118_U1_1_2 : HAX1 port map( A => cntr_2_port, B => r118_carry_2_port, YC =>
                           r118_carry_3_port, YS => r118_SUM_2_port);
   r118_U1_1_3 : HAX1 port map( A => cntr_3_port, B => r118_carry_3_port, YC =>
                           r118_carry_4_port, YS => r118_SUM_3_port);
   U3 : OAI21X1 port map( A => n78, B => n35, C => n56, Y => n51);
   U4 : AOI22X1 port map( A => n47, B => cntr_3_port, C => r118_SUM_3_port, D 
                           => n11, Y => n1);
   U5 : INVX2 port map( A => n1, Y => n150);
   U6 : OAI22X1 port map( A => n2, B => n3, C => n4, D => n5, Y => n120);
   U7 : INVX1 port map( A => state_3_port, Y => n5);
   U8 : MUX2X1 port map( B => n6, A => n7, S => cntr_4_port, Y => n155);
   U9 : INVX1 port map( A => n8, Y => n7);
   U10 : OAI21X1 port map( A => n9, B => r118_carry_4_port, C => n10, Y => n8);
   U11 : NAND2X1 port map( A => r118_carry_4_port, B => n11, Y => n6);
   U12 : OAI22X1 port map( A => n4, B => n12, C => n13, D => n3, Y => n153);
   U13 : INVX1 port map( A => n14, Y => n13);
   U14 : OAI21X1 port map( A => n4, B => n15, C => n16, Y => n152);
   U15 : OAI21X1 port map( A => n17, B => n18, C => n19, Y => n16);
   U16 : NAND2X1 port map( A => n20, B => n21, Y => n18);
   U17 : AND2X1 port map( A => n19, B => n22, Y => n4);
   U18 : MUX2X1 port map( B => n23, A => n24, S => n19, Y => n151);
   U19 : INVX1 port map( A => n3, Y => n19);
   U20 : NAND3X1 port map( A => n25, B => n26, C => n27, Y => n3);
   U21 : AOI21X1 port map( A => n28, B => n29, C => n30, Y => n27);
   U22 : NOR2X1 port map( A => intercept, B => n31, Y => n30);
   U23 : INVX1 port map( A => n32, Y => n26);
   U24 : NOR2X1 port map( A => n33, B => n34, Y => n24);
   U25 : OAI21X1 port map( A => n35, B => n36, C => n37, Y => n34);
   U26 : NAND3X1 port map( A => state_2_port, B => n23, C => n38, Y => n37);
   U27 : OR2X1 port map( A => n39, B => n40, Y => n36);
   U28 : NAND2X1 port map( A => n41, B => n42, Y => n33);
   U29 : OAI21X1 port map( A => n10, B => n43, C => n44, Y => n149);
   U30 : NAND2X1 port map( A => r118_SUM_2_port, B => n11, Y => n44);
   U31 : OAI21X1 port map( A => n10, B => n45, C => n46, Y => n148);
   U32 : NAND2X1 port map( A => r118_SUM_1_port, B => n11, Y => n46);
   U33 : INVX1 port map( A => n9, Y => n11);
   U34 : MUX2X1 port map( B => n9, A => n10, S => cntr_0_port, Y => n147);
   U35 : INVX1 port map( A => n47, Y => n10);
   U36 : OAI21X1 port map( A => n48, B => n22, C => n49, Y => n47);
   U37 : OAI21X1 port map( A => n40, B => n39, C => n50, Y => n22);
   U38 : INVX1 port map( A => cntr_4_port, Y => n39);
   U39 : OAI21X1 port map( A => n32, B => n51, C => n49, Y => n9);
   U40 : INVX1 port map( A => n52, Y => n49);
   U41 : OAI21X1 port map( A => n53, B => n48, C => n25, Y => n52);
   U42 : MUX2X1 port map( B => n54, A => n28, S => eop, Y => n25);
   U43 : OAI21X1 port map( A => n57, B => n2, C => n53, Y => n32);
   U44 : AND2X1 port map( A => n58, B => n59, Y => n53);
   U45 : NAND2X1 port map( A => n60, B => n61, Y => n146);
   U46 : OAI21X1 port map( A => n62, B => n63, C => n64, Y => n61);
   U47 : INVX1 port map( A => n65, Y => n64);
   U48 : OAI22X1 port map( A => n56, B => n66, C => usbLock, D => n67, Y => n63
                           );
   U49 : OAI21X1 port map( A => n68, B => n69, C => n70, Y => n62);
   U50 : OAI21X1 port map( A => n71, B => n72, C => n73, Y => n70);
   U51 : INVX1 port map( A => usbDataPlusOutput_port, Y => n73);
   U52 : NOR2X1 port map( A => n74, B => n75, Y => n71);
   U53 : INVX1 port map( A => n76, Y => n74);
   U54 : OAI21X1 port map( A => n65, B => n77, C => usbDataPlusOutput_port, Y 
                           => n60);
   U55 : OAI22X1 port map( A => eop, B => n67, C => n76, D => n75, Y => n77);
   U56 : OAI22X1 port map( A => n78, B => n59, C => n76, D => n55, Y => n65);
   U57 : XOR2X1 port map( A => usbDataPlusSync2, B => usbDataPlusSync, Y => n76
                           );
   U58 : OAI21X1 port map( A => n79, B => n80, C => n81, Y => n145);
   U59 : OAI21X1 port map( A => n80, B => n82, C => usbDataMinusOutput_port, Y 
                           => n81);
   U60 : OAI21X1 port map( A => n75, B => n83, C => n84, Y => n82);
   U61 : NAND3X1 port map( A => n85, B => n86, C => usbLock, Y => n84);
   U62 : INVX1 port map( A => n67, Y => n85);
   U63 : NOR2X1 port map( A => n87, B => n88, Y => n67);
   U64 : OAI21X1 port map( A => usbLock, B => n31, C => n89, Y => n88);
   U65 : AOI22X1 port map( A => n90, B => n17, C => n57, D => n91, Y => n89);
   U66 : INVX1 port map( A => n92, Y => n90);
   U67 : NAND3X1 port map( A => n93, B => n21, C => n94, Y => n87);
   U68 : AOI22X1 port map( A => n54, B => n95, C => n96, D => n97, Y => n94);
   U69 : INVX1 port map( A => n41, Y => n97);
   U70 : INVX1 port map( A => n2, Y => n54);
   U71 : OAI21X1 port map( A => n50, B => n14, C => n78, Y => n93);
   U72 : NAND3X1 port map( A => n31, B => n41, C => n98, Y => n14);
   U73 : NOR2X1 port map( A => n91, B => n17, Y => n98);
   U74 : OAI22X1 port map( A => n78, B => n59, C => n55, D => n83, Y => n80);
   U75 : OAI21X1 port map( A => cntr_4_port, B => n40, C => n99, Y => n59);
   U76 : INVX1 port map( A => n21, Y => n99);
   U77 : NAND2X1 port map( A => n38, B => n100, Y => n21);
   U78 : XOR2X1 port map( A => state_2_port, B => state_1_port, Y => n100);
   U79 : NAND3X1 port map( A => cntr_0_port, B => n45, C => n101, Y => n40);
   U80 : NOR2X1 port map( A => cntr_3_port, B => cntr_2_port, Y => n101);
   U81 : AOI21X1 port map( A => usbDataMinus, B => n28, C => n102, Y => n79);
   U82 : OAI21X1 port map( A => n69, B => n103, C => n104, Y => n102);
   U83 : OAI21X1 port map( A => n105, B => n72, C => n106, Y => n104);
   U84 : INVX1 port map( A => usbDataMinusOutput_port, Y => n106);
   U85 : OAI21X1 port map( A => n58, B => n78, C => n55, Y => n72);
   U86 : NAND2X1 port map( A => n48, B => n50, Y => n55);
   U87 : INVX1 port map( A => n35, Y => n50);
   U88 : NAND2X1 port map( A => n107, B => n38, Y => n35);
   U89 : INVX1 port map( A => n108, Y => n58);
   U90 : OAI21X1 port map( A => n96, B => n41, C => n109, Y => n108);
   U91 : AOI22X1 port map( A => n17, B => n92, C => n91, D => n29, Y => n109);
   U92 : INVX1 port map( A => n57, Y => n29);
   U93 : NOR2X1 port map( A => n110, B => cntr_2_port, Y => n57);
   U94 : INVX1 port map( A => n20, Y => n91);
   U95 : NAND3X1 port map( A => n111, B => n23, C => state_2_port, Y => n20);
   U96 : INVX1 port map( A => state_1_port, Y => n23);
   U97 : NAND3X1 port map( A => n112, B => n45, C => n113, Y => n92);
   U98 : NOR2X1 port map( A => cntr_0_port, B => n43, Y => n113);
   U99 : INVX1 port map( A => cntr_1_port, Y => n45);
   U100 : INVX1 port map( A => n42, Y => n17);
   U101 : NAND3X1 port map( A => state_1_port, B => n111, C => state_2_port, Y 
                           => n42);
   U102 : NAND3X1 port map( A => n111, B => n15, C => state_1_port, Y => n41);
   U103 : INVX1 port map( A => state_2_port, Y => n15);
   U104 : NOR2X1 port map( A => n110, B => n43, Y => n96);
   U105 : INVX1 port map( A => cntr_2_port, Y => n43);
   U106 : NAND3X1 port map( A => cntr_1_port, B => cntr_0_port, C => n112, Y =>
                           n110);
   U107 : NOR2X1 port map( A => cntr_4_port, B => cntr_3_port, Y => n112);
   U108 : NOR2X1 port map( A => n114, B => n75, Y => n105);
   U109 : OR2X1 port map( A => n95, B => n2, Y => n75);
   U110 : NAND3X1 port map( A => state_2_port, B => state_1_port, C => n38, Y 
                           => n2);
   U111 : NOR2X1 port map( A => n12, B => state_3_port, Y => n38);
   U112 : NAND2X1 port map( A => n48, B => n86, Y => n95);
   U113 : INVX1 port map( A => eop, Y => n86);
   U114 : INVX1 port map( A => n83, Y => n114);
   U115 : XOR2X1 port map( A => usbDataMinusSync2, B => usbDataMinusSync, Y => 
                           n83);
   U116 : INVX1 port map( A => usbDataMinusSync, Y => n103);
   U117 : NAND3X1 port map( A => n48, B => n115, C => usbLock, Y => n69);
   U118 : INVX1 port map( A => n31, Y => n115);
   U119 : NAND2X1 port map( A => n107, B => n111, Y => n31);
   U120 : NOR2X1 port map( A => state_3_port, B => state_0_port, Y => n111);
   U121 : INVX1 port map( A => n56, Y => n28);
   U122 : NAND3X1 port map( A => n107, B => n12, C => state_3_port, Y => n56);
   U123 : INVX1 port map( A => state_0_port, Y => n12);
   U124 : NOR2X1 port map( A => state_2_port, B => state_1_port, Y => n107);
   U125 : INVX1 port map( A => n116, Y => n133);
   U126 : MUX2X1 port map( B => usbDataMinusSync, A => usbDataMinus, S => n48, 
                           Y => n116);
   U127 : INVX1 port map( A => n117, Y => n131);
   U128 : MUX2X1 port map( B => usbDataMinusSync2, A => usbDataMinusSync, S => 
                           n48, Y => n117);
   U129 : MUX2X1 port map( B => n68, A => n66, S => n48, Y => n128);
   U130 : INVX1 port map( A => usbDataPlus, Y => n66);
   U131 : INVX1 port map( A => usbDataPlusSync, Y => n68);
   U132 : INVX1 port map( A => n118, Y => n126);
   U133 : MUX2X1 port map( B => usbDataPlusSync2, A => usbDataPlusSync, S => 
                           n48, Y => n118);
   U134 : INVX1 port map( A => n78, Y => n48);
   U135 : NAND2X1 port map( A => usbInt1, B => n119, Y => n78);
   U153 : INVX1 port map( A => usbInt2, Y => n119);

end SYN_behavioral;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity tristate_3 is

   port( lock, interceptorOutput : in std_logic;  interceptorInput : out 
         std_logic;  dataLine : inout std_logic);

end tristate_3;

architecture SYN_behavioral of tristate_3 is

   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component TBUFX1
      port( A, EN : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   dataLine_tri : TBUFX1 port map( A => n1, EN => lock, Y => dataLine);
   U1 : INVX1 port map( A => interceptorOutput, Y => n1);
   U2 : OR2X1 port map( A => dataLine, B => lock, Y => interceptorInput);

end SYN_behavioral;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity lockingDetector is

   port( endOfPacket, rst, clk : in std_logic;  inst : in std_logic_vector (3 
         downto 0);  usbLock, computerLock : out std_logic);

end lockingDetector;

architecture SYN_behavioral of lockingDetector is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component MUX2X1
      port( B, A, S : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component XNOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFPOSX1
      port( D, CLK : in std_logic;  Q : out std_logic);
   end component;
   
   signal state_2_port, state_1_port, state_0_port, lockc, locku, eopIn1, 
      eopIn2, eopFound, nextState_2_port, nextState_1_port, nextState_0_port, 
      n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n1, n2, n3, 
      n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
      n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34
      : std_logic;

begin
   
   eopIn1_reg : DFFSR port map( D => endOfPacket, CLK => clk, R => rst, S => 
                           n48, Q => eopIn1);
   eopIn2_reg : DFFSR port map( D => eopIn1, CLK => clk, R => rst, S => n47, Q 
                           => eopIn2);
   eopFound_reg : DFFPOSX1 port map( D => n46, CLK => clk, Q => eopFound);
   state_reg_2_inst : DFFSR port map( D => nextState_2_port, CLK => clk, R => 
                           rst, S => n45, Q => state_2_port);
   state_reg_1_inst : DFFSR port map( D => nextState_1_port, CLK => clk, R => 
                           rst, S => n44, Q => state_1_port);
   state_reg_0_inst : DFFSR port map( D => nextState_0_port, CLK => clk, R => 
                           rst, S => n43, Q => state_0_port);
   locku_reg : DFFSR port map( D => n49, CLK => clk, R => rst, S => n42, Q => 
                           locku);
   usbLock_reg : DFFSR port map( D => locku, CLK => clk, R => rst, S => n41, Q 
                           => usbLock);
   lockc_reg : DFFSR port map( D => n50, CLK => clk, R => n40, S => rst, Q => 
                           lockc);
   computerLock_reg : DFFSR port map( D => lockc, CLK => clk, R => n39, S => 
                           rst, Q => computerLock);
   n39 <= '1';
   n40 <= '1';
   n41 <= '1';
   n42 <= '1';
   n43 <= '1';
   n44 <= '1';
   n45 <= '1';
   n47 <= '1';
   n48 <= '1';
   U3 : OAI21X1 port map( A => n19, B => n9, C => n15, Y => nextState_0_port);
   U4 : OAI21X1 port map( A => n1, B => n2, C => n3, Y => nextState_2_port);
   U5 : OAI21X1 port map( A => n4, B => n5, C => n6, Y => n3);
   U6 : NOR2X1 port map( A => state_1_port, B => state_0_port, Y => n6);
   U7 : OR2X1 port map( A => inst(1), B => inst(2), Y => n5);
   U8 : XNOR2X1 port map( A => inst(3), B => n7, Y => n4);
   U9 : NOR2X1 port map( A => n8, B => n9, Y => n1);
   U10 : OAI21X1 port map( A => eopFound, B => n10, C => n11, Y => 
                           nextState_1_port);
   U11 : OAI21X1 port map( A => n12, B => state_1_port, C => n9, Y => n11);
   U12 : AOI21X1 port map( A => n13, B => n14, C => state_2_port, Y => n12);
   U13 : INVX1 port map( A => inst(1), Y => n14);
   U14 : MUX2X1 port map( B => inst(3), A => n7, S => inst(2), Y => n13);
   U15 : INVX1 port map( A => inst(0), Y => n7);
   U16 : INVX1 port map( A => n16, Y => n10);
   U17 : MUX2X1 port map( B => n17, A => n18, S => n8, Y => n15);
   U18 : NAND2X1 port map( A => n2, B => n19, Y => n17);
   U19 : INVX1 port map( A => n20, Y => n50);
   U20 : MUX2X1 port map( B => n21, A => lockc, S => n22, Y => n20);
   U21 : OAI21X1 port map( A => state_1_port, B => state_0_port, C => n23, Y =>
                           n21);
   U22 : OAI21X1 port map( A => n2, B => n24, C => n16, Y => n23);
   U23 : INVX1 port map( A => lockc, Y => n24);
   U24 : MUX2X1 port map( B => n25, A => n26, S => n22, Y => n49);
   U25 : OAI21X1 port map( A => eopFound, B => n27, C => n28, Y => n22);
   U26 : MUX2X1 port map( B => n29, A => n18, S => n2, Y => n28);
   U27 : AOI21X1 port map( A => eopFound, B => n19, C => state_0_port, Y => n29
                           );
   U28 : NOR2X1 port map( A => n16, B => n30, Y => n27);
   U29 : INVX1 port map( A => locku, Y => n26);
   U30 : AOI21X1 port map( A => n31, B => n16, C => n30, Y => n25);
   U31 : OAI21X1 port map( A => state_0_port, B => n19, C => n32, Y => n30);
   U32 : INVX1 port map( A => n18, Y => n32);
   U33 : NOR2X1 port map( A => n9, B => state_1_port, Y => n18);
   U34 : NOR2X1 port map( A => n19, B => n9, Y => n16);
   U35 : INVX1 port map( A => state_0_port, Y => n9);
   U36 : INVX1 port map( A => state_1_port, Y => n19);
   U37 : NOR2X1 port map( A => locku, B => n2, Y => n31);
   U38 : INVX1 port map( A => state_2_port, Y => n2);
   U39 : MUX2X1 port map( B => n8, A => n33, S => rst, Y => n46);
   U40 : NAND2X1 port map( A => eopIn2, B => n34, Y => n33);
   U41 : INVX1 port map( A => eopIn1, Y => n34);
   U42 : INVX1 port map( A => eopFound, Y => n8);

end SYN_behavioral;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity computerInterceptor is

   port( usbClk, rst, computerDataPlus, computerDataMinus, computerLock, clk, 
         eop : in std_logic;  computerDataPlusOutput, computerDataMinusOutput :
         out std_logic);

end computerInterceptor;

architecture SYN_behavioral of computerInterceptor is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component MUX2X1
      port( B, A, S : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal computerDataPlusOutput_port, computerDataMinusOutput_port, 
      computerDataPlusSync, computerDataMinusSync, usbInt2, usbInt1, eopInt1, 
      eopInt2, n1, n2, n3, n4, n5, n6, n7, n8, n24, n25, n9, n10, n11, n12, n13
      , n14, n15, n16, n17, n18, n19 : std_logic;

begin
   computerDataPlusOutput <= computerDataPlusOutput_port;
   computerDataMinusOutput <= computerDataMinusOutput_port;
   
   computerDataPlusSync_reg : DFFSR port map( D => computerDataPlus, CLK => clk
                           , R => n8, S => rst, Q => computerDataPlusSync);
   computerDataMinusSync_reg : DFFSR port map( D => computerDataMinus, CLK => 
                           clk, R => rst, S => n7, Q => computerDataMinusSync);
   usbInt1_reg : DFFSR port map( D => usbClk, CLK => clk, R => n6, S => rst, Q 
                           => usbInt1);
   usbInt2_reg : DFFSR port map( D => usbInt1, CLK => clk, R => rst, S => n5, Q
                           => usbInt2);
   eopInt1_reg : DFFSR port map( D => eop, CLK => clk, R => rst, S => n4, Q => 
                           eopInt1);
   eopInt2_reg : DFFSR port map( D => eopInt1, CLK => clk, R => rst, S => n3, Q
                           => eopInt2);
   computerDataPlusOutput_reg : DFFSR port map( D => n25, CLK => clk, R => n2, 
                           S => rst, Q => computerDataPlusOutput_port);
   computerDataMinusOutput_reg : DFFSR port map( D => n24, CLK => clk, R => rst
                           , S => n1, Q => computerDataMinusOutput_port);
   n1 <= '1';
   n2 <= '1';
   n3 <= '1';
   n4 <= '1';
   n5 <= '1';
   n6 <= '1';
   n7 <= '1';
   n8 <= '1';
   U11 : INVX1 port map( A => n9, Y => n25);
   U12 : MUX2X1 port map( B => computerDataPlusOutput_port, A => n10, S => n11,
                           Y => n9);
   U13 : NAND2X1 port map( A => n12, B => computerLock, Y => n10);
   U14 : AOI21X1 port map( A => computerDataPlusSync, B => n13, C => n14, Y => 
                           n12);
   U15 : INVX1 port map( A => eop, Y => n13);
   U16 : MUX2X1 port map( B => n15, A => n16, S => n11, Y => n24);
   U17 : OAI21X1 port map( A => usbInt2, B => n17, C => n18, Y => n11);
   U18 : INVX1 port map( A => usbInt1, Y => n17);
   U19 : NAND3X1 port map( A => computerDataMinusSync, B => computerLock, C => 
                           n18, Y => n16);
   U20 : NOR2X1 port map( A => eop, B => n14, Y => n18);
   U21 : NOR2X1 port map( A => n19, B => eopInt1, Y => n14);
   U22 : INVX1 port map( A => eopInt2, Y => n19);
   U23 : INVX1 port map( A => computerDataMinusOutput_port, Y => n15);

end SYN_behavioral;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity timer is

   port( clk, rst, egde_det, f_egde_det, EOP : in std_logic;  data_clk, 
         shift_en : out std_logic);

end timer;

architecture SYN_FSM of timer is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component MUX2X1
      port( B, A, S : in std_logic;  Y : out std_logic);
   end component;
   
   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component XNOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI22X1
      port( A, B, C, D : in std_logic;  Y : out std_logic);
   end component;
   
   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component BUFX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal n28, CS_3_port, CS_2_port, CS_1_port, CS_0_port, NS_3_port, NS_2_port
      , NS_1_port, NS_0_port, nxt_shift_en, dclk_nxt, n12, n13, n14, n15, n16, 
      n17, n1, n2, n3, n5, n6, n7, n8, n9, n10, n11, n18, n19, n20, n21, n22, 
      n23, n24, n25, n26, n27 : std_logic;

begin
   
   CS_reg_0_inst : DFFSR port map( D => NS_0_port, CLK => clk, R => rst, S => 
                           n17, Q => CS_0_port);
   CS_reg_2_inst : DFFSR port map( D => NS_2_port, CLK => clk, R => rst, S => 
                           n16, Q => CS_2_port);
   CS_reg_3_inst : DFFSR port map( D => NS_3_port, CLK => clk, R => rst, S => 
                           n15, Q => CS_3_port);
   CS_reg_1_inst : DFFSR port map( D => NS_1_port, CLK => clk, R => rst, S => 
                           n14, Q => CS_1_port);
   cur_shift_en_reg : DFFSR port map( D => nxt_shift_en, CLK => clk, R => rst, 
                           S => n13, Q => n28);
   dclk_cur_reg : DFFSR port map( D => dclk_nxt, CLK => clk, R => rst, S => n12
                           , Q => data_clk);
   n12 <= '1';
   n13 <= '1';
   n14 <= '1';
   n15 <= '1';
   n16 <= '1';
   n17 <= '1';
   U3 : NAND3X1 port map( A => n7, B => n5, C => n6, Y => n1);
   U4 : INVX2 port map( A => n1, Y => nxt_shift_en);
   U5 : OAI21X1 port map( A => n24, B => n18, C => n2, Y => n20);
   U6 : INVX2 port map( A => n5, Y => n2);
   U7 : OAI21X1 port map( A => n24, B => n18, C => CS_0_port, Y => n3);
   U8 : INVX2 port map( A => n3, Y => n23);
   U9 : BUFX2 port map( A => n28, Y => shift_en);
   U10 : AOI21X1 port map( A => n8, B => n5, C => CS_3_port, Y => dclk_nxt);
   U11 : XOR2X1 port map( A => n6, B => CS_2_port, Y => n8);
   U18 : NOR2X1 port map( A => n9, B => n10, Y => NS_3_port);
   U19 : AOI22X1 port map( A => n11, B => n7, C => CS_3_port, D => n18, Y => n9
                           );
   U20 : NOR2X1 port map( A => n10, B => n19, Y => NS_2_port);
   U21 : MUX2X1 port map( B => n7, A => n18, S => n11, Y => n19);
   U22 : INVX1 port map( A => n6, Y => n11);
   U23 : NAND2X1 port map( A => CS_1_port, B => CS_0_port, Y => n6);
   U24 : NOR2X1 port map( A => n18, B => CS_3_port, Y => n7);
   U25 : NOR2X1 port map( A => n10, B => n20, Y => NS_1_port);
   U26 : XNOR2X1 port map( A => CS_0_port, B => CS_1_port, Y => n5);
   U27 : OR2X1 port map( A => EOP, B => egde_det, Y => n10);
   U28 : MUX2X1 port map( B => n21, A => n22, S => n23, Y => NS_0_port);
   U29 : MUX2X1 port map( B => n25, A => f_egde_det, S => n26, Y => n21);
   U30 : NOR2X1 port map( A => CS_1_port, B => n27, Y => n26);
   U31 : NAND2X1 port map( A => n18, B => n24, Y => n27);
   U32 : INVX1 port map( A => CS_3_port, Y => n24);
   U33 : INVX1 port map( A => CS_2_port, Y => n18);
   U34 : NAND2X1 port map( A => EOP, B => n22, Y => n25);
   U35 : INVX1 port map( A => egde_det, Y => n22);

end SYN_FSM;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity shift_greg is

   port( clk, rst, shift_en, data_in : in std_logic;  data_out : out 
         std_logic_vector (7 downto 0);  data_ready : out std_logic);

end shift_greg;

architecture SYN_shift of shift_greg is

   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component MUX2X1
      port( B, A, S : in std_logic;  Y : out std_logic);
   end component;
   
   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component XNOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal data_out_7_port, data_out_6_port, data_out_5_port, data_out_4_port, 
      data_out_3_port, data_out_2_port, data_out_1_port, data_out_0_port, 
      cnt_2_port, cnt_1_port, cnt_0_port, N3, n17, n18, n19, n20, n21, n22, n23
      , n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, 
      n38, n39, n1, n2, n3_port, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, 
      n14 : std_logic;

begin
   data_out <= ( data_out_7_port, data_out_6_port, data_out_5_port, 
      data_out_4_port, data_out_3_port, data_out_2_port, data_out_1_port, 
      data_out_0_port );
   
   cnt_reg_0_inst : DFFSR port map( D => n39, CLK => clk, R => rst, S => n38, Q
                           => cnt_0_port);
   cnt_reg_1_inst : DFFSR port map( D => n37, CLK => clk, R => rst, S => n36, Q
                           => cnt_1_port);
   cnt_reg_2_inst : DFFSR port map( D => n35, CLK => clk, R => rst, S => n34, Q
                           => cnt_2_port);
   pre_val_reg_7_inst : DFFSR port map( D => n33, CLK => clk, R => rst, S => 
                           n32, Q => data_out_7_port);
   pre_val_reg_6_inst : DFFSR port map( D => n31, CLK => clk, R => rst, S => 
                           n30, Q => data_out_6_port);
   pre_val_reg_5_inst : DFFSR port map( D => n29, CLK => clk, R => rst, S => 
                           n28, Q => data_out_5_port);
   pre_val_reg_4_inst : DFFSR port map( D => n27, CLK => clk, R => rst, S => 
                           n26, Q => data_out_4_port);
   pre_val_reg_3_inst : DFFSR port map( D => n25, CLK => clk, R => rst, S => 
                           n24, Q => data_out_3_port);
   pre_val_reg_2_inst : DFFSR port map( D => n23, CLK => clk, R => rst, S => 
                           n22, Q => data_out_2_port);
   pre_val_reg_1_inst : DFFSR port map( D => n21, CLK => clk, R => rst, S => 
                           n20, Q => data_out_1_port);
   pre_val_reg_0_inst : DFFSR port map( D => n19, CLK => clk, R => rst, S => 
                           n18, Q => data_out_0_port);
   cur_data_ready_reg : DFFSR port map( D => N3, CLK => clk, R => rst, S => n17
                           , Q => data_ready);
   n17 <= '1';
   n18 <= '1';
   n20 <= '1';
   n22 <= '1';
   n24 <= '1';
   n26 <= '1';
   n28 <= '1';
   n30 <= '1';
   n32 <= '1';
   n34 <= '1';
   n36 <= '1';
   n38 <= '1';
   U3 : XNOR2X1 port map( A => shift_en, B => n1, Y => n39);
   U4 : XNOR2X1 port map( A => cnt_1_port, B => n2, Y => n37);
   U5 : XOR2X1 port map( A => cnt_2_port, B => n3_port, Y => n35);
   U6 : NOR2X1 port map( A => n4, B => n2, Y => n3_port);
   U7 : NAND2X1 port map( A => cnt_0_port, B => shift_en, Y => n2);
   U8 : INVX1 port map( A => cnt_1_port, Y => n4);
   U9 : INVX1 port map( A => n5, Y => n33);
   U10 : MUX2X1 port map( B => data_out_7_port, A => data_in, S => shift_en, Y 
                           => n5);
   U11 : INVX1 port map( A => n6, Y => n31);
   U12 : MUX2X1 port map( B => data_out_6_port, A => data_out_7_port, S => 
                           shift_en, Y => n6);
   U13 : INVX1 port map( A => n7, Y => n29);
   U14 : MUX2X1 port map( B => data_out_5_port, A => data_out_6_port, S => 
                           shift_en, Y => n7);
   U15 : INVX1 port map( A => n8, Y => n27);
   U16 : MUX2X1 port map( B => data_out_4_port, A => data_out_5_port, S => 
                           shift_en, Y => n8);
   U17 : INVX1 port map( A => n9, Y => n25);
   U18 : MUX2X1 port map( B => data_out_3_port, A => data_out_4_port, S => 
                           shift_en, Y => n9);
   U19 : INVX1 port map( A => n10, Y => n23);
   U20 : MUX2X1 port map( B => data_out_2_port, A => data_out_3_port, S => 
                           shift_en, Y => n10);
   U21 : INVX1 port map( A => n11, Y => n21);
   U22 : MUX2X1 port map( B => data_out_1_port, A => data_out_2_port, S => 
                           shift_en, Y => n11);
   U23 : INVX1 port map( A => n12, Y => n19);
   U24 : MUX2X1 port map( B => data_out_0_port, A => data_out_1_port, S => 
                           shift_en, Y => n12);
   U25 : NOR2X1 port map( A => n13, B => n14, Y => N3);
   U26 : NAND2X1 port map( A => rst, B => n1, Y => n14);
   U27 : INVX1 port map( A => cnt_0_port, Y => n1);
   U28 : OR2X1 port map( A => cnt_1_port, B => cnt_2_port, Y => n13);

end SYN_shift;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity NRZIdecode is

   port( clk, rst, data0, enable, EOP : in std_logic;  data_out : out std_logic
         );

end NRZIdecode;

architecture SYN_NRZI of NRZIdecode is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component AND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component MUX2X1
      port( B, A, S : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal data_out_port, data0_buf0, n8, n9, n10, n12, n1, n2, n3, n4, n5, n6, 
      n7, n11 : std_logic;

begin
   data_out <= data_out_port;
   
   data0_buf0_reg : DFFSR port map( D => n11, CLK => clk, R => n10, S => n12, Q
                           => data0_buf0);
   data_out_reg : DFFSR port map( D => n9, CLK => clk, R => n8, S => rst, Q => 
                           data_out_port);
   n8 <= '1';
   U3 : INVX1 port map( A => n1, Y => n11);
   U4 : OAI21X1 port map( A => n2, B => n3, C => n4, Y => n9);
   U5 : MUX2X1 port map( B => n5, A => n1, S => n6, Y => n4);
   U6 : NOR2X1 port map( A => data0_buf0, B => EOP, Y => n1);
   U7 : AND2X1 port map( A => n2, B => data0_buf0, Y => n5);
   U8 : INVX1 port map( A => data_out_port, Y => n3);
   U9 : INVX1 port map( A => EOP, Y => n2);
   U10 : OAI21X1 port map( A => enable, B => n7, C => n10, Y => n12);
   U11 : INVX1 port map( A => rst, Y => n7);
   U12 : NAND2X1 port map( A => enable, B => n6, Y => n10);
   U13 : INVX1 port map( A => data0, Y => n6);

end SYN_NRZI;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity SEE_det is

   port( clk, rst, data0, data1 : in std_logic;  EGDE, F_EGDE, EOP : out 
         std_logic);

end SEE_det;

architecture SYN_SOP_EOP of SEE_det is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal d1, d2, nxt_EOP, nxt_EGDE, nxt_FEGDE, n1, n2, n3, n4, n5, n6, n7, n8,
      n9, n10 : std_logic;

begin
   
   cur_EOP_reg : DFFSR port map( D => nxt_EOP, CLK => clk, R => rst, S => n5, Q
                           => EOP);
   d1_reg : DFFSR port map( D => data0, CLK => clk, R => n4, S => rst, Q => d1)
                           ;
   d2_reg : DFFSR port map( D => d1, CLK => clk, R => n3, S => rst, Q => d2);
   cur_EGDE_reg : DFFSR port map( D => nxt_EGDE, CLK => clk, R => rst, S => n2,
                           Q => EGDE);
   cur_FEGDE_reg : DFFSR port map( D => nxt_FEGDE, CLK => clk, R => rst, S => 
                           n1, Q => F_EGDE);
   n1 <= '1';
   n2 <= '1';
   n3 <= '1';
   n4 <= '1';
   n5 <= '1';
   U8 : INVX1 port map( A => n6, Y => nxt_FEGDE);
   U9 : NOR2X1 port map( A => n7, B => n8, Y => nxt_EOP);
   U10 : OR2X1 port map( A => data1, B => data0, Y => n8);
   U11 : OAI21X1 port map( A => n9, B => n10, C => n6, Y => nxt_EGDE);
   U12 : NAND3X1 port map( A => d2, B => n9, C => rst, Y => n6);
   U13 : OR2X1 port map( A => n7, B => d2, Y => n10);
   U14 : INVX1 port map( A => rst, Y => n7);
   U15 : INVX1 port map( A => d1, Y => n9);

end SYN_SOP_EOP;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity FifoWrite_gregLength4_addrSize2 is

   port( clk, resetN, wEnable, fifoFull : in std_logic;  wSel : out 
         std_logic_vector (1 downto 0));

end FifoWrite_gregLength4_addrSize2;

architecture SYN_FifoWrite_arch of FifoWrite_gregLength4_addrSize2 is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal wSel_1_port, wSel_0_port, n1, n2, n10, n11, n3, n4, n5, n6 : 
      std_logic;

begin
   wSel <= ( wSel_1_port, wSel_0_port );
   
   count_reg_0_inst : DFFSR port map( D => n11, CLK => clk, R => resetN, S => 
                           n2, Q => wSel_0_port);
   count_reg_1_inst : DFFSR port map( D => n10, CLK => clk, R => resetN, S => 
                           n1, Q => wSel_1_port);
   n1 <= '1';
   n2 <= '1';
   U5 : XOR2X1 port map( A => n3, B => n4, Y => n11);
   U6 : XOR2X1 port map( A => wSel_1_port, B => n5, Y => n10);
   U7 : NOR2X1 port map( A => n3, B => n4, Y => n5);
   U8 : NAND2X1 port map( A => wEnable, B => n6, Y => n4);
   U9 : INVX1 port map( A => fifoFull, Y => n6);
   U10 : INVX1 port map( A => wSel_0_port, Y => n3);

end SYN_FifoWrite_arch;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity FifoRead_gregLength4_addrSize2 is

   port( clk, resetN, rEnable, fifoEmpty : in std_logic;  rSel : out 
         std_logic_vector (1 downto 0));

end FifoRead_gregLength4_addrSize2;

architecture SYN_FifoRead_arch of FifoRead_gregLength4_addrSize2 is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal rSel_1_port, rSel_0_port, n1, n2, n10, n11, n3, n4, n5, n6 : 
      std_logic;

begin
   rSel <= ( rSel_1_port, rSel_0_port );
   
   count_reg_0_inst : DFFSR port map( D => n11, CLK => clk, R => resetN, S => 
                           n2, Q => rSel_0_port);
   count_reg_1_inst : DFFSR port map( D => n10, CLK => clk, R => resetN, S => 
                           n1, Q => rSel_1_port);
   n1 <= '1';
   n2 <= '1';
   U5 : XOR2X1 port map( A => n3, B => n4, Y => n11);
   U6 : XOR2X1 port map( A => rSel_1_port, B => n5, Y => n10);
   U7 : NOR2X1 port map( A => n3, B => n4, Y => n5);
   U8 : NAND2X1 port map( A => rEnable, B => n6, Y => n4);
   U9 : INVX1 port map( A => fifoEmpty, Y => n6);
   U10 : INVX1 port map( A => rSel_0_port, Y => n3);

end SYN_FifoRead_arch;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity FifoRam_gregLength4_gregWidth8_addrSize2 is

   port( clk, resetN, wEnable : in std_logic;  wData : in std_logic_vector (7 
         downto 0);  wSel, rSel : in std_logic_vector (1 downto 0);  rData : 
         out std_logic_vector (7 downto 0);  fifoEmpty, fifoFull : out 
         std_logic);

end FifoRam_gregLength4_gregWidth8_addrSize2;

architecture SYN_FifoRam_arch of FifoRam_gregLength4_gregWidth8_addrSize2 is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component XNOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component MUX2X1
      port( B, A, S : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI22X1
      port( A, B, C, D : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal fifoFull_port, N4, N7, gregData_3_7_port, gregData_3_6_port, 
      gregData_3_5_port, gregData_3_4_port, gregData_3_3_port, 
      gregData_3_2_port, gregData_3_1_port, gregData_3_0_port, 
      gregData_2_7_port, gregData_2_6_port, gregData_2_5_port, 
      gregData_2_4_port, gregData_2_3_port, gregData_2_2_port, 
      gregData_2_1_port, gregData_2_0_port, gregData_1_7_port, 
      gregData_1_6_port, gregData_1_5_port, gregData_1_4_port, 
      gregData_1_3_port, gregData_1_2_port, gregData_1_1_port, 
      gregData_1_0_port, gregData_0_7_port, gregData_0_6_port, 
      gregData_0_5_port, gregData_0_4_port, gregData_0_3_port, 
      gregData_0_2_port, gregData_0_1_port, gregData_0_0_port, n77, n79, n81, 
      n83, n85, n87, n89, n91, n93, n95, n97, n99, n101, n103, n105, n107, n109
      , n111, n113, n115, n117, n119, n121, n123, n125, n127, n129, n131, n133,
      n135, n137, n139, n141, n142, n1, n2, n3, n4_port, n5, n6, n7_port, n8, 
      n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
      n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38
      , n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, 
      n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67
      , n68, n69, n70, n71, n72, n73, n74, n75, n76, n78, n80, n82, n84, n86, 
      n88, n90, n92, n94, n96, n98, n100, n102, n104, n106, n108, n110, n112, 
      n114, n116, n118, n120 : std_logic;

begin
   fifoFull <= fifoFull_port;
   
   fifoEmptyReg_reg : DFFSR port map( D => N4, CLK => clk, R => n142, S => 
                           resetN, Q => fifoEmpty);
   fifoFullReg_reg : DFFSR port map( D => N7, CLK => clk, R => resetN, S => 
                           n141, Q => fifoFull_port);
   gregData_reg_3_7_inst : DFFSR port map( D => n70, CLK => clk, R => resetN, S
                           => n139, Q => gregData_3_7_port);
   gregData_reg_3_6_inst : DFFSR port map( D => n74, CLK => clk, R => resetN, S
                           => n137, Q => gregData_3_6_port);
   gregData_reg_3_5_inst : DFFSR port map( D => n80, CLK => clk, R => resetN, S
                           => n135, Q => gregData_3_5_port);
   gregData_reg_3_4_inst : DFFSR port map( D => n88, CLK => clk, R => resetN, S
                           => n133, Q => gregData_3_4_port);
   gregData_reg_3_3_inst : DFFSR port map( D => n96, CLK => clk, R => resetN, S
                           => n131, Q => gregData_3_3_port);
   gregData_reg_3_2_inst : DFFSR port map( D => n104, CLK => clk, R => resetN, 
                           S => n129, Q => gregData_3_2_port);
   gregData_reg_3_1_inst : DFFSR port map( D => n112, CLK => clk, R => resetN, 
                           S => n127, Q => gregData_3_1_port);
   gregData_reg_3_0_inst : DFFSR port map( D => n120, CLK => clk, R => resetN, 
                           S => n125, Q => gregData_3_0_port);
   gregData_reg_2_7_inst : DFFSR port map( D => n69, CLK => clk, R => resetN, S
                           => n123, Q => gregData_2_7_port);
   gregData_reg_2_6_inst : DFFSR port map( D => n73, CLK => clk, R => resetN, S
                           => n121, Q => gregData_2_6_port);
   gregData_reg_2_5_inst : DFFSR port map( D => n78, CLK => clk, R => resetN, S
                           => n119, Q => gregData_2_5_port);
   gregData_reg_2_4_inst : DFFSR port map( D => n86, CLK => clk, R => resetN, S
                           => n117, Q => gregData_2_4_port);
   gregData_reg_2_3_inst : DFFSR port map( D => n94, CLK => clk, R => resetN, S
                           => n115, Q => gregData_2_3_port);
   gregData_reg_2_2_inst : DFFSR port map( D => n102, CLK => clk, R => resetN, 
                           S => n113, Q => gregData_2_2_port);
   gregData_reg_2_1_inst : DFFSR port map( D => n110, CLK => clk, R => resetN, 
                           S => n111, Q => gregData_2_1_port);
   gregData_reg_2_0_inst : DFFSR port map( D => n118, CLK => clk, R => resetN, 
                           S => n109, Q => gregData_2_0_port);
   gregData_reg_1_7_inst : DFFSR port map( D => n68, CLK => clk, R => resetN, S
                           => n107, Q => gregData_1_7_port);
   gregData_reg_1_6_inst : DFFSR port map( D => n72, CLK => clk, R => resetN, S
                           => n105, Q => gregData_1_6_port);
   gregData_reg_1_5_inst : DFFSR port map( D => n76, CLK => clk, R => resetN, S
                           => n103, Q => gregData_1_5_port);
   gregData_reg_1_4_inst : DFFSR port map( D => n84, CLK => clk, R => resetN, S
                           => n101, Q => gregData_1_4_port);
   gregData_reg_1_3_inst : DFFSR port map( D => n92, CLK => clk, R => resetN, S
                           => n99, Q => gregData_1_3_port);
   gregData_reg_1_2_inst : DFFSR port map( D => n100, CLK => clk, R => resetN, 
                           S => n97, Q => gregData_1_2_port);
   gregData_reg_1_1_inst : DFFSR port map( D => n108, CLK => clk, R => resetN, 
                           S => n95, Q => gregData_1_1_port);
   gregData_reg_1_0_inst : DFFSR port map( D => n116, CLK => clk, R => resetN, 
                           S => n93, Q => gregData_1_0_port);
   gregData_reg_0_7_inst : DFFSR port map( D => n67, CLK => clk, R => resetN, S
                           => n91, Q => gregData_0_7_port);
   gregData_reg_0_6_inst : DFFSR port map( D => n71, CLK => clk, R => resetN, S
                           => n89, Q => gregData_0_6_port);
   gregData_reg_0_5_inst : DFFSR port map( D => n75, CLK => clk, R => resetN, S
                           => n87, Q => gregData_0_5_port);
   gregData_reg_0_4_inst : DFFSR port map( D => n82, CLK => clk, R => resetN, S
                           => n85, Q => gregData_0_4_port);
   gregData_reg_0_3_inst : DFFSR port map( D => n90, CLK => clk, R => resetN, S
                           => n83, Q => gregData_0_3_port);
   gregData_reg_0_2_inst : DFFSR port map( D => n98, CLK => clk, R => resetN, S
                           => n81, Q => gregData_0_2_port);
   gregData_reg_0_1_inst : DFFSR port map( D => n106, CLK => clk, R => resetN, 
                           S => n79, Q => gregData_0_1_port);
   gregData_reg_0_0_inst : DFFSR port map( D => n114, CLK => clk, R => resetN, 
                           S => n77, Q => gregData_0_0_port);
   n77 <= '1';
   n79 <= '1';
   n81 <= '1';
   n83 <= '1';
   n85 <= '1';
   n87 <= '1';
   n89 <= '1';
   n91 <= '1';
   n93 <= '1';
   n95 <= '1';
   n97 <= '1';
   n99 <= '1';
   n101 <= '1';
   n103 <= '1';
   n105 <= '1';
   n107 <= '1';
   n109 <= '1';
   n111 <= '1';
   n113 <= '1';
   n115 <= '1';
   n117 <= '1';
   n119 <= '1';
   n121 <= '1';
   n123 <= '1';
   n125 <= '1';
   n127 <= '1';
   n129 <= '1';
   n131 <= '1';
   n133 <= '1';
   n135 <= '1';
   n137 <= '1';
   n139 <= '1';
   n141 <= '1';
   n142 <= '1';
   U3 : NAND2X1 port map( A => n1, B => n2, Y => rData(7));
   U4 : AOI22X1 port map( A => gregData_3_7_port, B => n3, C => 
                           gregData_2_7_port, D => n4_port, Y => n2);
   U5 : AOI22X1 port map( A => gregData_1_7_port, B => n5, C => 
                           gregData_0_7_port, D => n6, Y => n1);
   U6 : NAND2X1 port map( A => n7_port, B => n8, Y => rData(6));
   U7 : AOI22X1 port map( A => gregData_3_6_port, B => n3, C => 
                           gregData_2_6_port, D => n4_port, Y => n8);
   U8 : AOI22X1 port map( A => gregData_1_6_port, B => n5, C => 
                           gregData_0_6_port, D => n6, Y => n7_port);
   U9 : NAND2X1 port map( A => n9, B => n10, Y => rData(5));
   U10 : AOI22X1 port map( A => gregData_3_5_port, B => n3, C => 
                           gregData_2_5_port, D => n4_port, Y => n10);
   U11 : AOI22X1 port map( A => gregData_1_5_port, B => n5, C => 
                           gregData_0_5_port, D => n6, Y => n9);
   U12 : NAND2X1 port map( A => n11, B => n12, Y => rData(4));
   U13 : AOI22X1 port map( A => gregData_3_4_port, B => n3, C => 
                           gregData_2_4_port, D => n4_port, Y => n12);
   U14 : AOI22X1 port map( A => gregData_1_4_port, B => n5, C => 
                           gregData_0_4_port, D => n6, Y => n11);
   U15 : NAND2X1 port map( A => n13, B => n14, Y => rData(3));
   U16 : AOI22X1 port map( A => gregData_3_3_port, B => n3, C => 
                           gregData_2_3_port, D => n4_port, Y => n14);
   U17 : AOI22X1 port map( A => gregData_1_3_port, B => n5, C => 
                           gregData_0_3_port, D => n6, Y => n13);
   U18 : NAND2X1 port map( A => n15, B => n16, Y => rData(2));
   U19 : AOI22X1 port map( A => gregData_3_2_port, B => n3, C => 
                           gregData_2_2_port, D => n4_port, Y => n16);
   U20 : AOI22X1 port map( A => gregData_1_2_port, B => n5, C => 
                           gregData_0_2_port, D => n6, Y => n15);
   U21 : NAND2X1 port map( A => n17, B => n18, Y => rData(1));
   U22 : AOI22X1 port map( A => gregData_3_1_port, B => n3, C => 
                           gregData_2_1_port, D => n4_port, Y => n18);
   U23 : AOI22X1 port map( A => gregData_1_1_port, B => n5, C => 
                           gregData_0_1_port, D => n6, Y => n17);
   U24 : NAND2X1 port map( A => n19, B => n20, Y => rData(0));
   U25 : AOI22X1 port map( A => gregData_3_0_port, B => n3, C => 
                           gregData_2_0_port, D => n4_port, Y => n20);
   U26 : NOR2X1 port map( A => n21, B => rSel(0), Y => n4_port);
   U27 : NOR2X1 port map( A => n21, B => n22, Y => n3);
   U28 : AOI22X1 port map( A => gregData_1_0_port, B => n5, C => 
                           gregData_0_0_port, D => n6, Y => n19);
   U29 : NOR2X1 port map( A => rSel(0), B => rSel(1), Y => n6);
   U30 : NOR2X1 port map( A => n22, B => rSel(1), Y => n5);
   U31 : INVX1 port map( A => rSel(0), Y => n22);
   U32 : INVX1 port map( A => n23, Y => n67);
   U33 : MUX2X1 port map( B => wData(7), A => gregData_0_7_port, S => n24, Y =>
                           n23);
   U34 : INVX1 port map( A => n25, Y => n68);
   U35 : MUX2X1 port map( B => wData(7), A => gregData_1_7_port, S => n26, Y =>
                           n25);
   U36 : INVX1 port map( A => n27, Y => n69);
   U37 : MUX2X1 port map( B => wData(7), A => gregData_2_7_port, S => n28, Y =>
                           n27);
   U38 : INVX1 port map( A => n29, Y => n70);
   U39 : MUX2X1 port map( B => wData(7), A => gregData_3_7_port, S => n30, Y =>
                           n29);
   U40 : INVX1 port map( A => n31, Y => n71);
   U41 : MUX2X1 port map( B => wData(6), A => gregData_0_6_port, S => n24, Y =>
                           n31);
   U42 : INVX1 port map( A => n32, Y => n72);
   U43 : MUX2X1 port map( B => wData(6), A => gregData_1_6_port, S => n26, Y =>
                           n32);
   U44 : INVX1 port map( A => n33, Y => n73);
   U45 : MUX2X1 port map( B => wData(6), A => gregData_2_6_port, S => n28, Y =>
                           n33);
   U46 : INVX1 port map( A => n34, Y => n74);
   U47 : MUX2X1 port map( B => wData(6), A => gregData_3_6_port, S => n30, Y =>
                           n34);
   U48 : INVX1 port map( A => n35, Y => n75);
   U49 : MUX2X1 port map( B => wData(5), A => gregData_0_5_port, S => n24, Y =>
                           n35);
   U50 : INVX1 port map( A => n36, Y => n76);
   U51 : MUX2X1 port map( B => wData(5), A => gregData_1_5_port, S => n26, Y =>
                           n36);
   U52 : INVX1 port map( A => n37, Y => n78);
   U53 : MUX2X1 port map( B => wData(5), A => gregData_2_5_port, S => n28, Y =>
                           n37);
   U54 : INVX1 port map( A => n38, Y => n80);
   U55 : MUX2X1 port map( B => wData(5), A => gregData_3_5_port, S => n30, Y =>
                           n38);
   U56 : INVX1 port map( A => n39, Y => n82);
   U57 : MUX2X1 port map( B => wData(4), A => gregData_0_4_port, S => n24, Y =>
                           n39);
   U58 : INVX1 port map( A => n40, Y => n84);
   U59 : MUX2X1 port map( B => wData(4), A => gregData_1_4_port, S => n26, Y =>
                           n40);
   U60 : INVX1 port map( A => n41, Y => n86);
   U61 : MUX2X1 port map( B => wData(4), A => gregData_2_4_port, S => n28, Y =>
                           n41);
   U62 : INVX1 port map( A => n42, Y => n88);
   U63 : MUX2X1 port map( B => wData(4), A => gregData_3_4_port, S => n30, Y =>
                           n42);
   U64 : INVX1 port map( A => n43, Y => n90);
   U65 : MUX2X1 port map( B => wData(3), A => gregData_0_3_port, S => n24, Y =>
                           n43);
   U66 : INVX1 port map( A => n44, Y => n92);
   U67 : MUX2X1 port map( B => wData(3), A => gregData_1_3_port, S => n26, Y =>
                           n44);
   U68 : INVX1 port map( A => n45, Y => n94);
   U69 : MUX2X1 port map( B => wData(3), A => gregData_2_3_port, S => n28, Y =>
                           n45);
   U70 : INVX1 port map( A => n46, Y => n96);
   U71 : MUX2X1 port map( B => wData(3), A => gregData_3_3_port, S => n30, Y =>
                           n46);
   U72 : INVX1 port map( A => n47, Y => n98);
   U73 : MUX2X1 port map( B => wData(2), A => gregData_0_2_port, S => n24, Y =>
                           n47);
   U74 : INVX1 port map( A => n48, Y => n100);
   U75 : MUX2X1 port map( B => wData(2), A => gregData_1_2_port, S => n26, Y =>
                           n48);
   U76 : INVX1 port map( A => n49, Y => n102);
   U77 : MUX2X1 port map( B => wData(2), A => gregData_2_2_port, S => n28, Y =>
                           n49);
   U78 : INVX1 port map( A => n50, Y => n104);
   U79 : MUX2X1 port map( B => wData(2), A => gregData_3_2_port, S => n30, Y =>
                           n50);
   U80 : INVX1 port map( A => n51, Y => n106);
   U81 : MUX2X1 port map( B => wData(1), A => gregData_0_1_port, S => n24, Y =>
                           n51);
   U82 : INVX1 port map( A => n52, Y => n108);
   U83 : MUX2X1 port map( B => wData(1), A => gregData_1_1_port, S => n26, Y =>
                           n52);
   U84 : INVX1 port map( A => n53, Y => n110);
   U85 : MUX2X1 port map( B => wData(1), A => gregData_2_1_port, S => n28, Y =>
                           n53);
   U86 : INVX1 port map( A => n54, Y => n112);
   U87 : MUX2X1 port map( B => wData(1), A => gregData_3_1_port, S => n30, Y =>
                           n54);
   U88 : INVX1 port map( A => n55, Y => n114);
   U89 : MUX2X1 port map( B => wData(0), A => gregData_0_0_port, S => n24, Y =>
                           n55);
   U90 : NAND3X1 port map( A => n56, B => n57, C => n58, Y => n24);
   U91 : INVX1 port map( A => n59, Y => n116);
   U92 : MUX2X1 port map( B => wData(0), A => gregData_1_0_port, S => n26, Y =>
                           n59);
   U93 : NAND3X1 port map( A => n58, B => n57, C => wSel(0), Y => n26);
   U94 : INVX1 port map( A => wSel(1), Y => n57);
   U95 : INVX1 port map( A => n60, Y => n118);
   U96 : MUX2X1 port map( B => wData(0), A => gregData_2_0_port, S => n28, Y =>
                           n60);
   U97 : NAND3X1 port map( A => n58, B => n56, C => wSel(1), Y => n28);
   U98 : INVX1 port map( A => n61, Y => n120);
   U99 : MUX2X1 port map( B => wData(0), A => gregData_3_0_port, S => n30, Y =>
                           n61);
   U100 : NAND3X1 port map( A => wSel(0), B => n58, C => wSel(1), Y => n30);
   U101 : NOR2X1 port map( A => n62, B => fifoFull_port, Y => n58);
   U102 : INVX1 port map( A => wEnable, Y => n62);
   U103 : NOR2X1 port map( A => n63, B => n64, Y => N7);
   U104 : XNOR2X1 port map( A => n56, B => n65, Y => n64);
   U105 : XNOR2X1 port map( A => rSel(0), B => wSel(0), Y => n63);
   U106 : NOR2X1 port map( A => n65, B => n66, Y => N4);
   U107 : XNOR2X1 port map( A => n56, B => rSel(0), Y => n66);
   U108 : INVX1 port map( A => wSel(0), Y => n56);
   U109 : XNOR2X1 port map( A => n21, B => wSel(1), Y => n65);
   U110 : INVX1 port map( A => rSel(1), Y => n21);

end SYN_FifoRam_arch;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity sd_control is

   port( clk, rst, sd_clock, fifo_empty : in std_logic;  data_in : in 
         std_logic_vector (7 downto 0);  data_out : out std_logic_vector (7 
         downto 0);  clk_mode, tsr_load, sd_enable, clk_enable, data_read : out
         std_logic);

end sd_control;

architecture SYN_sd_arch of sd_control is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI22X1
      port( A, B, C, D : in std_logic;  Y : out std_logic);
   end component;
   
   component MUX2X1
      port( B, A, S : in std_logic;  Y : out std_logic);
   end component;
   
   component AND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI22X1
      port( A, B, C, D : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component HAX1
      port( A, B : in std_logic;  YC, YS : out std_logic);
   end component;
   
   component sd_control_DW01_inc_0
      port( A : in std_logic_vector (6 downto 0);  SUM : out std_logic_vector 
            (6 downto 0));
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal clk_mode_port, sd_enable_port, sd_3_port, sd_2_port, sd_1_port, 
      sd_0_port, count1_6_port, count1_5_port, count1_4_port, count1_3_port, 
      count1_2_port, count1_1_port, count1_0_port, count2_4_port, count2_3_port
      , count2_2_port, count2_1_port, count2_0_port, count3_2_port, 
      count3_1_port, count3_0_port, sd_clock1, sd_clock2, sdc, nextSd_3_port, 
      nextSd_2_port, nextSd_1_port, nextSd_0_port, nextCount2_4_port, 
      nextCount2_3_port, nextCount2_2_port, nextCount2_1_port, 
      nextCount2_0_port, N77, N588, N589, N590, n2, n3, n4, n5, n6, n7, n8, n63
      , n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, 
      n77_port, n78, n79, n80, n81, n82, n83, n84, n313, n314, n315, n316, n317
      , n318, n319, n320, n321, n322, r362_carry_2_port, r362_carry_3_port, 
      r362_carry_4_port, n1, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, 
      n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33
      , n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, 
      n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62
      , n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, 
      n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, 
      n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, 
      n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, 
      n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, 
      n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, 
      n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, 
      n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, 
      n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, 
      n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, 
      n207, n208, n209, n210, n211, n212, n213, n214, n215, n216 : std_logic;

begin
   clk_mode <= clk_mode_port;
   sd_enable <= sd_enable_port;
   
   sd_clock1_reg : DFFSR port map( D => sd_clock, CLK => clk, R => rst, S => 
                           n84, Q => sd_clock1);
   sd_clock2_reg : DFFSR port map( D => sd_clock1, CLK => clk, R => rst, S => 
                           n83, Q => sd_clock2);
   sdc_reg : DFFSR port map( D => N77, CLK => clk, R => rst, S => n82, Q => sdc
                           );
   sd_reg_0_inst : DFFSR port map( D => nextSd_0_port, CLK => clk, R => rst, S 
                           => n81, Q => sd_0_port);
   sd_reg_2_inst : DFFSR port map( D => nextSd_2_port, CLK => clk, R => rst, S 
                           => n80, Q => sd_2_port);
   sd_reg_1_inst : DFFSR port map( D => nextSd_1_port, CLK => clk, R => rst, S 
                           => n79, Q => sd_1_port);
   sd_reg_3_inst : DFFSR port map( D => nextSd_3_port, CLK => clk, R => rst, S 
                           => n78, Q => sd_3_port);
   count1_reg_3_inst : DFFSR port map( D => n318, CLK => clk, R => rst, S => 
                           n77_port, Q => count1_3_port);
   count1_reg_6_inst : DFFSR port map( D => n322, CLK => clk, R => rst, S => 
                           n76, Q => count1_6_port);
   count1_reg_0_inst : DFFSR port map( D => n315, CLK => clk, R => rst, S => 
                           n75, Q => count1_0_port);
   count1_reg_1_inst : DFFSR port map( D => n316, CLK => clk, R => rst, S => 
                           n74, Q => count1_1_port);
   count1_reg_2_inst : DFFSR port map( D => n317, CLK => clk, R => rst, S => 
                           n73, Q => count1_2_port);
   count1_reg_4_inst : DFFSR port map( D => n319, CLK => clk, R => rst, S => 
                           n72, Q => count1_4_port);
   count1_reg_5_inst : DFFSR port map( D => n320, CLK => clk, R => rst, S => 
                           n71, Q => count1_5_port);
   count3_reg_0_inst : DFFSR port map( D => n313, CLK => clk, R => rst, S => 
                           n70, Q => count3_0_port);
   count3_reg_1_inst : DFFSR port map( D => n314, CLK => clk, R => rst, S => 
                           n69, Q => count3_1_port);
   count3_reg_2_inst : DFFSR port map( D => n321, CLK => clk, R => rst, S => 
                           n68, Q => count3_2_port);
   count2_reg_0_inst : DFFSR port map( D => nextCount2_0_port, CLK => clk, R =>
                           rst, S => n67, Q => count2_0_port);
   count2_reg_4_inst : DFFSR port map( D => nextCount2_4_port, CLK => clk, R =>
                           rst, S => n66, Q => count2_4_port);
   count2_reg_3_inst : DFFSR port map( D => nextCount2_3_port, CLK => clk, R =>
                           rst, S => n65, Q => count2_3_port);
   count2_reg_2_inst : DFFSR port map( D => nextCount2_2_port, CLK => clk, R =>
                           rst, S => n64, Q => count2_2_port);
   count2_reg_1_inst : DFFSR port map( D => nextCount2_1_port, CLK => clk, R =>
                           rst, S => n63, Q => count2_1_port);
   n63 <= '1';
   n64 <= '1';
   n65 <= '1';
   n66 <= '1';
   n67 <= '1';
   n68 <= '1';
   n69 <= '1';
   n70 <= '1';
   n71 <= '1';
   n72 <= '1';
   n73 <= '1';
   n74 <= '1';
   n75 <= '1';
   n76 <= '1';
   n77_port <= '1';
   n78 <= '1';
   n79 <= '1';
   n80 <= '1';
   n81 <= '1';
   n82 <= '1';
   n83 <= '1';
   n84 <= '1';
   r400 : sd_control_DW01_inc_0 port map( A(6) => count1_6_port, A(5) => 
                           count1_5_port, A(4) => count1_4_port, A(3) => 
                           count1_3_port, A(2) => count1_2_port, A(1) => 
                           count1_1_port, A(0) => count1_0_port, SUM(6) => n2, 
                           SUM(5) => n3, SUM(4) => n4, SUM(3) => n5, SUM(2) => 
                           n6, SUM(1) => n7, SUM(0) => n8);
   r362_U1_1_1 : HAX1 port map( A => count2_1_port, B => count2_0_port, YC => 
                           r362_carry_2_port, YS => N588);
   r362_U1_1_2 : HAX1 port map( A => count2_2_port, B => r362_carry_2_port, YC 
                           => r362_carry_3_port, YS => N589);
   r362_U1_1_3 : HAX1 port map( A => count2_3_port, B => r362_carry_3_port, YC 
                           => r362_carry_4_port, YS => N590);
   U25 : AOI21X1 port map( A => n152, B => n52, C => n48, Y => n55);
   U26 : AOI22X1 port map( A => n111, B => count2_4_port, C => 
                           r362_carry_4_port, D => n103, Y => n1);
   U27 : INVX2 port map( A => n1, Y => nextCount2_4_port);
   U28 : NAND3X1 port map( A => n9, B => n10, C => n11, Y => tsr_load);
   U29 : AOI22X1 port map( A => n12, B => n13, C => n14, D => n15, Y => n11);
   U30 : NAND3X1 port map( A => n16, B => n17, C => n18, Y => n15);
   U31 : NOR2X1 port map( A => n19, B => n20, Y => n18);
   U32 : OAI21X1 port map( A => n21, B => n22, C => n23, Y => n20);
   U33 : NAND2X1 port map( A => count3_0_port, B => n24, Y => n22);
   U34 : OR2X1 port map( A => n25, B => count3_1_port, Y => n21);
   U35 : AOI22X1 port map( A => n26, B => n27, C => n28, D => n29, Y => n16);
   U36 : OAI21X1 port map( A => n30, B => n31, C => n32, Y => n13);
   U37 : OAI21X1 port map( A => n33, B => n31, C => n34, Y => nextSd_3_port);
   U38 : AOI21X1 port map( A => n28, B => n35, C => clk_mode_port, Y => n34);
   U39 : INVX1 port map( A => n36, Y => n33);
   U40 : NAND3X1 port map( A => n37, B => n38, C => n39, Y => nextSd_2_port);
   U41 : NOR2X1 port map( A => n40, B => n19, Y => n39);
   U42 : NAND2X1 port map( A => n41, B => n42, Y => n19);
   U43 : NAND3X1 port map( A => n43, B => n44, C => n45, Y => n40);
   U44 : AOI21X1 port map( A => n46, B => n47, C => n48, Y => n38);
   U45 : NOR2X1 port map( A => n49, B => n50, Y => n46);
   U46 : INVX1 port map( A => n51, Y => n37);
   U47 : OAI22X1 port map( A => n32, B => n52, C => n9, D => n53, Y => n51);
   U48 : NAND3X1 port map( A => n54, B => n55, C => n56, Y => nextSd_1_port);
   U49 : NOR2X1 port map( A => n57, B => n58, Y => n56);
   U50 : OAI22X1 port map( A => n42, B => n59, C => n60, D => n61, Y => n58);
   U51 : INVX1 port map( A => n62, Y => n61);
   U52 : OAI22X1 port map( A => n17, B => n85, C => n86, D => n53, Y => n57);
   U53 : NOR2X1 port map( A => n87, B => n88, Y => n54);
   U54 : OR2X1 port map( A => n89, B => n90, Y => nextSd_0_port);
   U55 : NAND3X1 port map( A => n91, B => n92, C => n93, Y => n90);
   U56 : MUX2X1 port map( B => n94, A => n95, S => n85, Y => n93);
   U57 : INVX1 port map( A => n49, Y => n85);
   U58 : INVX1 port map( A => n87, Y => n92);
   U59 : OAI21X1 port map( A => sdc, B => n9, C => n45, Y => n87);
   U60 : INVX1 port map( A => n96, Y => n91);
   U61 : MUX2X1 port map( B => n10, A => n97, S => n53, Y => n96);
   U62 : NAND3X1 port map( A => n98, B => n60, C => n99, Y => n89);
   U63 : AOI22X1 port map( A => n100, B => n59, C => n24, D => n101, Y => n99);
   U64 : OAI21X1 port map( A => n102, B => n104, C => n105, Y => 
                           nextCount2_3_port);
   U65 : NAND2X1 port map( A => N590, B => n103, Y => n105);
   U66 : OAI21X1 port map( A => n102, B => n106, C => n107, Y => 
                           nextCount2_2_port);
   U67 : NAND2X1 port map( A => N589, B => n103, Y => n107);
   U68 : OAI21X1 port map( A => n102, B => n108, C => n109, Y => 
                           nextCount2_1_port);
   U69 : NAND2X1 port map( A => N588, B => n103, Y => n109);
   U70 : MUX2X1 port map( B => n110, A => n102, S => count2_0_port, Y => 
                           nextCount2_0_port);
   U71 : INVX1 port map( A => n111, Y => n102);
   U72 : OAI21X1 port map( A => n112, B => n113, C => n114, Y => n111);
   U73 : INVX1 port map( A => n103, Y => n110);
   U74 : OAI21X1 port map( A => n42, B => n115, C => n116, Y => n103);
   U75 : NAND3X1 port map( A => n26, B => n27, C => n49, Y => n116);
   U76 : OAI21X1 port map( A => n117, B => n118, C => n119, Y => n322);
   U77 : NAND2X1 port map( A => n2, B => n120, Y => n119);
   U78 : INVX1 port map( A => count1_6_port, Y => n118);
   U79 : OAI21X1 port map( A => n121, B => n25, C => n122, Y => n321);
   U80 : NAND3X1 port map( A => n123, B => count3_0_port, C => count3_1_port, Y
                           => n122);
   U81 : INVX1 port map( A => count3_2_port, Y => n25);
   U82 : OAI21X1 port map( A => n117, B => n124, C => n125, Y => n320);
   U83 : NAND2X1 port map( A => n3, B => n120, Y => n125);
   U84 : INVX1 port map( A => count1_5_port, Y => n124);
   U85 : OAI21X1 port map( A => n117, B => n126, C => n127, Y => n319);
   U86 : NAND2X1 port map( A => n4, B => n120, Y => n127);
   U87 : OAI21X1 port map( A => n117, B => n128, C => n129, Y => n318);
   U88 : NAND2X1 port map( A => n5, B => n120, Y => n129);
   U89 : OAI21X1 port map( A => n117, B => n130, C => n131, Y => n317);
   U90 : NAND2X1 port map( A => n6, B => n120, Y => n131);
   U91 : OAI21X1 port map( A => n117, B => n132, C => n133, Y => n316);
   U92 : NAND2X1 port map( A => n7, B => n120, Y => n133);
   U93 : OAI21X1 port map( A => n117, B => n134, C => n135, Y => n315);
   U94 : NAND2X1 port map( A => n8, B => n120, Y => n135);
   U95 : OAI21X1 port map( A => n62, B => n60, C => n136, Y => n120);
   U96 : INVX1 port map( A => n137, Y => n136);
   U97 : AOI21X1 port map( A => n44, B => n138, C => n112, Y => n137);
   U98 : NOR2X1 port map( A => n139, B => n140, Y => n62);
   U99 : NAND3X1 port map( A => count1_3_port, B => count1_2_port, C => 
                           count1_6_port, Y => n140);
   U100 : NAND3X1 port map( A => count1_0_port, B => n132, C => n141, Y => n139
                           );
   U101 : NOR2X1 port map( A => count1_5_port, B => count1_4_port, Y => n141);
   U102 : INVX1 port map( A => count1_0_port, Y => n134);
   U103 : AND2X1 port map( A => n142, B => n97, Y => n117);
   U104 : NAND2X1 port map( A => n143, B => n144, Y => n97);
   U105 : OAI21X1 port map( A => n145, B => n146, C => n112, Y => n142);
   U106 : NAND3X1 port map( A => n147, B => n148, C => sdc, Y => n112);
   U107 : NAND3X1 port map( A => count1_1_port, B => count1_0_port, C => 
                           count1_2_port, Y => n148);
   U108 : OAI21X1 port map( A => n149, B => n49, C => n114, Y => n146);
   U109 : AOI21X1 port map( A => n100, B => n150, C => n151, Y => n114);
   U110 : AOI21X1 port map( A => n26, B => n49, C => n55, Y => n151);
   U111 : NOR2X1 port map( A => n36, B => n31, Y => n48);
   U112 : OAI21X1 port map( A => count3_1_port, B => n52, C => n101, Y => n36);
   U113 : OR2X1 port map( A => n52, B => n30, Y => n101);
   U114 : NAND2X1 port map( A => n152, B => n52, Y => n98);
   U115 : NAND2X1 port map( A => sdc, B => n12, Y => n52);
   U116 : INVX1 port map( A => n153, Y => n12);
   U117 : NOR2X1 port map( A => n154, B => count2_0_port, Y => n26);
   U118 : AND2X1 port map( A => n115, B => n59, Y => n150);
   U119 : NAND3X1 port map( A => n155, B => n49, C => n156, Y => n59);
   U120 : NOR2X1 port map( A => count2_3_port, B => count2_2_port, Y => n156);
   U121 : NAND2X1 port map( A => sdc, B => n157, Y => n115);
   U122 : NOR2X1 port map( A => n158, B => n159, Y => n149);
   U123 : OAI21X1 port map( A => n160, B => n29, C => n161, Y => n145);
   U124 : MUX2X1 port map( B => n162, A => n121, S => count3_1_port, Y => n314)
                           ;
   U125 : INVX1 port map( A => n163, Y => n121);
   U126 : OAI21X1 port map( A => count3_0_port, B => n160, C => n164, Y => n163
                           );
   U127 : NAND2X1 port map( A => n123, B => count3_0_port, Y => n162);
   U128 : MUX2X1 port map( B => n45, A => n164, S => count3_0_port, Y => n313);
   U129 : AOI21X1 port map( A => n35, B => n28, C => n24, Y => n164);
   U130 : INVX1 port map( A => n160, Y => n28);
   U131 : INVX1 port map( A => n123, Y => n45);
   U132 : NOR2X1 port map( A => n35, B => n160, Y => n123);
   U133 : NAND2X1 port map( A => n49, B => n29, Y => n35);
   U134 : NOR2X1 port map( A => n53, B => n165, Y => n49);
   U135 : INVX1 port map( A => sdc, Y => n53);
   U136 : INVX1 port map( A => n10, Y => data_read);
   U137 : NAND2X1 port map( A => n166, B => n167, Y => data_out(7));
   U138 : AOI22X1 port map( A => n168, B => n165, C => data_in(7), D => n158, Y
                           => n166);
   U139 : NAND3X1 port map( A => n169, B => n170, C => n171, Y => data_out(6));
   U140 : NOR2X1 port map( A => n172, B => n173, Y => n171);
   U141 : OAI21X1 port map( A => n14, B => n43, C => n174, Y => n173);
   U142 : NAND3X1 port map( A => n160, B => n9, C => n113, Y => n172);
   U143 : AOI21X1 port map( A => data_in(6), B => n158, C => n27, Y => n170);
   U144 : NOR2X1 port map( A => n175, B => n94, Y => n169);
   U145 : NAND2X1 port map( A => n176, B => n41, Y => n94);
   U146 : INVX1 port map( A => n88, Y => n176);
   U147 : OAI21X1 port map( A => n177, B => n41, C => n23, Y => n88);
   U148 : NAND2X1 port map( A => n178, B => n179, Y => data_out(5));
   U149 : AOI21X1 port map( A => data_in(5), B => n158, C => n152, Y => n178);
   U150 : NAND2X1 port map( A => n180, B => n181, Y => data_out(4));
   U151 : AOI21X1 port map( A => data_in(4), B => n158, C => n182, Y => n180);
   U152 : NAND2X1 port map( A => n183, B => n181, Y => data_out(3));
   U153 : NOR3X1 port map( A => n159, B => n152, C => n184, Y => n181);
   U154 : AOI21X1 port map( A => data_in(3), B => n158, C => n185, Y => n183);
   U155 : INVX1 port map( A => n174, Y => n185);
   U156 : NAND2X1 port map( A => n186, B => n167, Y => data_out(2));
   U157 : INVX1 port map( A => n187, Y => n167);
   U158 : NAND3X1 port map( A => n32, B => n188, C => n189, Y => n187);
   U159 : AOI21X1 port map( A => data_in(2), B => n158, C => n168, Y => n186);
   U160 : INVX1 port map( A => n43, Y => n168);
   U161 : NAND2X1 port map( A => n190, B => n179, Y => data_out(1));
   U162 : INVX1 port map( A => n191, Y => n179);
   U163 : NAND3X1 port map( A => n174, B => n43, C => n189, Y => n191);
   U164 : NOR2X1 port map( A => n184, B => n192, Y => n189);
   U165 : OAI21X1 port map( A => n14, B => n113, C => n193, Y => n192);
   U166 : NAND2X1 port map( A => n194, B => n195, Y => n184);
   U167 : OAI21X1 port map( A => n30, B => n153, C => n24, Y => n195);
   U168 : INVX1 port map( A => n31, Y => n24);
   U169 : INVX1 port map( A => n29, Y => n30);
   U170 : OAI21X1 port map( A => count3_1_port, B => count3_0_port, C => 
                           count3_2_port, Y => n29);
   U171 : OAI21X1 port map( A => n196, B => n197, C => n182, Y => n174);
   U172 : NAND2X1 port map( A => n155, B => n14, Y => n197);
   U173 : NOR3X1 port map( A => count2_0_port, B => count2_4_port, C => n108, Y
                           => n155);
   U174 : NAND2X1 port map( A => n106, B => n104, Y => n196);
   U175 : INVX1 port map( A => count2_3_port, Y => n104);
   U176 : AOI22X1 port map( A => n152, B => n153, C => data_in(1), D => n158, Y
                           => n190);
   U177 : NAND3X1 port map( A => n198, B => n194, C => n199, Y => data_out(0));
   U178 : AOI21X1 port map( A => n152, B => n153, C => n200, Y => n199);
   U179 : NAND2X1 port map( A => n31, B => n188, Y => n200);
   U180 : INVX1 port map( A => n182, Y => n188);
   U181 : NOR2X1 port map( A => n42, B => n157, Y => n182);
   U182 : NAND2X1 port map( A => count2_0_port, B => n157, Y => n153);
   U183 : NOR2X1 port map( A => n154, B => n165, Y => n157);
   U184 : NAND3X1 port map( A => n108, B => n106, C => n201, Y => n154);
   U185 : NOR2X1 port map( A => count2_4_port, B => count2_3_port, Y => n201);
   U186 : INVX1 port map( A => count2_2_port, Y => n106);
   U187 : INVX1 port map( A => count2_1_port, Y => n108);
   U188 : INVX1 port map( A => n32, Y => n152);
   U189 : INVX1 port map( A => n175, Y => n194);
   U190 : NAND2X1 port map( A => n161, B => n202, Y => n175);
   U191 : OAI21X1 port map( A => fifo_empty, B => n165, C => n158, Y => n161);
   U192 : AOI21X1 port map( A => data_in(0), B => n158, C => n159, Y => n198);
   U193 : NAND3X1 port map( A => n32, B => n44, C => n203, Y => clk_mode_port);
   U194 : NOR2X1 port map( A => n47, B => n95, Y => n203);
   U195 : INVX1 port map( A => n23, Y => n47);
   U196 : OR2X1 port map( A => n204, B => n205, Y => clk_enable);
   U197 : OAI21X1 port map( A => n14, B => n44, C => n138, Y => n205);
   U198 : NOR3X1 port map( A => n159, B => n100, C => n27, Y => n138);
   U199 : NAND2X1 port map( A => n32, B => n31, Y => n27);
   U200 : NAND3X1 port map( A => sd_1_port, B => sd_2_port, C => n144, Y => n31
                           );
   U201 : NAND3X1 port map( A => sd_0_port, B => sd_3_port, C => n206, Y => n32
                           );
   U202 : INVX1 port map( A => n42, Y => n100);
   U203 : NAND3X1 port map( A => sd_2_port, B => n177, C => n144, Y => n42);
   U204 : NAND2X1 port map( A => n193, B => n17, Y => n159);
   U205 : INVX1 port map( A => n95, Y => n17);
   U206 : NAND2X1 port map( A => n113, B => n43, Y => n95);
   U207 : NAND3X1 port map( A => sd_0_port, B => sd_3_port, C => n207, Y => n43
                           );
   U208 : NOR2X1 port map( A => sd_1_port, B => n50, Y => n207);
   U209 : INVX1 port map( A => sd_2_port, Y => n50);
   U210 : NAND3X1 port map( A => sd_0_port, B => sd_3_port, C => n143, Y => 
                           n113);
   U211 : INVX1 port map( A => n208, Y => n193);
   U212 : NAND3X1 port map( A => n41, B => n160, C => n23, Y => n208);
   U213 : NAND3X1 port map( A => sd_3_port, B => n209, C => sd_1_port, Y => n23
                           );
   U214 : NAND3X1 port map( A => sd_3_port, B => n209, C => n143, Y => n160);
   U215 : NAND3X1 port map( A => n209, B => n210, C => sd_2_port, Y => n41);
   U216 : NAND3X1 port map( A => n10, B => n202, C => n9, Y => n204);
   U217 : NAND2X1 port map( A => n144, B => n206, Y => n9);
   U218 : NOR2X1 port map( A => n209, B => sd_3_port, Y => n144);
   U219 : INVX1 port map( A => sd_enable_port, Y => n202);
   U220 : NAND2X1 port map( A => n86, B => n60, Y => sd_enable_port);
   U221 : NAND3X1 port map( A => n209, B => n210, C => n206, Y => n60);
   U222 : NOR2X1 port map( A => n177, B => sd_2_port, Y => n206);
   U223 : INVX1 port map( A => sd_1_port, Y => n177);
   U224 : INVX1 port map( A => sd_0_port, Y => n209);
   U225 : NAND2X1 port map( A => n143, B => n210, Y => n86);
   U226 : INVX1 port map( A => sd_3_port, Y => n210);
   U227 : NOR2X1 port map( A => sd_1_port, B => sd_2_port, Y => n143);
   U228 : NAND3X1 port map( A => n14, B => n211, C => n158, Y => n10);
   U229 : INVX1 port map( A => n44, Y => n158);
   U230 : NAND3X1 port map( A => sd_3_port, B => sd_2_port, C => n212, Y => n44
                           );
   U231 : NOR2X1 port map( A => sd_1_port, B => sd_0_port, Y => n212);
   U232 : INVX1 port map( A => fifo_empty, Y => n211);
   U233 : INVX1 port map( A => n165, Y => n14);
   U234 : NAND3X1 port map( A => count1_0_port, B => n147, C => n213, Y => n165
                           );
   U235 : NOR2X1 port map( A => n132, B => n130, Y => n213);
   U236 : INVX1 port map( A => count1_2_port, Y => n130);
   U237 : INVX1 port map( A => count1_1_port, Y => n132);
   U238 : INVX1 port map( A => n214, Y => n147);
   U239 : NAND3X1 port map( A => n128, B => n126, C => n215, Y => n214);
   U240 : NOR2X1 port map( A => count1_6_port, B => count1_5_port, Y => n215);
   U241 : INVX1 port map( A => count1_4_port, Y => n126);
   U242 : INVX1 port map( A => count1_3_port, Y => n128);
   U243 : NOR2X1 port map( A => sd_clock2, B => n216, Y => N77);
   U244 : INVX1 port map( A => sd_clock1, Y => n216);

end SYN_sd_arch;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity interceptor is

   port( clk, eop, intercept : in std_logic;  inst : in std_logic_vector (3 
         downto 0);  rst, usbclk : in std_logic;  dataPlus, dataMinus : out 
         std_logic;  computerMinus, computerPlus, usbMinus, usbPlus : inout 
         std_logic);

end interceptor;

architecture SYN_struct of interceptor is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component MUX2X1
      port( B, A, S : in std_logic;  Y : out std_logic);
   end component;
   
   component usbInterceptor
      port( usbClk, rst, intercept, usbDataPlus, usbDataMinus, usbLock, clk, 
            eop : in std_logic;  usbDataPlusOutput, usbDataMinusOutput : out 
            std_logic);
   end component;
   
   component tristate_0
      port( lock, interceptorOutput : in std_logic;  interceptorInput : out 
            std_logic;  dataLine : inout std_logic);
   end component;
   
   component tristate_1
      port( lock, interceptorOutput : in std_logic;  interceptorInput : out 
            std_logic;  dataLine : inout std_logic);
   end component;
   
   component tristate_2
      port( lock, interceptorOutput : in std_logic;  interceptorInput : out 
            std_logic;  dataLine : inout std_logic);
   end component;
   
   component tristate_3
      port( lock, interceptorOutput : in std_logic;  interceptorInput : out 
            std_logic;  dataLine : inout std_logic);
   end component;
   
   component lockingDetector
      port( endOfPacket, rst, clk : in std_logic;  inst : in std_logic_vector 
            (3 downto 0);  usbLock, computerLock : out std_logic);
   end component;
   
   component computerInterceptor
      port( usbClk, rst, computerDataPlus, computerDataMinus, computerLock, clk
            , eop : in std_logic;  computerDataPlusOutput, 
            computerDataMinusOutput : out std_logic);
   end component;
   
   signal computerDataMinus, computerDataPlus, computerLock, 
      computerDataMinusOutput, computerDataPlusOutput, usbLock, usbDataMinus, 
      usbDataPlusOutput, usbDataPlus, usbDataMinusOutput, n1, n2, n3, n4, n5 : 
      std_logic;

begin
   
   U_0 : computerInterceptor port map( usbClk => usbclk, rst => rst, 
                           computerDataPlus => computerDataPlus, 
                           computerDataMinus => computerDataMinus, computerLock
                           => computerLock, clk => clk, eop => eop, 
                           computerDataPlusOutput => computerDataPlusOutput, 
                           computerDataMinusOutput => computerDataMinusOutput);
   U_1 : lockingDetector port map( endOfPacket => eop, rst => rst, clk => clk, 
                           inst(3) => inst(3), inst(2) => inst(2), inst(1) => 
                           inst(1), inst(0) => inst(0), usbLock => usbLock, 
                           computerLock => computerLock);
   U_2 : tristate_3 port map( lock => computerLock, interceptorOutput => 
                           computerDataMinusOutput, interceptorInput => 
                           usbDataMinus, dataLine => usbMinus);
   U_3 : tristate_2 port map( lock => usbLock, interceptorOutput => 
                           usbDataPlusOutput, interceptorInput => 
                           computerDataPlus, dataLine => computerPlus);
   U_5 : tristate_1 port map( lock => computerLock, interceptorOutput => 
                           computerDataPlusOutput, interceptorInput => 
                           usbDataPlus, dataLine => usbPlus);
   U_6 : tristate_0 port map( lock => usbLock, interceptorOutput => 
                           usbDataMinusOutput, interceptorInput => 
                           computerDataMinus, dataLine => computerMinus);
   U_4 : usbInterceptor port map( usbClk => usbclk, rst => rst, intercept => 
                           intercept, usbDataPlus => usbDataPlus, usbDataMinus 
                           => usbDataMinus, usbLock => usbLock, clk => clk, eop
                           => eop, usbDataPlusOutput => usbDataPlusOutput, 
                           usbDataMinusOutput => usbDataMinusOutput);
   U2 : MUX2X1 port map( B => n1, A => n2, S => usbLock, Y => dataPlus);
   U3 : INVX1 port map( A => usbPlus, Y => n2);
   U4 : NOR2X1 port map( A => computerPlus, B => n3, Y => n1);
   U5 : MUX2X1 port map( B => n4, A => n5, S => usbLock, Y => dataMinus);
   U6 : INVX1 port map( A => usbMinus, Y => n5);
   U7 : NOR2X1 port map( A => computerMinus, B => n3, Y => n4);
   U8 : INVX1 port map( A => computerLock, Y => n3);

end SYN_struct;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity decoder is

   port( clk, rst, data0, data1, halt : in std_logic;  data : out 
         std_logic_vector (1 downto 0);  inst : out std_logic_vector (3 downto 
         0);  data_out : out std_logic_vector (7 downto 0);  dclk, eopOut : out
         std_logic);

end decoder;

architecture SYN_BLK of decoder is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component XNOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component timer
      port( clk, rst, egde_det, f_egde_det, EOP : in std_logic;  data_clk, 
            shift_en : out std_logic);
   end component;
   
   component shift_greg
      port( clk, rst, shift_en, data_in : in std_logic;  data_out : out 
            std_logic_vector (7 downto 0);  data_ready : out std_logic);
   end component;
   
   component NRZIdecode
      port( clk, rst, data0, enable, EOP : in std_logic;  data_out : out 
            std_logic);
   end component;
   
   component SEE_det
      port( clk, rst, data0, data1 : in std_logic;  EGDE, F_EGDE, EOP : out 
            std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal data_out_7_port, data_out_6_port, data_out_5_port, data_out_4_port, 
      data_out_3_port, data_out_2_port, data_out_1_port, data_out_0_port, 
      eopOut_port, CS_3_port, CS_2_port, CS_1_port, CS_0_port, data_ready_0, 
      data_ready_1, nxt_data_1_port, nxt_inst_3_port, nxt_inst_2_port, 
      nxt_inst_1_port, nxt_inst_0_port, data_ready, egde, fegde, shift_enable, 
      act_data, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n67, n68, 
      n69, n70, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25
      , n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, 
      n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54
      , n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66 : std_logic;

begin
   data_out <= ( data_out_7_port, data_out_6_port, data_out_5_port, 
      data_out_4_port, data_out_3_port, data_out_2_port, data_out_1_port, 
      data_out_0_port );
   eopOut <= eopOut_port;
   
   data_ready_0_reg : DFFSR port map( D => data_ready, CLK => clk, R => rst, S 
                           => n12, Q => data_ready_0);
   data_ready_1_reg : DFFSR port map( D => data_ready_0, CLK => clk, R => rst, 
                           S => n11, Q => data_ready_1);
   CS_reg_0_inst : DFFSR port map( D => n69, CLK => clk, R => rst, S => n10, Q 
                           => CS_0_port);
   CS_reg_1_inst : DFFSR port map( D => n67, CLK => clk, R => rst, S => n9, Q 
                           => CS_1_port);
   CS_reg_2_inst : DFFSR port map( D => n68, CLK => clk, R => rst, S => n8, Q 
                           => CS_2_port);
   CS_reg_3_inst : DFFSR port map( D => n70, CLK => clk, R => rst, S => n7, Q 
                           => CS_3_port);
   cur_data_reg_1_inst : DFFSR port map( D => nxt_data_1_port, CLK => clk, R =>
                           rst, S => n6, Q => data(1));
   cur_data_reg_0_inst : DFFSR port map( D => n66, CLK => clk, R => rst, S => 
                           n5, Q => data(0));
   cur_inst_reg_3_inst : DFFSR port map( D => nxt_inst_3_port, CLK => clk, R =>
                           rst, S => n4, Q => inst(3));
   cur_inst_reg_2_inst : DFFSR port map( D => nxt_inst_2_port, CLK => clk, R =>
                           rst, S => n3, Q => inst(2));
   cur_inst_reg_1_inst : DFFSR port map( D => nxt_inst_1_port, CLK => clk, R =>
                           rst, S => n2, Q => inst(1));
   cur_inst_reg_0_inst : DFFSR port map( D => nxt_inst_0_port, CLK => clk, R =>
                           rst, S => n1, Q => inst(0));
   n1 <= '1';
   n2 <= '1';
   n3 <= '1';
   n4 <= '1';
   n5 <= '1';
   n6 <= '1';
   n7 <= '1';
   n8 <= '1';
   n9 <= '1';
   n10 <= '1';
   n11 <= '1';
   n12 <= '1';
   part2 : SEE_det port map( clk => clk, rst => rst, data0 => data0, data1 => 
                           data1, EGDE => egde, F_EGDE => fegde, EOP => 
                           eopOut_port);
   part3 : NRZIdecode port map( clk => clk, rst => rst, data0 => data0, enable 
                           => shift_enable, EOP => eopOut_port, data_out => 
                           act_data);
   part4 : shift_greg port map( clk => clk, rst => rst, shift_en => 
                           shift_enable, data_in => act_data, data_out(7) => 
                           data_out_7_port, data_out(6) => data_out_6_port, 
                           data_out(5) => data_out_5_port, data_out(4) => 
                           data_out_4_port, data_out(3) => data_out_3_port, 
                           data_out(2) => data_out_2_port, data_out(1) => 
                           data_out_1_port, data_out(0) => data_out_0_port, 
                           data_ready => data_ready);
   part5 : timer port map( clk => clk, rst => rst, egde_det => egde, f_egde_det
                           => fegde, EOP => eopOut_port, data_clk => dclk, 
                           shift_en => shift_enable);
   U15 : NOR2X1 port map( A => n13, B => n14, Y => nxt_inst_3_port);
   U16 : AND2X1 port map( A => n15, B => data_out_5_port, Y => nxt_inst_2_port)
                           ;
   U17 : NOR2X1 port map( A => n13, B => n16, Y => nxt_inst_0_port);
   U18 : INVX1 port map( A => n17, Y => n66);
   U19 : OAI21X1 port map( A => n18, B => n19, C => n20, Y => n69);
   U20 : NAND3X1 port map( A => n21, B => n22, C => data_ready_0, Y => n20);
   U21 : OAI21X1 port map( A => CS_2_port, B => n23, C => n19, Y => n21);
   U22 : INVX1 port map( A => n24, Y => n19);
   U23 : OAI21X1 port map( A => n25, B => n26, C => n27, Y => n24);
   U24 : NOR2X1 port map( A => n70, B => n18, Y => n27);
   U25 : AND2X1 port map( A => n28, B => n29, Y => n70);
   U26 : OAI21X1 port map( A => n30, B => n31, C => n32, Y => n28);
   U27 : NAND3X1 port map( A => CS_3_port, B => CS_0_port, C => n33, Y => n32);
   U28 : NOR2X1 port map( A => CS_2_port, B => CS_1_port, Y => n33);
   U29 : OAI21X1 port map( A => n34, B => n35, C => data_ready_0, Y => n26);
   U30 : NAND2X1 port map( A => n22, B => n29, Y => n25);
   U31 : INVX1 port map( A => data_ready_1, Y => n22);
   U32 : OR2X1 port map( A => n36, B => n37, Y => n68);
   U33 : OAI21X1 port map( A => n38, B => n39, C => n40, Y => n37);
   U34 : NAND3X1 port map( A => n15, B => n41, C => n42, Y => n40);
   U35 : NOR2X1 port map( A => n43, B => n44, Y => n42);
   U36 : INVX1 port map( A => data_out_2_port, Y => n44);
   U37 : OAI21X1 port map( A => n45, B => n34, C => n29, Y => n39);
   U38 : INVX1 port map( A => n23, Y => n34);
   U39 : NAND3X1 port map( A => n46, B => n47, C => n48, Y => n23);
   U40 : INVX1 port map( A => n49, Y => n45);
   U41 : OR2X1 port map( A => n36, B => n50, Y => n67);
   U42 : OAI21X1 port map( A => n51, B => n52, C => n53, Y => n50);
   U43 : INVX1 port map( A => n18, Y => n53);
   U44 : NOR2X1 port map( A => n54, B => CS_0_port, Y => n18);
   U45 : NAND3X1 port map( A => n55, B => n38, C => n56, Y => n52);
   U46 : NOR2X1 port map( A => n16, B => n49, Y => n56);
   U47 : NAND3X1 port map( A => n46, B => n47, C => CS_0_port, Y => n49);
   U48 : INVX1 port map( A => CS_1_port, Y => n46);
   U49 : INVX1 port map( A => data_out_7_port, Y => n16);
   U50 : NOR2X1 port map( A => data_out_1_port, B => data_out_0_port, Y => n55)
                           ;
   U51 : NAND3X1 port map( A => n57, B => n14, C => n58, Y => n51);
   U52 : NOR2X1 port map( A => data_out_3_port, B => data_out_2_port, Y => n58)
                           ;
   U53 : INVX1 port map( A => data_out_4_port, Y => n14);
   U54 : NOR2X1 port map( A => data_out_6_port, B => data_out_5_port, Y => n57)
                           ;
   U55 : OAI21X1 port map( A => n59, B => n60, C => n61, Y => n36);
   U56 : NAND3X1 port map( A => n29, B => n31, C => n62, Y => n61);
   U57 : INVX1 port map( A => n30, Y => n62);
   U58 : NOR2X1 port map( A => nxt_data_1_port, B => n35, Y => n30);
   U59 : NOR2X1 port map( A => n17, B => CS_0_port, Y => n35);
   U60 : NOR2X1 port map( A => n17, B => n48, Y => nxt_data_1_port);
   U61 : NAND3X1 port map( A => CS_1_port, B => n47, C => CS_2_port, Y => n17);
   U62 : INVX1 port map( A => halt, Y => n31);
   U63 : INVX1 port map( A => eopOut_port, Y => n29);
   U64 : OR2X1 port map( A => n43, B => data_out_2_port, Y => n60);
   U65 : NAND3X1 port map( A => data_out_7_port, B => n63, C => n64, Y => n43);
   U66 : NOR2X1 port map( A => data_out_3_port, B => n65, Y => n64);
   U67 : XNOR2X1 port map( A => data_out_0_port, B => data_out_4_port, Y => n65
                           );
   U68 : XOR2X1 port map( A => data_out_5_port, B => data_out_1_port, Y => n63)
                           ;
   U69 : INVX1 port map( A => nxt_inst_1_port, Y => n59);
   U70 : NOR2X1 port map( A => n41, B => n13, Y => nxt_inst_1_port);
   U71 : INVX1 port map( A => n15, Y => n13);
   U72 : NOR2X1 port map( A => n48, B => n54, Y => n15);
   U73 : NAND3X1 port map( A => n38, B => n47, C => CS_1_port, Y => n54);
   U74 : INVX1 port map( A => CS_3_port, Y => n47);
   U75 : INVX1 port map( A => CS_2_port, Y => n38);
   U76 : INVX1 port map( A => CS_0_port, Y => n48);
   U77 : INVX1 port map( A => data_out_6_port, Y => n41);

end SYN_BLK;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity controller is

   port( clk, rst, fifo_full : in std_logic;  decoder_instruction : in 
         std_logic_vector (3 downto 0);  data_ready : in std_logic_vector (1 
         downto 0);  eop_found, data_read : in std_logic;  fifo_read, 
         fifo_write, intercept : out std_logic);

end controller;

architecture SYN_controller_arch of controller is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component MUX2X1
      port( B, A, S : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component AND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI22X1
      port( A, B, C, D : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI22X1
      port( A, B, C, D : in std_logic;  Y : out std_logic);
   end component;
   
   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFPOSX1
      port( D, CLK : in std_logic;  Q : out std_logic);
   end component;
   
   signal usb_3_port, usb_2_port, usb_1_port, usb_0_port, sd, eopCount_2_port, 
      eopCount_1_port, eopCount_0_port, writeCount_2_port, writeCount_1_port, 
      writeCount_0_port, eop1, eop2, dr1, dr2, dr, nextUsb_3_port, 
      nextUsb_2_port, nextUsb_1_port, nextUsb_0_port, nextSd, eopf, N26, n80, 
      n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95
      , n96, n97, n100, n101, n102, n103, n104, n1, n2, n3, n4, n5, n6, n7, n8,
      n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
      n24, n25, n26_port, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37
      , n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, 
      n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66
      , n67, n68, n69, n70, n71, n72, n73, fifo_write_port : std_logic;

begin
   fifo_read <= sd;
   fifo_write <= fifo_write_port;
   
   eop1_reg : DFFSR port map( D => eop_found, CLK => clk, R => rst, S => n96, Q
                           => eop1);
   eop2_reg : DFFSR port map( D => eop1, CLK => clk, R => rst, S => n95, Q => 
                           eop2);
   eopf_reg : DFFPOSX1 port map( D => n94, CLK => clk, Q => eopf);
   eopCount_reg_0_inst : DFFSR port map( D => n102, CLK => clk, R => rst, S => 
                           n93, Q => eopCount_0_port);
   eopCount_reg_1_inst : DFFSR port map( D => n103, CLK => clk, R => rst, S => 
                           n92, Q => eopCount_1_port);
   eopCount_reg_2_inst : DFFSR port map( D => n104, CLK => clk, R => rst, S => 
                           n91, Q => eopCount_2_port);
   usb_reg_2_inst : DFFSR port map( D => nextUsb_2_port, CLK => clk, R => rst, 
                           S => n90, Q => usb_2_port);
   writeCount_reg_2_inst : DFFSR port map( D => n100, CLK => clk, R => rst, S 
                           => n89, Q => writeCount_2_port);
   usb_reg_3_inst : DFFSR port map( D => nextUsb_3_port, CLK => clk, R => rst, 
                           S => n88, Q => usb_3_port);
   usb_reg_1_inst : DFFSR port map( D => nextUsb_1_port, CLK => clk, R => rst, 
                           S => n87, Q => usb_1_port);
   usb_reg_0_inst : DFFSR port map( D => nextUsb_0_port, CLK => clk, R => rst, 
                           S => n86, Q => usb_0_port);
   writeCount_reg_0_inst : DFFSR port map( D => n101, CLK => clk, R => rst, S 
                           => n85, Q => writeCount_0_port);
   writeCount_reg_1_inst : DFFSR port map( D => n97, CLK => clk, R => rst, S =>
                           n84, Q => writeCount_1_port);
   dr1_reg : DFFSR port map( D => data_read, CLK => clk, R => rst, S => n83, Q 
                           => dr1);
   dr2_reg : DFFSR port map( D => dr1, CLK => clk, R => rst, S => n82, Q => dr2
                           );
   dr_reg : DFFSR port map( D => N26, CLK => clk, R => rst, S => n81, Q => dr);
   sd_reg : DFFSR port map( D => nextSd, CLK => clk, R => rst, S => n80, Q => 
                           sd);
   n80 <= '1';
   n81 <= '1';
   n82 <= '1';
   n83 <= '1';
   n84 <= '1';
   n85 <= '1';
   n86 <= '1';
   n87 <= '1';
   n88 <= '1';
   n89 <= '1';
   n90 <= '1';
   n91 <= '1';
   n92 <= '1';
   n93 <= '1';
   n95 <= '1';
   n96 <= '1';
   U3 : AND2X1 port map( A => n1, B => fifo_write_port, Y => nextUsb_3_port);
   U4 : NAND3X1 port map( A => n2, B => n3, C => n4, Y => nextUsb_2_port);
   U5 : NOR2X1 port map( A => n5, B => n6, Y => n4);
   U6 : AND2X1 port map( A => n7, B => n8, Y => n2);
   U7 : NAND3X1 port map( A => n9, B => n8, C => n10, Y => nextUsb_1_port);
   U8 : INVX1 port map( A => n11, Y => n10);
   U9 : OAI22X1 port map( A => n12, B => n13, C => n14, D => n15, Y => n11);
   U10 : NAND3X1 port map( A => n16, B => n17, C => data_ready(0), Y => n9);
   U11 : INVX1 port map( A => data_ready(1), Y => n17);
   U12 : INVX1 port map( A => n3, Y => n16);
   U13 : OR2X1 port map( A => n18, B => n19, Y => nextUsb_0_port);
   U14 : OAI21X1 port map( A => data_ready(0), B => n3, C => n20, Y => n19);
   U15 : INVX1 port map( A => n6, Y => n20);
   U16 : OAI21X1 port map( A => n21, B => n1, C => n22, Y => n6);
   U17 : NAND3X1 port map( A => decoder_instruction(1), B => 
                           decoder_instruction(0), C => n23, Y => n22);
   U18 : NOR2X1 port map( A => n12, B => n24, Y => n23);
   U19 : OAI21X1 port map( A => n25, B => n26_port, C => n13, Y => n24);
   U20 : INVX1 port map( A => decoder_instruction(2), Y => n25);
   U21 : OAI21X1 port map( A => n27, B => n28, C => n29, Y => n1);
   U22 : NOR2X1 port map( A => fifo_full, B => eop_found, Y => n29);
   U23 : NAND2X1 port map( A => writeCount_1_port, B => writeCount_0_port, Y =>
                           n28);
   U24 : INVX1 port map( A => writeCount_2_port, Y => n27);
   U25 : OAI21X1 port map( A => n30, B => n14, C => n31, Y => n18);
   U26 : AOI22X1 port map( A => n32, B => n33, C => data_ready(1), D => n34, Y 
                           => n31);
   U27 : OAI21X1 port map( A => n35, B => n8, C => n3, Y => n34);
   U28 : INVX1 port map( A => data_ready(0), Y => n35);
   U29 : NOR2X1 port map( A => n26_port, B => n12, Y => n33);
   U30 : NAND3X1 port map( A => n36, B => n37, C => n38, Y => n12);
   U31 : INVX1 port map( A => decoder_instruction(3), Y => n26_port);
   U32 : NOR2X1 port map( A => n39, B => n40, Y => n32);
   U33 : MUX2X1 port map( B => decoder_instruction(1), A => n41, S => 
                           decoder_instruction(2), Y => n40);
   U34 : NOR2X1 port map( A => usb_1_port, B => decoder_instruction(1), Y => 
                           n41);
   U35 : INVX1 port map( A => decoder_instruction(0), Y => n39);
   U36 : NAND3X1 port map( A => n36, B => n37, C => n42, Y => n14);
   U37 : NOR2X1 port map( A => usb_1_port, B => n38, Y => n42);
   U38 : INVX1 port map( A => n15, Y => n30);
   U39 : NAND3X1 port map( A => decoder_instruction(0), B => 
                           decoder_instruction(3), C => n43, Y => n15);
   U40 : NOR2X1 port map( A => decoder_instruction(2), B => 
                           decoder_instruction(1), Y => n43);
   U41 : NOR2X1 port map( A => sd, B => n44, Y => nextSd);
   U42 : INVX1 port map( A => dr, Y => n44);
   U43 : INVX1 port map( A => n7, Y => intercept);
   U44 : NAND3X1 port map( A => usb_1_port, B => usb_0_port, C => n45, Y => n7)
                           ;
   U45 : NOR2X1 port map( A => usb_3_port, B => usb_2_port, Y => n45);
   U46 : MUX2X1 port map( B => n46, A => n47, S => writeCount_1_port, Y => n97)
                           ;
   U47 : NAND2X1 port map( A => fifo_write_port, B => writeCount_0_port, Y => 
                           n46);
   U48 : MUX2X1 port map( B => n48, A => n49, S => rst, Y => n94);
   U49 : NAND2X1 port map( A => eop1, B => n50, Y => n49);
   U50 : INVX1 port map( A => eop2, Y => n50);
   U51 : OAI22X1 port map( A => n51, B => n52, C => n53, D => n54, Y => n104);
   U52 : INVX1 port map( A => eopCount_2_port, Y => n54);
   U53 : MUX2X1 port map( B => n52, A => n53, S => eopCount_1_port, Y => n103);
   U54 : INVX1 port map( A => n55, Y => n53);
   U55 : OAI21X1 port map( A => eopCount_0_port, B => n56, C => n57, Y => n55);
   U56 : NAND3X1 port map( A => n5, B => eopCount_0_port, C => n58, Y => n52);
   U57 : MUX2X1 port map( B => n59, A => n57, S => eopCount_0_port, Y => n102);
   U58 : INVX1 port map( A => n60, Y => n57);
   U59 : OAI21X1 port map( A => n58, B => n56, C => n61, Y => n60);
   U60 : NAND2X1 port map( A => n58, B => n5, Y => n59);
   U61 : INVX1 port map( A => n56, Y => n5);
   U62 : NAND3X1 port map( A => n38, B => n13, C => n62, Y => n56);
   U63 : AOI21X1 port map( A => n63, B => eopCount_2_port, C => n64, Y => n62);
   U64 : AND2X1 port map( A => n51, B => eopCount_0_port, Y => n63);
   U65 : INVX1 port map( A => eopCount_1_port, Y => n51);
   U66 : AOI21X1 port map( A => eopCount_2_port, B => eopCount_1_port, C => n48
                           , Y => n58);
   U67 : INVX1 port map( A => eopf, Y => n48);
   U68 : MUX2X1 port map( B => n21, A => n65, S => writeCount_0_port, Y => n101
                           );
   U69 : MUX2X1 port map( B => n66, A => n67, S => writeCount_2_port, Y => n100
                           );
   U70 : INVX1 port map( A => n68, Y => n67);
   U71 : OAI21X1 port map( A => n21, B => writeCount_1_port, C => n47, Y => n68
                           );
   U72 : INVX1 port map( A => n69, Y => n47);
   U73 : OAI21X1 port map( A => writeCount_0_port, B => n21, C => n65, Y => n69
                           );
   U74 : INVX1 port map( A => n70, Y => n65);
   U75 : NAND3X1 port map( A => n3, B => n8, C => n61, Y => n70);
   U76 : OAI21X1 port map( A => usb_0_port, B => n71, C => usb_3_port, Y => n61
                           );
   U77 : NAND2X1 port map( A => n13, B => n36, Y => n71);
   U78 : INVX1 port map( A => usb_2_port, Y => n36);
   U79 : NAND3X1 port map( A => n72, B => n38, C => usb_1_port, Y => n8);
   U80 : INVX1 port map( A => usb_0_port, Y => n38);
   U81 : NAND3X1 port map( A => n72, B => n13, C => usb_0_port, Y => n3);
   U82 : INVX1 port map( A => usb_1_port, Y => n13);
   U83 : NAND3X1 port map( A => writeCount_1_port, B => writeCount_0_port, C =>
                           fifo_write_port, Y => n66);
   U84 : INVX1 port map( A => n21, Y => fifo_write_port);
   U85 : NAND3X1 port map( A => usb_0_port, B => n72, C => usb_1_port, Y => n21
                           );
   U86 : INVX1 port map( A => n64, Y => n72);
   U87 : NAND2X1 port map( A => usb_2_port, B => n37, Y => n64);
   U88 : INVX1 port map( A => usb_3_port, Y => n37);
   U89 : NOR2X1 port map( A => dr2, B => n73, Y => N26);
   U90 : INVX1 port map( A => dr1, Y => n73);

end SYN_controller_arch;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity SpiXmitSR_srWidth8 is

   port( clk, resetN, tsrEnable, tsrLoad : in std_logic;  tsrData : in 
         std_logic_vector (7 downto 0);  dataOut : out std_logic);

end SpiXmitSR_srWidth8;

architecture SYN_SpiXmitSR_arch of SpiXmitSR_srWidth8 is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI22X1
      port( A, B, C, D : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component MUX2X1
      port( B, A, S : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal dataOut_port, tsrDataReg_6_port, tsrDataReg_5_port, tsrDataReg_4_port
      , tsrDataReg_3_port, tsrDataReg_2_port, tsrDataReg_1_port, 
      tsrDataReg_0_port, tsrDummyReg_0_port, load2, load1, load, N2, n23, n24, 
      n25, n26, n27, n28, n29, n30, n31, n33, n34, n35, n36, n37, n38, n39, n40
      , n41, n42, n43, n1, n2_port, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, 
      n13, n14, n15, n16, n17, n18, n19, n20, n21, n22 : std_logic;

begin
   dataOut <= dataOut_port;
   
   load1_reg : DFFSR port map( D => tsrLoad, CLK => clk, R => resetN, S => n35,
                           Q => load1);
   load2_reg : DFFSR port map( D => load1, CLK => clk, R => resetN, S => n34, Q
                           => load2);
   load_reg : DFFSR port map( D => N2, CLK => clk, R => resetN, S => n33, Q => 
                           load);
   tsrDummyReg_reg_0_inst : DFFSR port map( D => n22, CLK => clk, R => n31, S 
                           => resetN, Q => tsrDummyReg_0_port);
   tsrDataReg_reg_0_inst : DFFSR port map( D => n43, CLK => clk, R => n30, S =>
                           resetN, Q => tsrDataReg_0_port);
   tsrDataReg_reg_1_inst : DFFSR port map( D => n42, CLK => clk, R => n29, S =>
                           resetN, Q => tsrDataReg_1_port);
   tsrDataReg_reg_2_inst : DFFSR port map( D => n41, CLK => clk, R => n28, S =>
                           resetN, Q => tsrDataReg_2_port);
   tsrDataReg_reg_3_inst : DFFSR port map( D => n40, CLK => clk, R => n27, S =>
                           resetN, Q => tsrDataReg_3_port);
   tsrDataReg_reg_4_inst : DFFSR port map( D => n39, CLK => clk, R => n26, S =>
                           resetN, Q => tsrDataReg_4_port);
   tsrDataReg_reg_5_inst : DFFSR port map( D => n38, CLK => clk, R => n25, S =>
                           resetN, Q => tsrDataReg_5_port);
   tsrDataReg_reg_6_inst : DFFSR port map( D => n37, CLK => clk, R => n24, S =>
                           resetN, Q => tsrDataReg_6_port);
   tsrDataReg_reg_7_inst : DFFSR port map( D => n36, CLK => clk, R => n23, S =>
                           resetN, Q => dataOut_port);
   n23 <= '1';
   n24 <= '1';
   n25 <= '1';
   n26 <= '1';
   n27 <= '1';
   n28 <= '1';
   n29 <= '1';
   n30 <= '1';
   n31 <= '1';
   n33 <= '1';
   n34 <= '1';
   n35 <= '1';
   U3 : INVX1 port map( A => n1, Y => n22);
   U4 : MUX2X1 port map( B => tsrDummyReg_0_port, A => tsrData(0), S => load, Y
                           => n1);
   U5 : OAI21X1 port map( A => n2_port, B => n3, C => n4, Y => n43);
   U6 : AOI22X1 port map( A => n5, B => tsrData(0), C => tsrDataReg_0_port, D 
                           => n6, Y => n4);
   U7 : INVX1 port map( A => tsrDummyReg_0_port, Y => n2_port);
   U8 : OAI21X1 port map( A => n7, B => n3, C => n8, Y => n42);
   U9 : AOI22X1 port map( A => tsrData(1), B => n5, C => tsrDataReg_1_port, D 
                           => n6, Y => n8);
   U10 : INVX1 port map( A => tsrDataReg_0_port, Y => n7);
   U11 : OAI21X1 port map( A => n3, B => n9, C => n10, Y => n41);
   U12 : AOI22X1 port map( A => tsrData(2), B => n5, C => tsrDataReg_2_port, D 
                           => n6, Y => n10);
   U13 : INVX1 port map( A => tsrDataReg_1_port, Y => n9);
   U14 : OAI21X1 port map( A => n3, B => n11, C => n12, Y => n40);
   U15 : AOI22X1 port map( A => tsrData(3), B => n5, C => tsrDataReg_3_port, D 
                           => n6, Y => n12);
   U16 : INVX1 port map( A => tsrDataReg_2_port, Y => n11);
   U17 : OAI21X1 port map( A => n3, B => n13, C => n14, Y => n39);
   U18 : AOI22X1 port map( A => tsrData(4), B => n5, C => tsrDataReg_4_port, D 
                           => n6, Y => n14);
   U19 : INVX1 port map( A => tsrDataReg_3_port, Y => n13);
   U20 : OAI21X1 port map( A => n3, B => n15, C => n16, Y => n38);
   U21 : AOI22X1 port map( A => tsrData(5), B => n5, C => tsrDataReg_5_port, D 
                           => n6, Y => n16);
   U22 : INVX1 port map( A => tsrDataReg_4_port, Y => n15);
   U23 : OAI21X1 port map( A => n3, B => n17, C => n18, Y => n37);
   U24 : AOI22X1 port map( A => tsrData(6), B => n5, C => tsrDataReg_6_port, D 
                           => n6, Y => n18);
   U25 : INVX1 port map( A => tsrDataReg_5_port, Y => n17);
   U26 : OAI21X1 port map( A => n3, B => n19, C => n20, Y => n36);
   U27 : AOI22X1 port map( A => tsrData(7), B => n5, C => dataOut_port, D => n6
                           , Y => n20);
   U28 : NOR2X1 port map( A => n6, B => tsrEnable, Y => n5);
   U29 : NOR2X1 port map( A => load, B => tsrEnable, Y => n6);
   U30 : INVX1 port map( A => tsrDataReg_6_port, Y => n19);
   U31 : INVX1 port map( A => tsrEnable, Y => n3);
   U32 : NOR2X1 port map( A => load2, B => n21, Y => N2);
   U33 : INVX1 port map( A => load1, Y => n21);

end SYN_SpiXmitSR_arch;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity SpiClkDivide_165_3_0_0 is

   port( clk, resetN, sclEnable, sclSpeed : in std_logic;  tsrEnable, scl : out
         std_logic);

end SpiClkDivide_165_3_0_0;

architecture SYN_SpiClkDivide_arch of SpiClkDivide_165_3_0_0 is

   component INVX1
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component OR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component MUX2X1
      port( B, A, S : in std_logic;  Y : out std_logic);
   end component;
   
   component SpiClkDivide_165_3_0_0_DW01_inc_0
      port( A : in std_logic_vector (8 downto 0);  SUM : out std_logic_vector 
            (8 downto 0));
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal count_8_port, count_7_port, count_6_port, count_5_port, count_4_port,
      count_3_port, count_2_port, count_1_port, count_0_port, nextcount_8_port,
      nextcount_7_port, nextcount_6_port, nextcount_5_port, nextcount_4_port, 
      nextcount_3_port, nextcount_2_port, nextcount_1_port, nextcount_0_port, 
      N32, N33, N34, N35, N36, N37, N38, N39, N40, n24, n25, n26, n27, n28, n29
      , n30, n31, n32_port, n33_port, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, 
      n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n34_port
      , n35_port, n36_port, n37_port, n38_port, n39_port : std_logic;

begin
   
   count_reg_0_inst : DFFSR port map( D => nextcount_0_port, CLK => clk, R => 
                           resetN, S => n33_port, Q => count_0_port);
   count_reg_8_inst : DFFSR port map( D => nextcount_8_port, CLK => clk, R => 
                           resetN, S => n32_port, Q => count_8_port);
   count_reg_7_inst : DFFSR port map( D => nextcount_7_port, CLK => clk, R => 
                           resetN, S => n31, Q => count_7_port);
   count_reg_6_inst : DFFSR port map( D => nextcount_6_port, CLK => clk, R => 
                           resetN, S => n30, Q => count_6_port);
   count_reg_5_inst : DFFSR port map( D => nextcount_5_port, CLK => clk, R => 
                           resetN, S => n29, Q => count_5_port);
   count_reg_4_inst : DFFSR port map( D => nextcount_4_port, CLK => clk, R => 
                           resetN, S => n28, Q => count_4_port);
   count_reg_3_inst : DFFSR port map( D => nextcount_3_port, CLK => clk, R => 
                           resetN, S => n27, Q => count_3_port);
   count_reg_2_inst : DFFSR port map( D => nextcount_2_port, CLK => clk, R => 
                           resetN, S => n26, Q => count_2_port);
   count_reg_1_inst : DFFSR port map( D => nextcount_1_port, CLK => clk, R => 
                           resetN, S => n25, Q => count_1_port);
   sclReg_reg : DFFSR port map( D => n39_port, CLK => clk, R => resetN, S => 
                           n24, Q => scl);
   n24 <= '1';
   n25 <= '1';
   n26 <= '1';
   n27 <= '1';
   n28 <= '1';
   n29 <= '1';
   n30 <= '1';
   n31 <= '1';
   n32_port <= '1';
   n33_port <= '1';
   add_96 : SpiClkDivide_165_3_0_0_DW01_inc_0 port map( A(8) => count_8_port, 
                           A(7) => count_7_port, A(6) => count_6_port, A(5) => 
                           count_5_port, A(4) => count_4_port, A(3) => 
                           count_3_port, A(2) => count_2_port, A(1) => 
                           count_1_port, A(0) => count_0_port, SUM(8) => N40, 
                           SUM(7) => N39, SUM(6) => N38, SUM(5) => N37, SUM(4) 
                           => N36, SUM(3) => N35, SUM(2) => N34, SUM(1) => N33,
                           SUM(0) => N32);
   U8 : MUX2X1 port map( B => n1, A => n2, S => count_0_port, Y => tsrEnable);
   U9 : NAND2X1 port map( A => sclSpeed, B => n3, Y => n2);
   U10 : OR2X1 port map( A => n4, B => n5, Y => n1);
   U11 : NAND3X1 port map( A => count_7_port, B => count_5_port, C => n6, Y => 
                           n5);
   U12 : AND2X1 port map( A => count_1_port, B => count_4_port, Y => n6);
   U13 : NAND3X1 port map( A => n7, B => n8, C => n9, Y => n4);
   U14 : NOR2X1 port map( A => count_8_port, B => count_6_port, Y => n9);
   U20 : AND2X1 port map( A => N40, B => n10, Y => nextcount_8_port);
   U21 : AND2X1 port map( A => N39, B => n10, Y => nextcount_7_port);
   U22 : AND2X1 port map( A => N38, B => n10, Y => nextcount_6_port);
   U23 : AND2X1 port map( A => N37, B => n10, Y => nextcount_5_port);
   U24 : AND2X1 port map( A => N36, B => n10, Y => nextcount_4_port);
   U25 : AND2X1 port map( A => N35, B => n10, Y => nextcount_3_port);
   U26 : AND2X1 port map( A => N34, B => n10, Y => nextcount_2_port);
   U27 : AND2X1 port map( A => N33, B => n10, Y => nextcount_1_port);
   U28 : AND2X1 port map( A => N32, B => n10, Y => nextcount_0_port);
   U29 : OAI21X1 port map( A => n11, B => n12, C => n13, Y => n10);
   U30 : INVX1 port map( A => n7, Y => n12);
   U31 : AND2X1 port map( A => count_8_port, B => n14, Y => n11);
   U32 : OAI21X1 port map( A => n15, B => n16, C => n17, Y => n14);
   U33 : INVX1 port map( A => count_7_port, Y => n17);
   U34 : OAI21X1 port map( A => count_4_port, B => n18, C => count_5_port, Y =>
                           n16);
   U35 : OAI21X1 port map( A => count_0_port, B => n13, C => n19, Y => n39_port
                           );
   U36 : NAND2X1 port map( A => n20, B => n7, Y => n19);
   U37 : NOR2X1 port map( A => n21, B => sclSpeed, Y => n7);
   U38 : INVX1 port map( A => sclEnable, Y => n21);
   U39 : AOI21X1 port map( A => count_7_port, B => n22, C => count_8_port, Y =>
                           n20);
   U40 : OAI21X1 port map( A => n23, B => n34_port, C => n15, Y => n22);
   U41 : OAI21X1 port map( A => count_1_port, B => n18, C => count_4_port, Y =>
                           n34_port);
   U42 : INVX1 port map( A => n8, Y => n18);
   U43 : INVX1 port map( A => n3, Y => n13);
   U44 : NOR2X1 port map( A => n35_port, B => n36_port, Y => n3);
   U45 : NAND3X1 port map( A => sclEnable, B => n8, C => n37_port, Y => 
                           n36_port);
   U46 : NOR2X1 port map( A => count_4_port, B => count_1_port, Y => n37_port);
   U47 : NOR2X1 port map( A => count_3_port, B => count_2_port, Y => n8);
   U48 : NAND3X1 port map( A => n23, B => n15, C => n38_port, Y => n35_port);
   U49 : NOR2X1 port map( A => count_8_port, B => count_7_port, Y => n38_port);
   U50 : INVX1 port map( A => count_6_port, Y => n15);
   U51 : INVX1 port map( A => count_5_port, Y => n23);

end SYN_SpiClkDivide_arch;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity FifoTop_gregLength4_gregWidth8_addrSize2 is

   port( clk, rEnable, resetN : in std_logic;  wData : in std_logic_vector (7 
         downto 0);  wEnable : in std_logic;  fifoEmpty, fifoFull : out 
         std_logic;  rData : out std_logic_vector (7 downto 0));

end FifoTop_gregLength4_gregWidth8_addrSize2;

architecture SYN_struct of FifoTop_gregLength4_gregWidth8_addrSize2 is

   component FifoWrite_gregLength4_addrSize2
      port( clk, resetN, wEnable, fifoFull : in std_logic;  wSel : out 
            std_logic_vector (1 downto 0));
   end component;
   
   component FifoRead_gregLength4_addrSize2
      port( clk, resetN, rEnable, fifoEmpty : in std_logic;  rSel : out 
            std_logic_vector (1 downto 0));
   end component;
   
   component FifoRam_gregLength4_gregWidth8_addrSize2
      port( clk, resetN, wEnable : in std_logic;  wData : in std_logic_vector 
            (7 downto 0);  wSel, rSel : in std_logic_vector (1 downto 0);  
            rData : out std_logic_vector (7 downto 0);  fifoEmpty, fifoFull : 
            out std_logic);
   end component;
   
   signal fifoEmpty_port, fifoFull_port, rSel_1_port, rSel_0_port, wSel_1_port,
      wSel_0_port : std_logic;

begin
   fifoEmpty <= fifoEmpty_port;
   fifoFull <= fifoFull_port;
   
   U_0 : FifoRam_gregLength4_gregWidth8_addrSize2 port map( clk => clk, resetN 
                           => resetN, wEnable => wEnable, wData(7) => wData(7),
                           wData(6) => wData(6), wData(5) => wData(5), wData(4)
                           => wData(4), wData(3) => wData(3), wData(2) => 
                           wData(2), wData(1) => wData(1), wData(0) => wData(0)
                           , wSel(1) => wSel_1_port, wSel(0) => wSel_0_port, 
                           rSel(1) => rSel_1_port, rSel(0) => rSel_0_port, 
                           rData(7) => rData(7), rData(6) => rData(6), rData(5)
                           => rData(5), rData(4) => rData(4), rData(3) => 
                           rData(3), rData(2) => rData(2), rData(1) => rData(1)
                           , rData(0) => rData(0), fifoEmpty => fifoEmpty_port,
                           fifoFull => fifoFull_port);
   U_1 : FifoRead_gregLength4_addrSize2 port map( clk => clk, resetN => resetN,
                           rEnable => rEnable, fifoEmpty => fifoEmpty_port, 
                           rSel(1) => rSel_1_port, rSel(0) => rSel_0_port);
   U_2 : FifoWrite_gregLength4_addrSize2 port map( clk => clk, resetN => resetN
                           , wEnable => wEnable, fifoFull => fifoFull_port, 
                           wSel(1) => wSel_1_port, wSel(0) => wSel_0_port);

end SYN_struct;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_sniffer_top.all;

entity sniffer_top is

   port( clk, rst : in std_logic;  dataOut, scl, sd_enable : out std_logic;  
         dataMinusComputer, dataPlusComputer, dataMinusUsb, dataPlusUsb : inout
         std_logic);

end sniffer_top;

architecture SYN_struct of sniffer_top is

   component sd_control
      port( clk, rst, sd_clock, fifo_empty : in std_logic;  data_in : in 
            std_logic_vector (7 downto 0);  data_out : out std_logic_vector (7 
            downto 0);  clk_mode, tsr_load, sd_enable, clk_enable, data_read : 
            out std_logic);
   end component;
   
   component interceptor
      port( clk, eop, intercept : in std_logic;  inst : in std_logic_vector (3 
            downto 0);  rst, usbclk : in std_logic;  dataPlus, dataMinus : out 
            std_logic;  computerMinus, computerPlus, usbMinus, usbPlus : inout 
            std_logic);
   end component;
   
   component decoder
      port( clk, rst, data0, data1, halt : in std_logic;  data : out 
            std_logic_vector (1 downto 0);  inst : out std_logic_vector (3 
            downto 0);  data_out : out std_logic_vector (7 downto 0);  dclk, 
            eopOut : out std_logic);
   end component;
   
   component controller
      port( clk, rst, fifo_full : in std_logic;  decoder_instruction : in 
            std_logic_vector (3 downto 0);  data_ready : in std_logic_vector (1
            downto 0);  eop_found, data_read : in std_logic;  fifo_read, 
            fifo_write, intercept : out std_logic);
   end component;
   
   component SpiXmitSR_srWidth8
      port( clk, resetN, tsrEnable, tsrLoad : in std_logic;  tsrData : in 
            std_logic_vector (7 downto 0);  dataOut : out std_logic);
   end component;
   
   component SpiClkDivide_165_3_0_0
      port( clk, resetN, sclEnable, sclSpeed : in std_logic;  tsrEnable, scl : 
            out std_logic);
   end component;
   
   component FifoTop_gregLength4_gregWidth8_addrSize2
      port( clk, rEnable, resetN : in std_logic;  wData : in std_logic_vector 
            (7 downto 0);  wEnable : in std_logic;  fifoEmpty, fifoFull : out 
            std_logic;  rData : out std_logic_vector (7 downto 0));
   end component;
   
   signal scl_port, fifo_read, data_out_7_port, data_out_6_port, 
      data_out_5_port, data_out_4_port, data_out_3_port, data_out_2_port, 
      data_out_1_port, data_out_0_port, fifo_write, fifoEmpty, fifoFull, 
      rData_7_port, rData_6_port, rData_5_port, rData_4_port, rData_3_port, 
      rData_2_port, rData_1_port, rData_0_port, sclEnable, clk_mode, tsrEnable,
      dout_7_port, dout_6_port, dout_5_port, dout_4_port, dout_3_port, 
      dout_2_port, dout_1_port, dout_0_port, tsrLoad, data_read, 
      data_ready_1_port, data_ready_0_port, inst_3_port, inst_2_port, 
      inst_1_port, inst_0_port, eop, intercept, dataPlus, dataMinus, dclk : 
      std_logic;

begin
   scl <= scl_port;
   
   U_2 : FifoTop_gregLength4_gregWidth8_addrSize2 port map( clk => clk, rEnable
                           => fifo_read, resetN => rst, wData(7) => 
                           data_out_7_port, wData(6) => data_out_6_port, 
                           wData(5) => data_out_5_port, wData(4) => 
                           data_out_4_port, wData(3) => data_out_3_port, 
                           wData(2) => data_out_2_port, wData(1) => 
                           data_out_1_port, wData(0) => data_out_0_port, 
                           wEnable => fifo_write, fifoEmpty => fifoEmpty, 
                           fifoFull => fifoFull, rData(7) => rData_7_port, 
                           rData(6) => rData_6_port, rData(5) => rData_5_port, 
                           rData(4) => rData_4_port, rData(3) => rData_3_port, 
                           rData(2) => rData_2_port, rData(1) => rData_1_port, 
                           rData(0) => rData_0_port);
   U_5 : SpiClkDivide_165_3_0_0 port map( clk => clk, resetN => rst, sclEnable 
                           => sclEnable, sclSpeed => clk_mode, tsrEnable => 
                           tsrEnable, scl => scl_port);
   U_4 : SpiXmitSR_srWidth8 port map( clk => clk, resetN => rst, tsrEnable => 
                           tsrEnable, tsrLoad => tsrLoad, tsrData(7) => 
                           dout_7_port, tsrData(6) => dout_6_port, tsrData(5) 
                           => dout_5_port, tsrData(4) => dout_4_port, 
                           tsrData(3) => dout_3_port, tsrData(2) => dout_2_port
                           , tsrData(1) => dout_1_port, tsrData(0) => 
                           dout_0_port, dataOut => dataOut);
   U_0 : controller port map( clk => clk, rst => rst, fifo_full => fifoFull, 
                           decoder_instruction(3) => inst_3_port, 
                           decoder_instruction(2) => inst_2_port, 
                           decoder_instruction(1) => inst_1_port, 
                           decoder_instruction(0) => inst_0_port, data_ready(1)
                           => data_ready_1_port, data_ready(0) => 
                           data_ready_0_port, eop_found => eop, data_read => 
                           data_read, fifo_read => fifo_read, fifo_write => 
                           fifo_write, intercept => intercept);
   U_1 : decoder port map( clk => clk, rst => rst, data0 => dataPlus, data1 => 
                           dataMinus, halt => intercept, data(1) => 
                           data_ready_1_port, data(0) => data_ready_0_port, 
                           inst(3) => inst_3_port, inst(2) => inst_2_port, 
                           inst(1) => inst_1_port, inst(0) => inst_0_port, 
                           data_out(7) => data_out_7_port, data_out(6) => 
                           data_out_6_port, data_out(5) => data_out_5_port, 
                           data_out(4) => data_out_4_port, data_out(3) => 
                           data_out_3_port, data_out(2) => data_out_2_port, 
                           data_out(1) => data_out_1_port, data_out(0) => 
                           data_out_0_port, dclk => dclk, eopOut => eop);
   U_3 : interceptor port map( clk => clk, eop => eop, intercept => intercept, 
                           inst(3) => inst_3_port, inst(2) => inst_2_port, 
                           inst(1) => inst_1_port, inst(0) => inst_0_port, rst 
                           => rst, usbclk => dclk, dataPlus => dataPlus, 
                           dataMinus => dataMinus, computerMinus => 
                           dataMinusComputer, computerPlus => dataPlusComputer,
                           usbMinus => dataMinusUsb, usbPlus => dataPlusUsb);
   U_6 : sd_control port map( clk => clk, rst => rst, sd_clock => scl_port, 
                           fifo_empty => fifoEmpty, data_in(7) => rData_7_port,
                           data_in(6) => rData_6_port, data_in(5) => 
                           rData_5_port, data_in(4) => rData_4_port, data_in(3)
                           => rData_3_port, data_in(2) => rData_2_port, 
                           data_in(1) => rData_1_port, data_in(0) => 
                           rData_0_port, data_out(7) => dout_7_port, 
                           data_out(6) => dout_6_port, data_out(5) => 
                           dout_5_port, data_out(4) => dout_4_port, data_out(3)
                           => dout_3_port, data_out(2) => dout_2_port, 
                           data_out(1) => dout_1_port, data_out(0) => 
                           dout_0_port, clk_mode => clk_mode, tsr_load => 
                           tsrLoad, sd_enable => sd_enable, clk_enable => 
                           sclEnable, data_read => data_read);

end SYN_struct;
