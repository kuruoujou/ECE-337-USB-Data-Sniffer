
module FifoRam_gregLength4_gregWidth8_addrSize2 ( clk, resetN, wEnable, wData, 
        wSel, rSel, rData, fifoEmpty, fifoFull );
  input [7:0] wData;
  input [1:0] wSel;
  input [1:0] rSel;
  output [7:0] rData;
  input clk, resetN, wEnable;
  output fifoEmpty, fifoFull;
  wire   N4, N7, \gregData[3][7] , \gregData[3][6] , \gregData[3][5] ,
         \gregData[3][4] , \gregData[3][3] , \gregData[3][2] ,
         \gregData[3][1] , \gregData[3][0] , \gregData[2][7] ,
         \gregData[2][6] , \gregData[2][5] , \gregData[2][4] ,
         \gregData[2][3] , \gregData[2][2] , \gregData[2][1] ,
         \gregData[2][0] , \gregData[1][7] , \gregData[1][6] ,
         \gregData[1][5] , \gregData[1][4] , \gregData[1][3] ,
         \gregData[1][2] , \gregData[1][1] , \gregData[1][0] ,
         \gregData[0][7] , \gregData[0][6] , \gregData[0][5] ,
         \gregData[0][4] , \gregData[0][3] , \gregData[0][2] ,
         \gregData[0][1] , \gregData[0][0] , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n78, n80,
         n82, n84, n86, n88, n90, n92, n94, n96, n98, n100, n102, n104, n106,
         n108, n110, n112, n114, n116, n118, n120;

  DFFSR fifoEmptyReg_reg ( .D(N4), .CLK(clk), .R(1'b1), .S(resetN), .Q(
        fifoEmpty) );
  DFFSR fifoFullReg_reg ( .D(N7), .CLK(clk), .R(resetN), .S(1'b1), .Q(fifoFull) );
  DFFSR \gregData_reg[3][7]  ( .D(n70), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[3][7] ) );
  DFFSR \gregData_reg[3][6]  ( .D(n74), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[3][6] ) );
  DFFSR \gregData_reg[3][5]  ( .D(n80), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[3][5] ) );
  DFFSR \gregData_reg[3][4]  ( .D(n88), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[3][4] ) );
  DFFSR \gregData_reg[3][3]  ( .D(n96), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[3][3] ) );
  DFFSR \gregData_reg[3][2]  ( .D(n104), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[3][2] ) );
  DFFSR \gregData_reg[3][1]  ( .D(n112), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[3][1] ) );
  DFFSR \gregData_reg[3][0]  ( .D(n120), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[3][0] ) );
  DFFSR \gregData_reg[2][7]  ( .D(n69), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[2][7] ) );
  DFFSR \gregData_reg[2][6]  ( .D(n73), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[2][6] ) );
  DFFSR \gregData_reg[2][5]  ( .D(n78), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[2][5] ) );
  DFFSR \gregData_reg[2][4]  ( .D(n86), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[2][4] ) );
  DFFSR \gregData_reg[2][3]  ( .D(n94), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[2][3] ) );
  DFFSR \gregData_reg[2][2]  ( .D(n102), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[2][2] ) );
  DFFSR \gregData_reg[2][1]  ( .D(n110), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[2][1] ) );
  DFFSR \gregData_reg[2][0]  ( .D(n118), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[2][0] ) );
  DFFSR \gregData_reg[1][7]  ( .D(n68), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[1][7] ) );
  DFFSR \gregData_reg[1][6]  ( .D(n72), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[1][6] ) );
  DFFSR \gregData_reg[1][5]  ( .D(n76), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[1][5] ) );
  DFFSR \gregData_reg[1][4]  ( .D(n84), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[1][4] ) );
  DFFSR \gregData_reg[1][3]  ( .D(n92), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[1][3] ) );
  DFFSR \gregData_reg[1][2]  ( .D(n100), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[1][2] ) );
  DFFSR \gregData_reg[1][1]  ( .D(n108), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[1][1] ) );
  DFFSR \gregData_reg[1][0]  ( .D(n116), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[1][0] ) );
  DFFSR \gregData_reg[0][7]  ( .D(n67), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[0][7] ) );
  DFFSR \gregData_reg[0][6]  ( .D(n71), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[0][6] ) );
  DFFSR \gregData_reg[0][5]  ( .D(n75), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[0][5] ) );
  DFFSR \gregData_reg[0][4]  ( .D(n82), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[0][4] ) );
  DFFSR \gregData_reg[0][3]  ( .D(n90), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[0][3] ) );
  DFFSR \gregData_reg[0][2]  ( .D(n98), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[0][2] ) );
  DFFSR \gregData_reg[0][1]  ( .D(n106), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[0][1] ) );
  DFFSR \gregData_reg[0][0]  ( .D(n114), .CLK(clk), .R(resetN), .S(1'b1), .Q(
        \gregData[0][0] ) );
  NAND2X1 U3 ( .A(n1), .B(n2), .Y(rData[7]) );
  AOI22X1 U4 ( .A(\gregData[3][7] ), .B(n3), .C(\gregData[2][7] ), .D(n4), .Y(
        n2) );
  AOI22X1 U5 ( .A(\gregData[1][7] ), .B(n5), .C(\gregData[0][7] ), .D(n6), .Y(
        n1) );
  NAND2X1 U6 ( .A(n7), .B(n8), .Y(rData[6]) );
  AOI22X1 U7 ( .A(\gregData[3][6] ), .B(n3), .C(\gregData[2][6] ), .D(n4), .Y(
        n8) );
  AOI22X1 U8 ( .A(\gregData[1][6] ), .B(n5), .C(\gregData[0][6] ), .D(n6), .Y(
        n7) );
  NAND2X1 U9 ( .A(n9), .B(n10), .Y(rData[5]) );
  AOI22X1 U10 ( .A(\gregData[3][5] ), .B(n3), .C(\gregData[2][5] ), .D(n4), 
        .Y(n10) );
  AOI22X1 U11 ( .A(\gregData[1][5] ), .B(n5), .C(\gregData[0][5] ), .D(n6), 
        .Y(n9) );
  NAND2X1 U12 ( .A(n11), .B(n12), .Y(rData[4]) );
  AOI22X1 U13 ( .A(\gregData[3][4] ), .B(n3), .C(\gregData[2][4] ), .D(n4), 
        .Y(n12) );
  AOI22X1 U14 ( .A(\gregData[1][4] ), .B(n5), .C(\gregData[0][4] ), .D(n6), 
        .Y(n11) );
  NAND2X1 U15 ( .A(n13), .B(n14), .Y(rData[3]) );
  AOI22X1 U16 ( .A(\gregData[3][3] ), .B(n3), .C(\gregData[2][3] ), .D(n4), 
        .Y(n14) );
  AOI22X1 U17 ( .A(\gregData[1][3] ), .B(n5), .C(\gregData[0][3] ), .D(n6), 
        .Y(n13) );
  NAND2X1 U18 ( .A(n15), .B(n16), .Y(rData[2]) );
  AOI22X1 U19 ( .A(\gregData[3][2] ), .B(n3), .C(\gregData[2][2] ), .D(n4), 
        .Y(n16) );
  AOI22X1 U20 ( .A(\gregData[1][2] ), .B(n5), .C(\gregData[0][2] ), .D(n6), 
        .Y(n15) );
  NAND2X1 U21 ( .A(n17), .B(n18), .Y(rData[1]) );
  AOI22X1 U22 ( .A(\gregData[3][1] ), .B(n3), .C(\gregData[2][1] ), .D(n4), 
        .Y(n18) );
  AOI22X1 U23 ( .A(\gregData[1][1] ), .B(n5), .C(\gregData[0][1] ), .D(n6), 
        .Y(n17) );
  NAND2X1 U24 ( .A(n19), .B(n20), .Y(rData[0]) );
  AOI22X1 U25 ( .A(\gregData[3][0] ), .B(n3), .C(\gregData[2][0] ), .D(n4), 
        .Y(n20) );
  NOR2X1 U26 ( .A(n21), .B(rSel[0]), .Y(n4) );
  NOR2X1 U27 ( .A(n21), .B(n22), .Y(n3) );
  AOI22X1 U28 ( .A(\gregData[1][0] ), .B(n5), .C(\gregData[0][0] ), .D(n6), 
        .Y(n19) );
  NOR2X1 U29 ( .A(rSel[0]), .B(rSel[1]), .Y(n6) );
  NOR2X1 U30 ( .A(n22), .B(rSel[1]), .Y(n5) );
  INVX1 U31 ( .A(rSel[0]), .Y(n22) );
  INVX1 U32 ( .A(n23), .Y(n67) );
  MUX2X1 U33 ( .B(wData[7]), .A(\gregData[0][7] ), .S(n24), .Y(n23) );
  INVX1 U34 ( .A(n25), .Y(n68) );
  MUX2X1 U35 ( .B(wData[7]), .A(\gregData[1][7] ), .S(n26), .Y(n25) );
  INVX1 U36 ( .A(n27), .Y(n69) );
  MUX2X1 U37 ( .B(wData[7]), .A(\gregData[2][7] ), .S(n28), .Y(n27) );
  INVX1 U38 ( .A(n29), .Y(n70) );
  MUX2X1 U39 ( .B(wData[7]), .A(\gregData[3][7] ), .S(n30), .Y(n29) );
  INVX1 U40 ( .A(n31), .Y(n71) );
  MUX2X1 U41 ( .B(wData[6]), .A(\gregData[0][6] ), .S(n24), .Y(n31) );
  INVX1 U42 ( .A(n32), .Y(n72) );
  MUX2X1 U43 ( .B(wData[6]), .A(\gregData[1][6] ), .S(n26), .Y(n32) );
  INVX1 U44 ( .A(n33), .Y(n73) );
  MUX2X1 U45 ( .B(wData[6]), .A(\gregData[2][6] ), .S(n28), .Y(n33) );
  INVX1 U46 ( .A(n34), .Y(n74) );
  MUX2X1 U47 ( .B(wData[6]), .A(\gregData[3][6] ), .S(n30), .Y(n34) );
  INVX1 U48 ( .A(n35), .Y(n75) );
  MUX2X1 U49 ( .B(wData[5]), .A(\gregData[0][5] ), .S(n24), .Y(n35) );
  INVX1 U50 ( .A(n36), .Y(n76) );
  MUX2X1 U51 ( .B(wData[5]), .A(\gregData[1][5] ), .S(n26), .Y(n36) );
  INVX1 U52 ( .A(n37), .Y(n78) );
  MUX2X1 U53 ( .B(wData[5]), .A(\gregData[2][5] ), .S(n28), .Y(n37) );
  INVX1 U54 ( .A(n38), .Y(n80) );
  MUX2X1 U55 ( .B(wData[5]), .A(\gregData[3][5] ), .S(n30), .Y(n38) );
  INVX1 U56 ( .A(n39), .Y(n82) );
  MUX2X1 U57 ( .B(wData[4]), .A(\gregData[0][4] ), .S(n24), .Y(n39) );
  INVX1 U58 ( .A(n40), .Y(n84) );
  MUX2X1 U59 ( .B(wData[4]), .A(\gregData[1][4] ), .S(n26), .Y(n40) );
  INVX1 U60 ( .A(n41), .Y(n86) );
  MUX2X1 U61 ( .B(wData[4]), .A(\gregData[2][4] ), .S(n28), .Y(n41) );
  INVX1 U62 ( .A(n42), .Y(n88) );
  MUX2X1 U63 ( .B(wData[4]), .A(\gregData[3][4] ), .S(n30), .Y(n42) );
  INVX1 U64 ( .A(n43), .Y(n90) );
  MUX2X1 U65 ( .B(wData[3]), .A(\gregData[0][3] ), .S(n24), .Y(n43) );
  INVX1 U66 ( .A(n44), .Y(n92) );
  MUX2X1 U67 ( .B(wData[3]), .A(\gregData[1][3] ), .S(n26), .Y(n44) );
  INVX1 U68 ( .A(n45), .Y(n94) );
  MUX2X1 U69 ( .B(wData[3]), .A(\gregData[2][3] ), .S(n28), .Y(n45) );
  INVX1 U70 ( .A(n46), .Y(n96) );
  MUX2X1 U71 ( .B(wData[3]), .A(\gregData[3][3] ), .S(n30), .Y(n46) );
  INVX1 U72 ( .A(n47), .Y(n98) );
  MUX2X1 U73 ( .B(wData[2]), .A(\gregData[0][2] ), .S(n24), .Y(n47) );
  INVX1 U74 ( .A(n48), .Y(n100) );
  MUX2X1 U75 ( .B(wData[2]), .A(\gregData[1][2] ), .S(n26), .Y(n48) );
  INVX1 U76 ( .A(n49), .Y(n102) );
  MUX2X1 U77 ( .B(wData[2]), .A(\gregData[2][2] ), .S(n28), .Y(n49) );
  INVX1 U78 ( .A(n50), .Y(n104) );
  MUX2X1 U79 ( .B(wData[2]), .A(\gregData[3][2] ), .S(n30), .Y(n50) );
  INVX1 U80 ( .A(n51), .Y(n106) );
  MUX2X1 U81 ( .B(wData[1]), .A(\gregData[0][1] ), .S(n24), .Y(n51) );
  INVX1 U82 ( .A(n52), .Y(n108) );
  MUX2X1 U83 ( .B(wData[1]), .A(\gregData[1][1] ), .S(n26), .Y(n52) );
  INVX1 U84 ( .A(n53), .Y(n110) );
  MUX2X1 U85 ( .B(wData[1]), .A(\gregData[2][1] ), .S(n28), .Y(n53) );
  INVX1 U86 ( .A(n54), .Y(n112) );
  MUX2X1 U87 ( .B(wData[1]), .A(\gregData[3][1] ), .S(n30), .Y(n54) );
  INVX1 U88 ( .A(n55), .Y(n114) );
  MUX2X1 U89 ( .B(wData[0]), .A(\gregData[0][0] ), .S(n24), .Y(n55) );
  NAND3X1 U90 ( .A(n56), .B(n57), .C(n58), .Y(n24) );
  INVX1 U91 ( .A(n59), .Y(n116) );
  MUX2X1 U92 ( .B(wData[0]), .A(\gregData[1][0] ), .S(n26), .Y(n59) );
  NAND3X1 U93 ( .A(n58), .B(n57), .C(wSel[0]), .Y(n26) );
  INVX1 U94 ( .A(wSel[1]), .Y(n57) );
  INVX1 U95 ( .A(n60), .Y(n118) );
  MUX2X1 U96 ( .B(wData[0]), .A(\gregData[2][0] ), .S(n28), .Y(n60) );
  NAND3X1 U97 ( .A(n58), .B(n56), .C(wSel[1]), .Y(n28) );
  INVX1 U98 ( .A(n61), .Y(n120) );
  MUX2X1 U99 ( .B(wData[0]), .A(\gregData[3][0] ), .S(n30), .Y(n61) );
  NAND3X1 U100 ( .A(wSel[0]), .B(n58), .C(wSel[1]), .Y(n30) );
  NOR2X1 U101 ( .A(n62), .B(fifoFull), .Y(n58) );
  INVX1 U102 ( .A(wEnable), .Y(n62) );
  NOR2X1 U103 ( .A(n63), .B(n64), .Y(N7) );
  XNOR2X1 U104 ( .A(n56), .B(n65), .Y(n64) );
  XNOR2X1 U105 ( .A(rSel[0]), .B(wSel[0]), .Y(n63) );
  NOR2X1 U106 ( .A(n65), .B(n66), .Y(N4) );
  XNOR2X1 U107 ( .A(n56), .B(rSel[0]), .Y(n66) );
  INVX1 U108 ( .A(wSel[0]), .Y(n56) );
  XNOR2X1 U109 ( .A(n21), .B(wSel[1]), .Y(n65) );
  INVX1 U110 ( .A(rSel[1]), .Y(n21) );
endmodule


module FifoRead_gregLength4_addrSize2 ( clk, resetN, rEnable, fifoEmpty, rSel
 );
  output [1:0] rSel;
  input clk, resetN, rEnable, fifoEmpty;
  wire   n10, n11, n3, n4, n5, n6;

  DFFSR \count_reg[0]  ( .D(n11), .CLK(clk), .R(resetN), .S(1'b1), .Q(rSel[0])
         );
  DFFSR \count_reg[1]  ( .D(n10), .CLK(clk), .R(resetN), .S(1'b1), .Q(rSel[1])
         );
  XOR2X1 U5 ( .A(n3), .B(n4), .Y(n11) );
  XOR2X1 U6 ( .A(rSel[1]), .B(n5), .Y(n10) );
  NOR2X1 U7 ( .A(n3), .B(n4), .Y(n5) );
  NAND2X1 U8 ( .A(rEnable), .B(n6), .Y(n4) );
  INVX1 U9 ( .A(fifoEmpty), .Y(n6) );
  INVX1 U10 ( .A(rSel[0]), .Y(n3) );
endmodule


module FifoWrite_gregLength4_addrSize2 ( clk, resetN, wEnable, fifoFull, wSel
 );
  output [1:0] wSel;
  input clk, resetN, wEnable, fifoFull;
  wire   n10, n11, n3, n4, n5, n6;

  DFFSR \count_reg[0]  ( .D(n11), .CLK(clk), .R(resetN), .S(1'b1), .Q(wSel[0])
         );
  DFFSR \count_reg[1]  ( .D(n10), .CLK(clk), .R(resetN), .S(1'b1), .Q(wSel[1])
         );
  XOR2X1 U5 ( .A(n3), .B(n4), .Y(n11) );
  XOR2X1 U6 ( .A(wSel[1]), .B(n5), .Y(n10) );
  NOR2X1 U7 ( .A(n3), .B(n4), .Y(n5) );
  NAND2X1 U8 ( .A(wEnable), .B(n6), .Y(n4) );
  INVX1 U9 ( .A(fifoFull), .Y(n6) );
  INVX1 U10 ( .A(wSel[0]), .Y(n3) );
endmodule


module FifoTop_gregLength4_gregWidth8_addrSize2 ( clk, rEnable, resetN, wData, 
        wEnable, fifoEmpty, fifoFull, rData );
  input [7:0] wData;
  output [7:0] rData;
  input clk, rEnable, resetN, wEnable;
  output fifoEmpty, fifoFull;

  wire   [1:0] rSel;
  wire   [1:0] wSel;

  FifoRam_gregLength4_gregWidth8_addrSize2 U_0 ( .clk(clk), .resetN(resetN), 
        .wEnable(wEnable), .wData(wData), .wSel(wSel), .rSel(rSel), .rData(
        rData), .fifoEmpty(fifoEmpty), .fifoFull(fifoFull) );
  FifoRead_gregLength4_addrSize2 U_1 ( .clk(clk), .resetN(resetN), .rEnable(
        rEnable), .fifoEmpty(fifoEmpty), .rSel(rSel) );
  FifoWrite_gregLength4_addrSize2 U_2 ( .clk(clk), .resetN(resetN), .wEnable(
        wEnable), .fifoFull(fifoFull), .wSel(wSel) );
endmodule


module SpiClkDivide_165_3_0_0_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
endmodule


module SpiClkDivide_165_3_0_0 ( clk, resetN, sclEnable, sclSpeed, tsrEnable, 
        scl );
  input clk, resetN, sclEnable, sclSpeed;
  output tsrEnable, scl;
  wire   N32, N33, N34, N35, N36, N37, N38, N39, N40, \U3/U1/Z_0 , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n34, n35, n36, n37, n38, n39;
  wire   [8:0] count;
  wire   [8:0] nextcount;
  assign \U3/U1/Z_0  = sclSpeed;

  DFFSR \count_reg[0]  ( .D(nextcount[0]), .CLK(clk), .R(resetN), .S(1'b1), 
        .Q(count[0]) );
  DFFSR \count_reg[8]  ( .D(nextcount[8]), .CLK(clk), .R(resetN), .S(1'b1), 
        .Q(count[8]) );
  DFFSR \count_reg[7]  ( .D(nextcount[7]), .CLK(clk), .R(resetN), .S(1'b1), 
        .Q(count[7]) );
  DFFSR \count_reg[6]  ( .D(nextcount[6]), .CLK(clk), .R(resetN), .S(1'b1), 
        .Q(count[6]) );
  DFFSR \count_reg[5]  ( .D(nextcount[5]), .CLK(clk), .R(resetN), .S(1'b1), 
        .Q(count[5]) );
  DFFSR \count_reg[4]  ( .D(nextcount[4]), .CLK(clk), .R(resetN), .S(1'b1), 
        .Q(count[4]) );
  DFFSR \count_reg[3]  ( .D(nextcount[3]), .CLK(clk), .R(resetN), .S(1'b1), 
        .Q(count[3]) );
  DFFSR \count_reg[2]  ( .D(nextcount[2]), .CLK(clk), .R(resetN), .S(1'b1), 
        .Q(count[2]) );
  DFFSR \count_reg[1]  ( .D(nextcount[1]), .CLK(clk), .R(resetN), .S(1'b1), 
        .Q(count[1]) );
  DFFSR sclReg_reg ( .D(n39), .CLK(clk), .R(resetN), .S(1'b1), .Q(scl) );
  SpiClkDivide_165_3_0_0_DW01_inc_0 add_96 ( .A(count), .SUM({N40, N39, N38, 
        N37, N36, N35, N34, N33, N32}) );
  MUX2X1 U8 ( .B(n1), .A(n2), .S(count[0]), .Y(tsrEnable) );
  NAND2X1 U9 ( .A(\U3/U1/Z_0 ), .B(n3), .Y(n2) );
  OR2X1 U10 ( .A(n4), .B(n5), .Y(n1) );
  NAND3X1 U11 ( .A(count[7]), .B(count[5]), .C(n6), .Y(n5) );
  AND2X1 U12 ( .A(count[1]), .B(count[4]), .Y(n6) );
  NAND3X1 U13 ( .A(n7), .B(n8), .C(n9), .Y(n4) );
  NOR2X1 U14 ( .A(count[8]), .B(count[6]), .Y(n9) );
  AND2X1 U20 ( .A(N40), .B(n10), .Y(nextcount[8]) );
  AND2X1 U21 ( .A(N39), .B(n10), .Y(nextcount[7]) );
  AND2X1 U22 ( .A(N38), .B(n10), .Y(nextcount[6]) );
  AND2X1 U23 ( .A(N37), .B(n10), .Y(nextcount[5]) );
  AND2X1 U24 ( .A(N36), .B(n10), .Y(nextcount[4]) );
  AND2X1 U25 ( .A(N35), .B(n10), .Y(nextcount[3]) );
  AND2X1 U26 ( .A(N34), .B(n10), .Y(nextcount[2]) );
  AND2X1 U27 ( .A(N33), .B(n10), .Y(nextcount[1]) );
  AND2X1 U28 ( .A(N32), .B(n10), .Y(nextcount[0]) );
  OAI21X1 U29 ( .A(n11), .B(n12), .C(n13), .Y(n10) );
  INVX1 U30 ( .A(n7), .Y(n12) );
  AND2X1 U31 ( .A(count[8]), .B(n14), .Y(n11) );
  OAI21X1 U32 ( .A(n15), .B(n16), .C(n17), .Y(n14) );
  INVX1 U33 ( .A(count[7]), .Y(n17) );
  OAI21X1 U34 ( .A(count[4]), .B(n18), .C(count[5]), .Y(n16) );
  OAI21X1 U35 ( .A(count[0]), .B(n13), .C(n19), .Y(n39) );
  NAND2X1 U36 ( .A(n20), .B(n7), .Y(n19) );
  NOR2X1 U37 ( .A(n21), .B(\U3/U1/Z_0 ), .Y(n7) );
  INVX1 U38 ( .A(sclEnable), .Y(n21) );
  AOI21X1 U39 ( .A(count[7]), .B(n22), .C(count[8]), .Y(n20) );
  OAI21X1 U40 ( .A(n23), .B(n34), .C(n15), .Y(n22) );
  OAI21X1 U41 ( .A(count[1]), .B(n18), .C(count[4]), .Y(n34) );
  INVX1 U42 ( .A(n8), .Y(n18) );
  INVX1 U43 ( .A(n3), .Y(n13) );
  NOR2X1 U44 ( .A(n35), .B(n36), .Y(n3) );
  NAND3X1 U45 ( .A(sclEnable), .B(n8), .C(n37), .Y(n36) );
  NOR2X1 U46 ( .A(count[4]), .B(count[1]), .Y(n37) );
  NOR2X1 U47 ( .A(count[3]), .B(count[2]), .Y(n8) );
  NAND3X1 U48 ( .A(n23), .B(n15), .C(n38), .Y(n35) );
  NOR2X1 U49 ( .A(count[8]), .B(count[7]), .Y(n38) );
  INVX1 U50 ( .A(count[6]), .Y(n15) );
  INVX1 U51 ( .A(count[5]), .Y(n23) );
endmodule


module SpiXmitSR_srWidth8 ( clk, resetN, tsrEnable, tsrLoad, tsrData, dataOut
 );
  input [7:0] tsrData;
  input clk, resetN, tsrEnable, tsrLoad;
  output dataOut;
  wire   \tsrDummyReg[0] , load2, load1, load, N2, n36, n37, n38, n39, n40,
         n41, n42, n43, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22;
  wire   [6:0] tsrDataReg;

  DFFSR load1_reg ( .D(tsrLoad), .CLK(clk), .R(resetN), .S(1'b1), .Q(load1) );
  DFFSR load2_reg ( .D(load1), .CLK(clk), .R(resetN), .S(1'b1), .Q(load2) );
  DFFSR load_reg ( .D(N2), .CLK(clk), .R(resetN), .S(1'b1), .Q(load) );
  DFFSR \tsrDummyReg_reg[0]  ( .D(n22), .CLK(clk), .R(1'b1), .S(resetN), .Q(
        \tsrDummyReg[0] ) );
  DFFSR \tsrDataReg_reg[0]  ( .D(n43), .CLK(clk), .R(1'b1), .S(resetN), .Q(
        tsrDataReg[0]) );
  DFFSR \tsrDataReg_reg[1]  ( .D(n42), .CLK(clk), .R(1'b1), .S(resetN), .Q(
        tsrDataReg[1]) );
  DFFSR \tsrDataReg_reg[2]  ( .D(n41), .CLK(clk), .R(1'b1), .S(resetN), .Q(
        tsrDataReg[2]) );
  DFFSR \tsrDataReg_reg[3]  ( .D(n40), .CLK(clk), .R(1'b1), .S(resetN), .Q(
        tsrDataReg[3]) );
  DFFSR \tsrDataReg_reg[4]  ( .D(n39), .CLK(clk), .R(1'b1), .S(resetN), .Q(
        tsrDataReg[4]) );
  DFFSR \tsrDataReg_reg[5]  ( .D(n38), .CLK(clk), .R(1'b1), .S(resetN), .Q(
        tsrDataReg[5]) );
  DFFSR \tsrDataReg_reg[6]  ( .D(n37), .CLK(clk), .R(1'b1), .S(resetN), .Q(
        tsrDataReg[6]) );
  DFFSR \tsrDataReg_reg[7]  ( .D(n36), .CLK(clk), .R(1'b1), .S(resetN), .Q(
        dataOut) );
  INVX1 U3 ( .A(n1), .Y(n22) );
  MUX2X1 U4 ( .B(\tsrDummyReg[0] ), .A(tsrData[0]), .S(load), .Y(n1) );
  OAI21X1 U5 ( .A(n2), .B(n3), .C(n4), .Y(n43) );
  AOI22X1 U6 ( .A(n5), .B(tsrData[0]), .C(tsrDataReg[0]), .D(n6), .Y(n4) );
  INVX1 U7 ( .A(\tsrDummyReg[0] ), .Y(n2) );
  OAI21X1 U8 ( .A(n7), .B(n3), .C(n8), .Y(n42) );
  AOI22X1 U9 ( .A(tsrData[1]), .B(n5), .C(tsrDataReg[1]), .D(n6), .Y(n8) );
  INVX1 U10 ( .A(tsrDataReg[0]), .Y(n7) );
  OAI21X1 U11 ( .A(n3), .B(n9), .C(n10), .Y(n41) );
  AOI22X1 U12 ( .A(tsrData[2]), .B(n5), .C(tsrDataReg[2]), .D(n6), .Y(n10) );
  INVX1 U13 ( .A(tsrDataReg[1]), .Y(n9) );
  OAI21X1 U14 ( .A(n3), .B(n11), .C(n12), .Y(n40) );
  AOI22X1 U15 ( .A(tsrData[3]), .B(n5), .C(tsrDataReg[3]), .D(n6), .Y(n12) );
  INVX1 U16 ( .A(tsrDataReg[2]), .Y(n11) );
  OAI21X1 U17 ( .A(n3), .B(n13), .C(n14), .Y(n39) );
  AOI22X1 U18 ( .A(tsrData[4]), .B(n5), .C(tsrDataReg[4]), .D(n6), .Y(n14) );
  INVX1 U19 ( .A(tsrDataReg[3]), .Y(n13) );
  OAI21X1 U20 ( .A(n3), .B(n15), .C(n16), .Y(n38) );
  AOI22X1 U21 ( .A(tsrData[5]), .B(n5), .C(tsrDataReg[5]), .D(n6), .Y(n16) );
  INVX1 U22 ( .A(tsrDataReg[4]), .Y(n15) );
  OAI21X1 U23 ( .A(n3), .B(n17), .C(n18), .Y(n37) );
  AOI22X1 U24 ( .A(tsrData[6]), .B(n5), .C(tsrDataReg[6]), .D(n6), .Y(n18) );
  INVX1 U25 ( .A(tsrDataReg[5]), .Y(n17) );
  OAI21X1 U26 ( .A(n3), .B(n19), .C(n20), .Y(n36) );
  AOI22X1 U27 ( .A(tsrData[7]), .B(n5), .C(dataOut), .D(n6), .Y(n20) );
  NOR2X1 U28 ( .A(n6), .B(tsrEnable), .Y(n5) );
  NOR2X1 U29 ( .A(load), .B(tsrEnable), .Y(n6) );
  INVX1 U30 ( .A(tsrDataReg[6]), .Y(n19) );
  INVX1 U31 ( .A(tsrEnable), .Y(n3) );
  NOR2X1 U32 ( .A(load2), .B(n21), .Y(N2) );
  INVX1 U33 ( .A(load1), .Y(n21) );
endmodule


module controller ( clk, rst, fifo_full, decoder_instruction, data_ready, 
        eop_found, data_read, fifo_read, fifo_write, intercept );
  input [3:0] decoder_instruction;
  input [1:0] data_ready;
  input clk, rst, fifo_full, eop_found, data_read;
  output fifo_read, fifo_write, intercept;
  wire   sd, eop1, eop2, dr1, dr2, dr, nextSd, eopf, N26, n94, n97, n100, n101,
         n102, n103, n104, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73;
  wire   [3:0] usb;
  wire   [2:0] eopCount;
  wire   [2:0] writeCount;
  wire   [3:0] nextUsb;
  assign fifo_read = sd;

  DFFSR eop1_reg ( .D(eop_found), .CLK(clk), .R(rst), .S(1'b1), .Q(eop1) );
  DFFSR eop2_reg ( .D(eop1), .CLK(clk), .R(rst), .S(1'b1), .Q(eop2) );
  DFFPOSX1 eopf_reg ( .D(n94), .CLK(clk), .Q(eopf) );
  DFFSR \eopCount_reg[0]  ( .D(n102), .CLK(clk), .R(rst), .S(1'b1), .Q(
        eopCount[0]) );
  DFFSR \eopCount_reg[1]  ( .D(n103), .CLK(clk), .R(rst), .S(1'b1), .Q(
        eopCount[1]) );
  DFFSR \eopCount_reg[2]  ( .D(n104), .CLK(clk), .R(rst), .S(1'b1), .Q(
        eopCount[2]) );
  DFFSR \usb_reg[2]  ( .D(nextUsb[2]), .CLK(clk), .R(rst), .S(1'b1), .Q(usb[2]) );
  DFFSR \writeCount_reg[2]  ( .D(n100), .CLK(clk), .R(rst), .S(1'b1), .Q(
        writeCount[2]) );
  DFFSR \usb_reg[3]  ( .D(nextUsb[3]), .CLK(clk), .R(rst), .S(1'b1), .Q(usb[3]) );
  DFFSR \usb_reg[1]  ( .D(nextUsb[1]), .CLK(clk), .R(rst), .S(1'b1), .Q(usb[1]) );
  DFFSR \usb_reg[0]  ( .D(nextUsb[0]), .CLK(clk), .R(rst), .S(1'b1), .Q(usb[0]) );
  DFFSR \writeCount_reg[0]  ( .D(n101), .CLK(clk), .R(rst), .S(1'b1), .Q(
        writeCount[0]) );
  DFFSR \writeCount_reg[1]  ( .D(n97), .CLK(clk), .R(rst), .S(1'b1), .Q(
        writeCount[1]) );
  DFFSR dr1_reg ( .D(data_read), .CLK(clk), .R(rst), .S(1'b1), .Q(dr1) );
  DFFSR dr2_reg ( .D(dr1), .CLK(clk), .R(rst), .S(1'b1), .Q(dr2) );
  DFFSR dr_reg ( .D(N26), .CLK(clk), .R(rst), .S(1'b1), .Q(dr) );
  DFFSR sd_reg ( .D(nextSd), .CLK(clk), .R(rst), .S(1'b1), .Q(sd) );
  AND2X1 U3 ( .A(n1), .B(fifo_write), .Y(nextUsb[3]) );
  NAND3X1 U4 ( .A(n2), .B(n3), .C(n4), .Y(nextUsb[2]) );
  NOR2X1 U5 ( .A(n5), .B(n6), .Y(n4) );
  AND2X1 U6 ( .A(n7), .B(n8), .Y(n2) );
  NAND3X1 U7 ( .A(n9), .B(n8), .C(n10), .Y(nextUsb[1]) );
  INVX1 U8 ( .A(n11), .Y(n10) );
  OAI22X1 U9 ( .A(n12), .B(n13), .C(n14), .D(n15), .Y(n11) );
  NAND3X1 U10 ( .A(n16), .B(n17), .C(data_ready[0]), .Y(n9) );
  INVX1 U11 ( .A(data_ready[1]), .Y(n17) );
  INVX1 U12 ( .A(n3), .Y(n16) );
  OR2X1 U13 ( .A(n18), .B(n19), .Y(nextUsb[0]) );
  OAI21X1 U14 ( .A(data_ready[0]), .B(n3), .C(n20), .Y(n19) );
  INVX1 U15 ( .A(n6), .Y(n20) );
  OAI21X1 U16 ( .A(n21), .B(n1), .C(n22), .Y(n6) );
  NAND3X1 U17 ( .A(decoder_instruction[1]), .B(decoder_instruction[0]), .C(n23), .Y(n22) );
  NOR2X1 U18 ( .A(n12), .B(n24), .Y(n23) );
  OAI21X1 U19 ( .A(n25), .B(n26), .C(n13), .Y(n24) );
  INVX1 U20 ( .A(decoder_instruction[2]), .Y(n25) );
  OAI21X1 U21 ( .A(n27), .B(n28), .C(n29), .Y(n1) );
  NOR2X1 U22 ( .A(fifo_full), .B(eop_found), .Y(n29) );
  NAND2X1 U23 ( .A(writeCount[1]), .B(writeCount[0]), .Y(n28) );
  INVX1 U24 ( .A(writeCount[2]), .Y(n27) );
  OAI21X1 U25 ( .A(n30), .B(n14), .C(n31), .Y(n18) );
  AOI22X1 U26 ( .A(n32), .B(n33), .C(data_ready[1]), .D(n34), .Y(n31) );
  OAI21X1 U27 ( .A(n35), .B(n8), .C(n3), .Y(n34) );
  INVX1 U28 ( .A(data_ready[0]), .Y(n35) );
  NOR2X1 U29 ( .A(n26), .B(n12), .Y(n33) );
  NAND3X1 U30 ( .A(n36), .B(n37), .C(n38), .Y(n12) );
  INVX1 U31 ( .A(decoder_instruction[3]), .Y(n26) );
  NOR2X1 U32 ( .A(n39), .B(n40), .Y(n32) );
  MUX2X1 U33 ( .B(decoder_instruction[1]), .A(n41), .S(decoder_instruction[2]), 
        .Y(n40) );
  NOR2X1 U34 ( .A(usb[1]), .B(decoder_instruction[1]), .Y(n41) );
  INVX1 U35 ( .A(decoder_instruction[0]), .Y(n39) );
  NAND3X1 U36 ( .A(n36), .B(n37), .C(n42), .Y(n14) );
  NOR2X1 U37 ( .A(usb[1]), .B(n38), .Y(n42) );
  INVX1 U38 ( .A(n15), .Y(n30) );
  NAND3X1 U39 ( .A(decoder_instruction[0]), .B(decoder_instruction[3]), .C(n43), .Y(n15) );
  NOR2X1 U40 ( .A(decoder_instruction[2]), .B(decoder_instruction[1]), .Y(n43)
         );
  NOR2X1 U41 ( .A(sd), .B(n44), .Y(nextSd) );
  INVX1 U42 ( .A(dr), .Y(n44) );
  INVX1 U43 ( .A(n7), .Y(intercept) );
  NAND3X1 U44 ( .A(usb[1]), .B(usb[0]), .C(n45), .Y(n7) );
  NOR2X1 U45 ( .A(usb[3]), .B(usb[2]), .Y(n45) );
  MUX2X1 U46 ( .B(n46), .A(n47), .S(writeCount[1]), .Y(n97) );
  NAND2X1 U47 ( .A(fifo_write), .B(writeCount[0]), .Y(n46) );
  MUX2X1 U48 ( .B(n48), .A(n49), .S(rst), .Y(n94) );
  NAND2X1 U49 ( .A(eop1), .B(n50), .Y(n49) );
  INVX1 U50 ( .A(eop2), .Y(n50) );
  OAI22X1 U51 ( .A(n51), .B(n52), .C(n53), .D(n54), .Y(n104) );
  INVX1 U52 ( .A(eopCount[2]), .Y(n54) );
  MUX2X1 U53 ( .B(n52), .A(n53), .S(eopCount[1]), .Y(n103) );
  INVX1 U54 ( .A(n55), .Y(n53) );
  OAI21X1 U55 ( .A(eopCount[0]), .B(n56), .C(n57), .Y(n55) );
  NAND3X1 U56 ( .A(n5), .B(eopCount[0]), .C(n58), .Y(n52) );
  MUX2X1 U57 ( .B(n59), .A(n57), .S(eopCount[0]), .Y(n102) );
  INVX1 U58 ( .A(n60), .Y(n57) );
  OAI21X1 U59 ( .A(n58), .B(n56), .C(n61), .Y(n60) );
  NAND2X1 U60 ( .A(n58), .B(n5), .Y(n59) );
  INVX1 U61 ( .A(n56), .Y(n5) );
  NAND3X1 U62 ( .A(n38), .B(n13), .C(n62), .Y(n56) );
  AOI21X1 U63 ( .A(n63), .B(eopCount[2]), .C(n64), .Y(n62) );
  AND2X1 U64 ( .A(n51), .B(eopCount[0]), .Y(n63) );
  INVX1 U65 ( .A(eopCount[1]), .Y(n51) );
  AOI21X1 U66 ( .A(eopCount[2]), .B(eopCount[1]), .C(n48), .Y(n58) );
  INVX1 U67 ( .A(eopf), .Y(n48) );
  MUX2X1 U68 ( .B(n21), .A(n65), .S(writeCount[0]), .Y(n101) );
  MUX2X1 U69 ( .B(n66), .A(n67), .S(writeCount[2]), .Y(n100) );
  INVX1 U70 ( .A(n68), .Y(n67) );
  OAI21X1 U71 ( .A(n21), .B(writeCount[1]), .C(n47), .Y(n68) );
  INVX1 U72 ( .A(n69), .Y(n47) );
  OAI21X1 U73 ( .A(writeCount[0]), .B(n21), .C(n65), .Y(n69) );
  INVX1 U74 ( .A(n70), .Y(n65) );
  NAND3X1 U75 ( .A(n3), .B(n8), .C(n61), .Y(n70) );
  OAI21X1 U76 ( .A(usb[0]), .B(n71), .C(usb[3]), .Y(n61) );
  NAND2X1 U77 ( .A(n13), .B(n36), .Y(n71) );
  INVX1 U78 ( .A(usb[2]), .Y(n36) );
  NAND3X1 U79 ( .A(n72), .B(n38), .C(usb[1]), .Y(n8) );
  INVX1 U80 ( .A(usb[0]), .Y(n38) );
  NAND3X1 U81 ( .A(n72), .B(n13), .C(usb[0]), .Y(n3) );
  INVX1 U82 ( .A(usb[1]), .Y(n13) );
  NAND3X1 U83 ( .A(writeCount[1]), .B(writeCount[0]), .C(fifo_write), .Y(n66)
         );
  INVX1 U84 ( .A(n21), .Y(fifo_write) );
  NAND3X1 U85 ( .A(usb[0]), .B(n72), .C(usb[1]), .Y(n21) );
  INVX1 U86 ( .A(n64), .Y(n72) );
  NAND2X1 U87 ( .A(usb[2]), .B(n37), .Y(n64) );
  INVX1 U88 ( .A(usb[3]), .Y(n37) );
  NOR2X1 U89 ( .A(dr2), .B(n73), .Y(N26) );
  INVX1 U90 ( .A(dr1), .Y(n73) );
endmodule


module SEE_det ( clk, rst, data0, data1, EGDE, F_EGDE, EOP );
  input clk, rst, data0, data1;
  output EGDE, F_EGDE, EOP;
  wire   d1, d2, nxt_EOP, nxt_EGDE, nxt_FEGDE, n6, n7, n8, n9, n10;

  DFFSR cur_EOP_reg ( .D(nxt_EOP), .CLK(clk), .R(rst), .S(1'b1), .Q(EOP) );
  DFFSR d1_reg ( .D(data0), .CLK(clk), .R(1'b1), .S(rst), .Q(d1) );
  DFFSR d2_reg ( .D(d1), .CLK(clk), .R(1'b1), .S(rst), .Q(d2) );
  DFFSR cur_EGDE_reg ( .D(nxt_EGDE), .CLK(clk), .R(rst), .S(1'b1), .Q(EGDE) );
  DFFSR cur_FEGDE_reg ( .D(nxt_FEGDE), .CLK(clk), .R(rst), .S(1'b1), .Q(F_EGDE) );
  INVX1 U8 ( .A(n6), .Y(nxt_FEGDE) );
  NOR2X1 U9 ( .A(n7), .B(n8), .Y(nxt_EOP) );
  OR2X1 U10 ( .A(data1), .B(data0), .Y(n8) );
  OAI21X1 U11 ( .A(n9), .B(n10), .C(n6), .Y(nxt_EGDE) );
  NAND3X1 U12 ( .A(d2), .B(n9), .C(rst), .Y(n6) );
  OR2X1 U13 ( .A(n7), .B(d2), .Y(n10) );
  INVX1 U14 ( .A(rst), .Y(n7) );
  INVX1 U15 ( .A(d1), .Y(n9) );
endmodule


module NRZIdecode ( clk, rst, data0, enable, EOP, data_out );
  input clk, rst, data0, enable, EOP;
  output data_out;
  wire   data0_buf0, n9, n10, n12, n1, n2, n3, n4, n5, n6, n7, n11;

  DFFSR data0_buf0_reg ( .D(n11), .CLK(clk), .R(n10), .S(n12), .Q(data0_buf0)
         );
  DFFSR data_out_reg ( .D(n9), .CLK(clk), .R(1'b1), .S(rst), .Q(data_out) );
  INVX1 U3 ( .A(n1), .Y(n11) );
  OAI21X1 U4 ( .A(n2), .B(n3), .C(n4), .Y(n9) );
  MUX2X1 U5 ( .B(n5), .A(n1), .S(n6), .Y(n4) );
  NOR2X1 U6 ( .A(data0_buf0), .B(EOP), .Y(n1) );
  AND2X1 U7 ( .A(n2), .B(data0_buf0), .Y(n5) );
  INVX1 U8 ( .A(data_out), .Y(n3) );
  INVX1 U9 ( .A(EOP), .Y(n2) );
  OAI21X1 U10 ( .A(enable), .B(n7), .C(n10), .Y(n12) );
  INVX1 U11 ( .A(rst), .Y(n7) );
  NAND2X1 U12 ( .A(enable), .B(n6), .Y(n10) );
  INVX1 U13 ( .A(data0), .Y(n6) );
endmodule


module shift_greg ( clk, rst, shift_en, data_in, data_out, data_ready );
  output [7:0] data_out;
  input clk, rst, shift_en, data_in;
  output data_ready;
  wire   N3, n19, n21, n23, n25, n27, n29, n31, n33, n35, n37, n39, n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [2:0] cnt;

  DFFSR \cnt_reg[0]  ( .D(n39), .CLK(clk), .R(rst), .S(1'b1), .Q(cnt[0]) );
  DFFSR \cnt_reg[1]  ( .D(n37), .CLK(clk), .R(rst), .S(1'b1), .Q(cnt[1]) );
  DFFSR \cnt_reg[2]  ( .D(n35), .CLK(clk), .R(rst), .S(1'b1), .Q(cnt[2]) );
  DFFSR \pre_val_reg[7]  ( .D(n33), .CLK(clk), .R(rst), .S(1'b1), .Q(
        data_out[7]) );
  DFFSR \pre_val_reg[6]  ( .D(n31), .CLK(clk), .R(rst), .S(1'b1), .Q(
        data_out[6]) );
  DFFSR \pre_val_reg[5]  ( .D(n29), .CLK(clk), .R(rst), .S(1'b1), .Q(
        data_out[5]) );
  DFFSR \pre_val_reg[4]  ( .D(n27), .CLK(clk), .R(rst), .S(1'b1), .Q(
        data_out[4]) );
  DFFSR \pre_val_reg[3]  ( .D(n25), .CLK(clk), .R(rst), .S(1'b1), .Q(
        data_out[3]) );
  DFFSR \pre_val_reg[2]  ( .D(n23), .CLK(clk), .R(rst), .S(1'b1), .Q(
        data_out[2]) );
  DFFSR \pre_val_reg[1]  ( .D(n21), .CLK(clk), .R(rst), .S(1'b1), .Q(
        data_out[1]) );
  DFFSR \pre_val_reg[0]  ( .D(n19), .CLK(clk), .R(rst), .S(1'b1), .Q(
        data_out[0]) );
  DFFSR cur_data_ready_reg ( .D(N3), .CLK(clk), .R(rst), .S(1'b1), .Q(
        data_ready) );
  XNOR2X1 U3 ( .A(shift_en), .B(n1), .Y(n39) );
  XNOR2X1 U4 ( .A(cnt[1]), .B(n2), .Y(n37) );
  XOR2X1 U5 ( .A(cnt[2]), .B(n3), .Y(n35) );
  NOR2X1 U6 ( .A(n4), .B(n2), .Y(n3) );
  NAND2X1 U7 ( .A(cnt[0]), .B(shift_en), .Y(n2) );
  INVX1 U8 ( .A(cnt[1]), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(n33) );
  MUX2X1 U10 ( .B(data_out[7]), .A(data_in), .S(shift_en), .Y(n5) );
  INVX1 U11 ( .A(n6), .Y(n31) );
  MUX2X1 U12 ( .B(data_out[6]), .A(data_out[7]), .S(shift_en), .Y(n6) );
  INVX1 U13 ( .A(n7), .Y(n29) );
  MUX2X1 U14 ( .B(data_out[5]), .A(data_out[6]), .S(shift_en), .Y(n7) );
  INVX1 U15 ( .A(n8), .Y(n27) );
  MUX2X1 U16 ( .B(data_out[4]), .A(data_out[5]), .S(shift_en), .Y(n8) );
  INVX1 U17 ( .A(n9), .Y(n25) );
  MUX2X1 U18 ( .B(data_out[3]), .A(data_out[4]), .S(shift_en), .Y(n9) );
  INVX1 U19 ( .A(n10), .Y(n23) );
  MUX2X1 U20 ( .B(data_out[2]), .A(data_out[3]), .S(shift_en), .Y(n10) );
  INVX1 U21 ( .A(n11), .Y(n21) );
  MUX2X1 U22 ( .B(data_out[1]), .A(data_out[2]), .S(shift_en), .Y(n11) );
  INVX1 U23 ( .A(n12), .Y(n19) );
  MUX2X1 U24 ( .B(data_out[0]), .A(data_out[1]), .S(shift_en), .Y(n12) );
  NOR2X1 U25 ( .A(n13), .B(n14), .Y(N3) );
  NAND2X1 U26 ( .A(rst), .B(n1), .Y(n14) );
  INVX1 U27 ( .A(cnt[0]), .Y(n1) );
  OR2X1 U28 ( .A(cnt[1]), .B(cnt[2]), .Y(n13) );
endmodule


module timer ( clk, rst, egde_det, f_egde_det, EOP, data_clk, shift_en );
  input clk, rst, egde_det, f_egde_det, EOP;
  output data_clk, shift_en;
  wire   n28, nxt_shift_en, dclk_nxt, n1, n2, n3, n5, n6, n7, n8, n9, n10, n11,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27;
  wire   [3:0] CS;
  wire   [3:0] NS;

  DFFSR \CS_reg[0]  ( .D(NS[0]), .CLK(clk), .R(rst), .S(1'b1), .Q(CS[0]) );
  DFFSR \CS_reg[2]  ( .D(NS[2]), .CLK(clk), .R(rst), .S(1'b1), .Q(CS[2]) );
  DFFSR \CS_reg[3]  ( .D(NS[3]), .CLK(clk), .R(rst), .S(1'b1), .Q(CS[3]) );
  DFFSR \CS_reg[1]  ( .D(NS[1]), .CLK(clk), .R(rst), .S(1'b1), .Q(CS[1]) );
  DFFSR cur_shift_en_reg ( .D(nxt_shift_en), .CLK(clk), .R(rst), .S(1'b1), .Q(
        n28) );
  DFFSR dclk_cur_reg ( .D(dclk_nxt), .CLK(clk), .R(rst), .S(1'b1), .Q(data_clk) );
  NAND3X1 U3 ( .A(n7), .B(n5), .C(n6), .Y(n1) );
  INVX2 U4 ( .A(n1), .Y(nxt_shift_en) );
  OAI21X1 U5 ( .A(n24), .B(n18), .C(n2), .Y(n20) );
  INVX2 U6 ( .A(n5), .Y(n2) );
  OAI21X1 U7 ( .A(n24), .B(n18), .C(CS[0]), .Y(n3) );
  INVX2 U8 ( .A(n3), .Y(n23) );
  BUFX2 U9 ( .A(n28), .Y(shift_en) );
  AOI21X1 U10 ( .A(n8), .B(n5), .C(CS[3]), .Y(dclk_nxt) );
  XOR2X1 U11 ( .A(n6), .B(CS[2]), .Y(n8) );
  NOR2X1 U18 ( .A(n9), .B(n10), .Y(NS[3]) );
  AOI22X1 U19 ( .A(n11), .B(n7), .C(CS[3]), .D(n18), .Y(n9) );
  NOR2X1 U20 ( .A(n10), .B(n19), .Y(NS[2]) );
  MUX2X1 U21 ( .B(n7), .A(n18), .S(n11), .Y(n19) );
  INVX1 U22 ( .A(n6), .Y(n11) );
  NAND2X1 U23 ( .A(CS[1]), .B(CS[0]), .Y(n6) );
  NOR2X1 U24 ( .A(n18), .B(CS[3]), .Y(n7) );
  NOR2X1 U25 ( .A(n10), .B(n20), .Y(NS[1]) );
  XNOR2X1 U26 ( .A(CS[0]), .B(CS[1]), .Y(n5) );
  OR2X1 U27 ( .A(EOP), .B(egde_det), .Y(n10) );
  MUX2X1 U28 ( .B(n21), .A(n22), .S(n23), .Y(NS[0]) );
  MUX2X1 U29 ( .B(n25), .A(f_egde_det), .S(n26), .Y(n21) );
  NOR2X1 U30 ( .A(CS[1]), .B(n27), .Y(n26) );
  NAND2X1 U31 ( .A(n18), .B(n24), .Y(n27) );
  INVX1 U32 ( .A(CS[3]), .Y(n24) );
  INVX1 U33 ( .A(CS[2]), .Y(n18) );
  NAND2X1 U34 ( .A(EOP), .B(n22), .Y(n25) );
  INVX1 U35 ( .A(egde_det), .Y(n22) );
endmodule


module decoder ( clk, rst, data0, data1, halt, data, inst, data_out, dclk, 
        eopOut );
  output [1:0] data;
  output [3:0] inst;
  output [7:0] data_out;
  input clk, rst, data0, data1, halt;
  output dclk, eopOut;
  wire   data_ready_0, data_ready_1, \nxt_data[1] , data_ready, egde, fegde,
         shift_enable, act_data, n67, n68, n69, n70, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66;
  wire   [3:0] CS;
  wire   [3:0] nxt_inst;

  DFFSR data_ready_0_reg ( .D(data_ready), .CLK(clk), .R(rst), .S(1'b1), .Q(
        data_ready_0) );
  DFFSR data_ready_1_reg ( .D(data_ready_0), .CLK(clk), .R(rst), .S(1'b1), .Q(
        data_ready_1) );
  DFFSR \CS_reg[0]  ( .D(n69), .CLK(clk), .R(rst), .S(1'b1), .Q(CS[0]) );
  DFFSR \CS_reg[1]  ( .D(n67), .CLK(clk), .R(rst), .S(1'b1), .Q(CS[1]) );
  DFFSR \CS_reg[2]  ( .D(n68), .CLK(clk), .R(rst), .S(1'b1), .Q(CS[2]) );
  DFFSR \CS_reg[3]  ( .D(n70), .CLK(clk), .R(rst), .S(1'b1), .Q(CS[3]) );
  DFFSR \cur_data_reg[1]  ( .D(\nxt_data[1] ), .CLK(clk), .R(rst), .S(1'b1), 
        .Q(data[1]) );
  DFFSR \cur_data_reg[0]  ( .D(n66), .CLK(clk), .R(rst), .S(1'b1), .Q(data[0])
         );
  DFFSR \cur_inst_reg[3]  ( .D(nxt_inst[3]), .CLK(clk), .R(rst), .S(1'b1), .Q(
        inst[3]) );
  DFFSR \cur_inst_reg[2]  ( .D(nxt_inst[2]), .CLK(clk), .R(rst), .S(1'b1), .Q(
        inst[2]) );
  DFFSR \cur_inst_reg[1]  ( .D(nxt_inst[1]), .CLK(clk), .R(rst), .S(1'b1), .Q(
        inst[1]) );
  DFFSR \cur_inst_reg[0]  ( .D(nxt_inst[0]), .CLK(clk), .R(rst), .S(1'b1), .Q(
        inst[0]) );
  SEE_det part2 ( .clk(clk), .rst(rst), .data0(data0), .data1(data1), .EGDE(
        egde), .F_EGDE(fegde), .EOP(eopOut) );
  NRZIdecode part3 ( .clk(clk), .rst(rst), .data0(data0), .enable(shift_enable), .EOP(eopOut), .data_out(act_data) );
  shift_greg part4 ( .clk(clk), .rst(rst), .shift_en(shift_enable), .data_in(
        act_data), .data_out(data_out), .data_ready(data_ready) );
  timer part5 ( .clk(clk), .rst(rst), .egde_det(egde), .f_egde_det(fegde), 
        .EOP(eopOut), .data_clk(dclk), .shift_en(shift_enable) );
  NOR2X1 U15 ( .A(n13), .B(n14), .Y(nxt_inst[3]) );
  AND2X1 U16 ( .A(n15), .B(data_out[5]), .Y(nxt_inst[2]) );
  NOR2X1 U17 ( .A(n13), .B(n16), .Y(nxt_inst[0]) );
  INVX1 U18 ( .A(n17), .Y(n66) );
  OAI21X1 U19 ( .A(n18), .B(n19), .C(n20), .Y(n69) );
  NAND3X1 U20 ( .A(n21), .B(n22), .C(data_ready_0), .Y(n20) );
  OAI21X1 U21 ( .A(CS[2]), .B(n23), .C(n19), .Y(n21) );
  INVX1 U22 ( .A(n24), .Y(n19) );
  OAI21X1 U23 ( .A(n25), .B(n26), .C(n27), .Y(n24) );
  NOR2X1 U24 ( .A(n70), .B(n18), .Y(n27) );
  AND2X1 U25 ( .A(n28), .B(n29), .Y(n70) );
  OAI21X1 U26 ( .A(n30), .B(n31), .C(n32), .Y(n28) );
  NAND3X1 U27 ( .A(CS[3]), .B(CS[0]), .C(n33), .Y(n32) );
  NOR2X1 U28 ( .A(CS[2]), .B(CS[1]), .Y(n33) );
  OAI21X1 U29 ( .A(n34), .B(n35), .C(data_ready_0), .Y(n26) );
  NAND2X1 U30 ( .A(n22), .B(n29), .Y(n25) );
  INVX1 U31 ( .A(data_ready_1), .Y(n22) );
  OR2X1 U32 ( .A(n36), .B(n37), .Y(n68) );
  OAI21X1 U33 ( .A(n38), .B(n39), .C(n40), .Y(n37) );
  NAND3X1 U34 ( .A(n15), .B(n41), .C(n42), .Y(n40) );
  NOR2X1 U35 ( .A(n43), .B(n44), .Y(n42) );
  INVX1 U36 ( .A(data_out[2]), .Y(n44) );
  OAI21X1 U37 ( .A(n45), .B(n34), .C(n29), .Y(n39) );
  INVX1 U38 ( .A(n23), .Y(n34) );
  NAND3X1 U39 ( .A(n46), .B(n47), .C(n48), .Y(n23) );
  INVX1 U40 ( .A(n49), .Y(n45) );
  OR2X1 U41 ( .A(n36), .B(n50), .Y(n67) );
  OAI21X1 U42 ( .A(n51), .B(n52), .C(n53), .Y(n50) );
  INVX1 U43 ( .A(n18), .Y(n53) );
  NOR2X1 U44 ( .A(n54), .B(CS[0]), .Y(n18) );
  NAND3X1 U45 ( .A(n55), .B(n38), .C(n56), .Y(n52) );
  NOR2X1 U46 ( .A(n16), .B(n49), .Y(n56) );
  NAND3X1 U47 ( .A(n46), .B(n47), .C(CS[0]), .Y(n49) );
  INVX1 U48 ( .A(CS[1]), .Y(n46) );
  INVX1 U49 ( .A(data_out[7]), .Y(n16) );
  NOR2X1 U50 ( .A(data_out[1]), .B(data_out[0]), .Y(n55) );
  NAND3X1 U51 ( .A(n57), .B(n14), .C(n58), .Y(n51) );
  NOR2X1 U52 ( .A(data_out[3]), .B(data_out[2]), .Y(n58) );
  INVX1 U53 ( .A(data_out[4]), .Y(n14) );
  NOR2X1 U54 ( .A(data_out[6]), .B(data_out[5]), .Y(n57) );
  OAI21X1 U55 ( .A(n59), .B(n60), .C(n61), .Y(n36) );
  NAND3X1 U56 ( .A(n29), .B(n31), .C(n62), .Y(n61) );
  INVX1 U57 ( .A(n30), .Y(n62) );
  NOR2X1 U58 ( .A(\nxt_data[1] ), .B(n35), .Y(n30) );
  NOR2X1 U59 ( .A(n17), .B(CS[0]), .Y(n35) );
  NOR2X1 U60 ( .A(n17), .B(n48), .Y(\nxt_data[1] ) );
  NAND3X1 U61 ( .A(CS[1]), .B(n47), .C(CS[2]), .Y(n17) );
  INVX1 U62 ( .A(halt), .Y(n31) );
  INVX1 U63 ( .A(eopOut), .Y(n29) );
  OR2X1 U64 ( .A(n43), .B(data_out[2]), .Y(n60) );
  NAND3X1 U65 ( .A(data_out[7]), .B(n63), .C(n64), .Y(n43) );
  NOR2X1 U66 ( .A(data_out[3]), .B(n65), .Y(n64) );
  XNOR2X1 U67 ( .A(data_out[0]), .B(data_out[4]), .Y(n65) );
  XOR2X1 U68 ( .A(data_out[5]), .B(data_out[1]), .Y(n63) );
  INVX1 U69 ( .A(nxt_inst[1]), .Y(n59) );
  NOR2X1 U70 ( .A(n41), .B(n13), .Y(nxt_inst[1]) );
  INVX1 U71 ( .A(n15), .Y(n13) );
  NOR2X1 U72 ( .A(n48), .B(n54), .Y(n15) );
  NAND3X1 U73 ( .A(n38), .B(n47), .C(CS[1]), .Y(n54) );
  INVX1 U74 ( .A(CS[3]), .Y(n47) );
  INVX1 U75 ( .A(CS[2]), .Y(n38) );
  INVX1 U76 ( .A(CS[0]), .Y(n48) );
  INVX1 U77 ( .A(data_out[6]), .Y(n41) );
endmodule


module computerInterceptor ( usbClk, rst, computerDataPlus, computerDataMinus, 
        computerLock, clk, eop, computerDataPlusOutput, 
        computerDataMinusOutput );
  input usbClk, rst, computerDataPlus, computerDataMinus, computerLock, clk,
         eop;
  output computerDataPlusOutput, computerDataMinusOutput;
  wire   computerDataPlusSync, computerDataMinusSync, usbInt2, usbInt1,
         eopInt1, eopInt2, n24, n25, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19;

  DFFSR computerDataPlusSync_reg ( .D(computerDataPlus), .CLK(clk), .R(1'b1), 
        .S(rst), .Q(computerDataPlusSync) );
  DFFSR computerDataMinusSync_reg ( .D(computerDataMinus), .CLK(clk), .R(rst), 
        .S(1'b1), .Q(computerDataMinusSync) );
  DFFSR usbInt1_reg ( .D(usbClk), .CLK(clk), .R(1'b1), .S(rst), .Q(usbInt1) );
  DFFSR usbInt2_reg ( .D(usbInt1), .CLK(clk), .R(rst), .S(1'b1), .Q(usbInt2)
         );
  DFFSR eopInt1_reg ( .D(eop), .CLK(clk), .R(rst), .S(1'b1), .Q(eopInt1) );
  DFFSR eopInt2_reg ( .D(eopInt1), .CLK(clk), .R(rst), .S(1'b1), .Q(eopInt2)
         );
  DFFSR computerDataPlusOutput_reg ( .D(n25), .CLK(clk), .R(1'b1), .S(rst), 
        .Q(computerDataPlusOutput) );
  DFFSR computerDataMinusOutput_reg ( .D(n24), .CLK(clk), .R(rst), .S(1'b1), 
        .Q(computerDataMinusOutput) );
  INVX1 U11 ( .A(n9), .Y(n25) );
  MUX2X1 U12 ( .B(computerDataPlusOutput), .A(n10), .S(n11), .Y(n9) );
  NAND2X1 U13 ( .A(n12), .B(computerLock), .Y(n10) );
  AOI21X1 U14 ( .A(computerDataPlusSync), .B(n13), .C(n14), .Y(n12) );
  INVX1 U15 ( .A(eop), .Y(n13) );
  MUX2X1 U16 ( .B(n15), .A(n16), .S(n11), .Y(n24) );
  OAI21X1 U17 ( .A(usbInt2), .B(n17), .C(n18), .Y(n11) );
  INVX1 U18 ( .A(usbInt1), .Y(n17) );
  NAND3X1 U19 ( .A(computerDataMinusSync), .B(computerLock), .C(n18), .Y(n16)
         );
  NOR2X1 U20 ( .A(eop), .B(n14), .Y(n18) );
  NOR2X1 U21 ( .A(n19), .B(eopInt1), .Y(n14) );
  INVX1 U22 ( .A(eopInt2), .Y(n19) );
  INVX1 U23 ( .A(computerDataMinusOutput), .Y(n15) );
endmodule


module lockingDetector ( endOfPacket, rst, clk, inst, usbLock, computerLock );
  input [3:0] inst;
  input endOfPacket, rst, clk;
  output usbLock, computerLock;
  wire   lockc, locku, eopIn1, eopIn2, eopFound, n46, n49, n50, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34;
  wire   [2:0] state;
  wire   [2:0] nextState;

  DFFSR eopIn1_reg ( .D(endOfPacket), .CLK(clk), .R(rst), .S(1'b1), .Q(eopIn1)
         );
  DFFSR eopIn2_reg ( .D(eopIn1), .CLK(clk), .R(rst), .S(1'b1), .Q(eopIn2) );
  DFFPOSX1 eopFound_reg ( .D(n46), .CLK(clk), .Q(eopFound) );
  DFFSR \state_reg[2]  ( .D(nextState[2]), .CLK(clk), .R(rst), .S(1'b1), .Q(
        state[2]) );
  DFFSR \state_reg[1]  ( .D(nextState[1]), .CLK(clk), .R(rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[0]  ( .D(nextState[0]), .CLK(clk), .R(rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR locku_reg ( .D(n49), .CLK(clk), .R(rst), .S(1'b1), .Q(locku) );
  DFFSR usbLock_reg ( .D(locku), .CLK(clk), .R(rst), .S(1'b1), .Q(usbLock) );
  DFFSR lockc_reg ( .D(n50), .CLK(clk), .R(1'b1), .S(rst), .Q(lockc) );
  DFFSR computerLock_reg ( .D(lockc), .CLK(clk), .R(1'b1), .S(rst), .Q(
        computerLock) );
  OAI21X1 U3 ( .A(n19), .B(n9), .C(n15), .Y(nextState[0]) );
  OAI21X1 U4 ( .A(n1), .B(n2), .C(n3), .Y(nextState[2]) );
  OAI21X1 U5 ( .A(n4), .B(n5), .C(n6), .Y(n3) );
  NOR2X1 U6 ( .A(state[1]), .B(state[0]), .Y(n6) );
  OR2X1 U7 ( .A(inst[1]), .B(inst[2]), .Y(n5) );
  XNOR2X1 U8 ( .A(inst[3]), .B(n7), .Y(n4) );
  NOR2X1 U9 ( .A(n8), .B(n9), .Y(n1) );
  OAI21X1 U10 ( .A(eopFound), .B(n10), .C(n11), .Y(nextState[1]) );
  OAI21X1 U11 ( .A(n12), .B(state[1]), .C(n9), .Y(n11) );
  AOI21X1 U12 ( .A(n13), .B(n14), .C(state[2]), .Y(n12) );
  INVX1 U13 ( .A(inst[1]), .Y(n14) );
  MUX2X1 U14 ( .B(inst[3]), .A(n7), .S(inst[2]), .Y(n13) );
  INVX1 U15 ( .A(inst[0]), .Y(n7) );
  INVX1 U16 ( .A(n16), .Y(n10) );
  MUX2X1 U17 ( .B(n17), .A(n18), .S(n8), .Y(n15) );
  NAND2X1 U18 ( .A(n2), .B(n19), .Y(n17) );
  INVX1 U19 ( .A(n20), .Y(n50) );
  MUX2X1 U20 ( .B(n21), .A(lockc), .S(n22), .Y(n20) );
  OAI21X1 U21 ( .A(state[1]), .B(state[0]), .C(n23), .Y(n21) );
  OAI21X1 U22 ( .A(n2), .B(n24), .C(n16), .Y(n23) );
  INVX1 U23 ( .A(lockc), .Y(n24) );
  MUX2X1 U24 ( .B(n25), .A(n26), .S(n22), .Y(n49) );
  OAI21X1 U25 ( .A(eopFound), .B(n27), .C(n28), .Y(n22) );
  MUX2X1 U26 ( .B(n29), .A(n18), .S(n2), .Y(n28) );
  AOI21X1 U27 ( .A(eopFound), .B(n19), .C(state[0]), .Y(n29) );
  NOR2X1 U28 ( .A(n16), .B(n30), .Y(n27) );
  INVX1 U29 ( .A(locku), .Y(n26) );
  AOI21X1 U30 ( .A(n31), .B(n16), .C(n30), .Y(n25) );
  OAI21X1 U31 ( .A(state[0]), .B(n19), .C(n32), .Y(n30) );
  INVX1 U32 ( .A(n18), .Y(n32) );
  NOR2X1 U33 ( .A(n9), .B(state[1]), .Y(n18) );
  NOR2X1 U34 ( .A(n19), .B(n9), .Y(n16) );
  INVX1 U35 ( .A(state[0]), .Y(n9) );
  INVX1 U36 ( .A(state[1]), .Y(n19) );
  NOR2X1 U37 ( .A(locku), .B(n2), .Y(n31) );
  INVX1 U38 ( .A(state[2]), .Y(n2) );
  MUX2X1 U39 ( .B(n8), .A(n33), .S(rst), .Y(n46) );
  NAND2X1 U40 ( .A(eopIn2), .B(n34), .Y(n33) );
  INVX1 U41 ( .A(eopIn1), .Y(n34) );
  INVX1 U42 ( .A(eopFound), .Y(n8) );
endmodule


module tristate_3 ( lock, interceptorOutput, interceptorInput, dataLine );
  input lock, interceptorOutput;
  output interceptorInput;
  inout dataLine;
  wire   N1, n1;
  tri   dataLine;
  assign interceptorInput = N1;

  TBUFX1 dataLine_tri ( .A(n1), .EN(lock), .Y(dataLine) );
  INVX1 U1 ( .A(interceptorOutput), .Y(n1) );
  OR2X1 U2 ( .A(dataLine), .B(lock), .Y(N1) );
endmodule


module tristate_2 ( lock, interceptorOutput, interceptorInput, dataLine );
  input lock, interceptorOutput;
  output interceptorInput;
  inout dataLine;
  wire   N1, n1;
  tri   dataLine;
  assign interceptorInput = N1;

  TBUFX1 dataLine_tri ( .A(n1), .EN(lock), .Y(dataLine) );
  INVX1 U1 ( .A(interceptorOutput), .Y(n1) );
  OR2X1 U2 ( .A(dataLine), .B(lock), .Y(N1) );
endmodule


module tristate_1 ( lock, interceptorOutput, interceptorInput, dataLine );
  input lock, interceptorOutput;
  output interceptorInput;
  inout dataLine;
  wire   N1, n1;
  tri   dataLine;
  assign interceptorInput = N1;

  TBUFX1 dataLine_tri ( .A(n1), .EN(lock), .Y(dataLine) );
  INVX1 U1 ( .A(interceptorOutput), .Y(n1) );
  OR2X1 U2 ( .A(dataLine), .B(lock), .Y(N1) );
endmodule


module tristate_0 ( lock, interceptorOutput, interceptorInput, dataLine );
  input lock, interceptorOutput;
  output interceptorInput;
  inout dataLine;
  wire   N1, n1;
  tri   dataLine;
  assign interceptorInput = N1;

  TBUFX1 dataLine_tri ( .A(n1), .EN(lock), .Y(dataLine) );
  INVX1 U1 ( .A(interceptorOutput), .Y(n1) );
  OR2X1 U2 ( .A(dataLine), .B(lock), .Y(N1) );
endmodule


module usbInterceptor ( usbClk, rst, intercept, usbDataPlus, usbDataMinus, 
        usbLock, clk, eop, usbDataPlusOutput, usbDataMinusOutput );
  input usbClk, rst, intercept, usbDataPlus, usbDataMinus, usbLock, clk, eop;
  output usbDataPlusOutput, usbDataMinusOutput;
  wire   usbDataPlusSync, usbDataMinusSync, usbDataPlusSync2,
         usbDataMinusSync2, usbInt2, usbInt1, n126, n128, n131, n133, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n155, \r118/carry[4] ,
         \r118/carry[3] , \r118/carry[2] , \r118/SUM[1] , \r118/SUM[2] ,
         \r118/SUM[3] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120;
  wire   [3:0] state;
  wire   [4:0] cntr;

  DFFSR usbInt1_reg ( .D(usbClk), .CLK(clk), .R(rst), .S(1'b1), .Q(usbInt1) );
  DFFSR usbInt2_reg ( .D(usbInt1), .CLK(clk), .R(rst), .S(1'b1), .Q(usbInt2)
         );
  DFFSR \cntr_reg[0]  ( .D(n147), .CLK(clk), .R(rst), .S(1'b1), .Q(cntr[0]) );
  DFFSR \cntr_reg[4]  ( .D(n155), .CLK(clk), .R(rst), .S(1'b1), .Q(cntr[4]) );
  DFFSR \state_reg[1]  ( .D(n151), .CLK(clk), .R(rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[0]  ( .D(n153), .CLK(clk), .R(rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \cntr_reg[1]  ( .D(n148), .CLK(clk), .R(rst), .S(1'b1), .Q(cntr[1]) );
  DFFSR \cntr_reg[2]  ( .D(n149), .CLK(clk), .R(rst), .S(1'b1), .Q(cntr[2]) );
  DFFSR \cntr_reg[3]  ( .D(n150), .CLK(clk), .R(rst), .S(1'b1), .Q(cntr[3]) );
  DFFSR \state_reg[3]  ( .D(n120), .CLK(clk), .R(rst), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n152), .CLK(clk), .R(rst), .S(1'b1), .Q(state[2])
         );
  DFFSR usbDataMinusSync_reg ( .D(n133), .CLK(clk), .R(rst), .S(1'b1), .Q(
        usbDataMinusSync) );
  DFFSR usbDataMinusSync2_reg ( .D(n131), .CLK(clk), .R(rst), .S(1'b1), .Q(
        usbDataMinusSync2) );
  DFFSR usbDataMinusOutputReg_reg ( .D(n145), .CLK(clk), .R(rst), .S(1'b1), 
        .Q(usbDataMinusOutput) );
  DFFSR usbDataPlusSync_reg ( .D(n128), .CLK(clk), .R(1'b1), .S(rst), .Q(
        usbDataPlusSync) );
  DFFSR usbDataPlusSync2_reg ( .D(n126), .CLK(clk), .R(1'b1), .S(rst), .Q(
        usbDataPlusSync2) );
  DFFSR usbDataPlusOutputReg_reg ( .D(n146), .CLK(clk), .R(1'b1), .S(rst), .Q(
        usbDataPlusOutput) );
  HAX1 \r118/U1_1_1  ( .A(cntr[1]), .B(cntr[0]), .YC(\r118/carry[2] ), .YS(
        \r118/SUM[1] ) );
  HAX1 \r118/U1_1_2  ( .A(cntr[2]), .B(\r118/carry[2] ), .YC(\r118/carry[3] ), 
        .YS(\r118/SUM[2] ) );
  HAX1 \r118/U1_1_3  ( .A(cntr[3]), .B(\r118/carry[3] ), .YC(\r118/carry[4] ), 
        .YS(\r118/SUM[3] ) );
  OAI21X1 U3 ( .A(n78), .B(n35), .C(n56), .Y(n51) );
  AOI22X1 U4 ( .A(n47), .B(cntr[3]), .C(\r118/SUM[3] ), .D(n11), .Y(n1) );
  INVX2 U5 ( .A(n1), .Y(n150) );
  OAI22X1 U6 ( .A(n2), .B(n3), .C(n4), .D(n5), .Y(n120) );
  INVX1 U7 ( .A(state[3]), .Y(n5) );
  MUX2X1 U8 ( .B(n6), .A(n7), .S(cntr[4]), .Y(n155) );
  INVX1 U9 ( .A(n8), .Y(n7) );
  OAI21X1 U10 ( .A(n9), .B(\r118/carry[4] ), .C(n10), .Y(n8) );
  NAND2X1 U11 ( .A(\r118/carry[4] ), .B(n11), .Y(n6) );
  OAI22X1 U12 ( .A(n4), .B(n12), .C(n13), .D(n3), .Y(n153) );
  INVX1 U13 ( .A(n14), .Y(n13) );
  OAI21X1 U14 ( .A(n4), .B(n15), .C(n16), .Y(n152) );
  OAI21X1 U15 ( .A(n17), .B(n18), .C(n19), .Y(n16) );
  NAND2X1 U16 ( .A(n20), .B(n21), .Y(n18) );
  AND2X1 U17 ( .A(n19), .B(n22), .Y(n4) );
  MUX2X1 U18 ( .B(n23), .A(n24), .S(n19), .Y(n151) );
  INVX1 U19 ( .A(n3), .Y(n19) );
  NAND3X1 U20 ( .A(n25), .B(n26), .C(n27), .Y(n3) );
  AOI21X1 U21 ( .A(n28), .B(n29), .C(n30), .Y(n27) );
  NOR2X1 U22 ( .A(intercept), .B(n31), .Y(n30) );
  INVX1 U23 ( .A(n32), .Y(n26) );
  NOR2X1 U24 ( .A(n33), .B(n34), .Y(n24) );
  OAI21X1 U25 ( .A(n35), .B(n36), .C(n37), .Y(n34) );
  NAND3X1 U26 ( .A(state[2]), .B(n23), .C(n38), .Y(n37) );
  OR2X1 U27 ( .A(n39), .B(n40), .Y(n36) );
  NAND2X1 U28 ( .A(n41), .B(n42), .Y(n33) );
  OAI21X1 U29 ( .A(n10), .B(n43), .C(n44), .Y(n149) );
  NAND2X1 U30 ( .A(\r118/SUM[2] ), .B(n11), .Y(n44) );
  OAI21X1 U31 ( .A(n10), .B(n45), .C(n46), .Y(n148) );
  NAND2X1 U32 ( .A(\r118/SUM[1] ), .B(n11), .Y(n46) );
  INVX1 U33 ( .A(n9), .Y(n11) );
  MUX2X1 U34 ( .B(n9), .A(n10), .S(cntr[0]), .Y(n147) );
  INVX1 U35 ( .A(n47), .Y(n10) );
  OAI21X1 U36 ( .A(n48), .B(n22), .C(n49), .Y(n47) );
  OAI21X1 U37 ( .A(n40), .B(n39), .C(n50), .Y(n22) );
  INVX1 U38 ( .A(cntr[4]), .Y(n39) );
  OAI21X1 U39 ( .A(n32), .B(n51), .C(n49), .Y(n9) );
  INVX1 U40 ( .A(n52), .Y(n49) );
  OAI21X1 U41 ( .A(n53), .B(n48), .C(n25), .Y(n52) );
  MUX2X1 U42 ( .B(n54), .A(n28), .S(eop), .Y(n25) );
  OAI21X1 U43 ( .A(n57), .B(n2), .C(n53), .Y(n32) );
  AND2X1 U44 ( .A(n58), .B(n59), .Y(n53) );
  NAND2X1 U45 ( .A(n60), .B(n61), .Y(n146) );
  OAI21X1 U46 ( .A(n62), .B(n63), .C(n64), .Y(n61) );
  INVX1 U47 ( .A(n65), .Y(n64) );
  OAI22X1 U48 ( .A(n56), .B(n66), .C(usbLock), .D(n67), .Y(n63) );
  OAI21X1 U49 ( .A(n68), .B(n69), .C(n70), .Y(n62) );
  OAI21X1 U50 ( .A(n71), .B(n72), .C(n73), .Y(n70) );
  INVX1 U51 ( .A(usbDataPlusOutput), .Y(n73) );
  NOR2X1 U52 ( .A(n74), .B(n75), .Y(n71) );
  INVX1 U53 ( .A(n76), .Y(n74) );
  OAI21X1 U54 ( .A(n65), .B(n77), .C(usbDataPlusOutput), .Y(n60) );
  OAI22X1 U55 ( .A(eop), .B(n67), .C(n76), .D(n75), .Y(n77) );
  OAI22X1 U56 ( .A(n78), .B(n59), .C(n76), .D(n55), .Y(n65) );
  XOR2X1 U57 ( .A(usbDataPlusSync2), .B(usbDataPlusSync), .Y(n76) );
  OAI21X1 U58 ( .A(n79), .B(n80), .C(n81), .Y(n145) );
  OAI21X1 U59 ( .A(n80), .B(n82), .C(usbDataMinusOutput), .Y(n81) );
  OAI21X1 U60 ( .A(n75), .B(n83), .C(n84), .Y(n82) );
  NAND3X1 U61 ( .A(n85), .B(n86), .C(usbLock), .Y(n84) );
  INVX1 U62 ( .A(n67), .Y(n85) );
  NOR2X1 U63 ( .A(n87), .B(n88), .Y(n67) );
  OAI21X1 U64 ( .A(usbLock), .B(n31), .C(n89), .Y(n88) );
  AOI22X1 U65 ( .A(n90), .B(n17), .C(n57), .D(n91), .Y(n89) );
  INVX1 U66 ( .A(n92), .Y(n90) );
  NAND3X1 U67 ( .A(n93), .B(n21), .C(n94), .Y(n87) );
  AOI22X1 U68 ( .A(n54), .B(n95), .C(n96), .D(n97), .Y(n94) );
  INVX1 U69 ( .A(n41), .Y(n97) );
  INVX1 U70 ( .A(n2), .Y(n54) );
  OAI21X1 U71 ( .A(n50), .B(n14), .C(n78), .Y(n93) );
  NAND3X1 U72 ( .A(n31), .B(n41), .C(n98), .Y(n14) );
  NOR2X1 U73 ( .A(n91), .B(n17), .Y(n98) );
  OAI22X1 U74 ( .A(n78), .B(n59), .C(n55), .D(n83), .Y(n80) );
  OAI21X1 U75 ( .A(cntr[4]), .B(n40), .C(n99), .Y(n59) );
  INVX1 U76 ( .A(n21), .Y(n99) );
  NAND2X1 U77 ( .A(n38), .B(n100), .Y(n21) );
  XOR2X1 U78 ( .A(state[2]), .B(state[1]), .Y(n100) );
  NAND3X1 U79 ( .A(cntr[0]), .B(n45), .C(n101), .Y(n40) );
  NOR2X1 U80 ( .A(cntr[3]), .B(cntr[2]), .Y(n101) );
  AOI21X1 U81 ( .A(usbDataMinus), .B(n28), .C(n102), .Y(n79) );
  OAI21X1 U82 ( .A(n69), .B(n103), .C(n104), .Y(n102) );
  OAI21X1 U83 ( .A(n105), .B(n72), .C(n106), .Y(n104) );
  INVX1 U84 ( .A(usbDataMinusOutput), .Y(n106) );
  OAI21X1 U85 ( .A(n58), .B(n78), .C(n55), .Y(n72) );
  NAND2X1 U86 ( .A(n48), .B(n50), .Y(n55) );
  INVX1 U87 ( .A(n35), .Y(n50) );
  NAND2X1 U88 ( .A(n107), .B(n38), .Y(n35) );
  INVX1 U89 ( .A(n108), .Y(n58) );
  OAI21X1 U90 ( .A(n96), .B(n41), .C(n109), .Y(n108) );
  AOI22X1 U91 ( .A(n17), .B(n92), .C(n91), .D(n29), .Y(n109) );
  INVX1 U92 ( .A(n57), .Y(n29) );
  NOR2X1 U93 ( .A(n110), .B(cntr[2]), .Y(n57) );
  INVX1 U94 ( .A(n20), .Y(n91) );
  NAND3X1 U95 ( .A(n111), .B(n23), .C(state[2]), .Y(n20) );
  INVX1 U96 ( .A(state[1]), .Y(n23) );
  NAND3X1 U97 ( .A(n112), .B(n45), .C(n113), .Y(n92) );
  NOR2X1 U98 ( .A(cntr[0]), .B(n43), .Y(n113) );
  INVX1 U99 ( .A(cntr[1]), .Y(n45) );
  INVX1 U100 ( .A(n42), .Y(n17) );
  NAND3X1 U101 ( .A(state[1]), .B(n111), .C(state[2]), .Y(n42) );
  NAND3X1 U102 ( .A(n111), .B(n15), .C(state[1]), .Y(n41) );
  INVX1 U103 ( .A(state[2]), .Y(n15) );
  NOR2X1 U104 ( .A(n110), .B(n43), .Y(n96) );
  INVX1 U105 ( .A(cntr[2]), .Y(n43) );
  NAND3X1 U106 ( .A(cntr[1]), .B(cntr[0]), .C(n112), .Y(n110) );
  NOR2X1 U107 ( .A(cntr[4]), .B(cntr[3]), .Y(n112) );
  NOR2X1 U108 ( .A(n114), .B(n75), .Y(n105) );
  OR2X1 U109 ( .A(n95), .B(n2), .Y(n75) );
  NAND3X1 U110 ( .A(state[2]), .B(state[1]), .C(n38), .Y(n2) );
  NOR2X1 U111 ( .A(n12), .B(state[3]), .Y(n38) );
  NAND2X1 U112 ( .A(n48), .B(n86), .Y(n95) );
  INVX1 U113 ( .A(eop), .Y(n86) );
  INVX1 U114 ( .A(n83), .Y(n114) );
  XOR2X1 U115 ( .A(usbDataMinusSync2), .B(usbDataMinusSync), .Y(n83) );
  INVX1 U116 ( .A(usbDataMinusSync), .Y(n103) );
  NAND3X1 U117 ( .A(n48), .B(n115), .C(usbLock), .Y(n69) );
  INVX1 U118 ( .A(n31), .Y(n115) );
  NAND2X1 U119 ( .A(n107), .B(n111), .Y(n31) );
  NOR2X1 U120 ( .A(state[3]), .B(state[0]), .Y(n111) );
  INVX1 U121 ( .A(n56), .Y(n28) );
  NAND3X1 U122 ( .A(n107), .B(n12), .C(state[3]), .Y(n56) );
  INVX1 U123 ( .A(state[0]), .Y(n12) );
  NOR2X1 U124 ( .A(state[2]), .B(state[1]), .Y(n107) );
  INVX1 U125 ( .A(n116), .Y(n133) );
  MUX2X1 U126 ( .B(usbDataMinusSync), .A(usbDataMinus), .S(n48), .Y(n116) );
  INVX1 U127 ( .A(n117), .Y(n131) );
  MUX2X1 U128 ( .B(usbDataMinusSync2), .A(usbDataMinusSync), .S(n48), .Y(n117)
         );
  MUX2X1 U129 ( .B(n68), .A(n66), .S(n48), .Y(n128) );
  INVX1 U130 ( .A(usbDataPlus), .Y(n66) );
  INVX1 U131 ( .A(usbDataPlusSync), .Y(n68) );
  INVX1 U132 ( .A(n118), .Y(n126) );
  MUX2X1 U133 ( .B(usbDataPlusSync2), .A(usbDataPlusSync), .S(n48), .Y(n118)
         );
  INVX1 U134 ( .A(n78), .Y(n48) );
  NAND2X1 U135 ( .A(usbInt1), .B(n119), .Y(n78) );
  INVX1 U153 ( .A(usbInt2), .Y(n119) );
endmodule


module interceptor ( clk, eop, intercept, inst, rst, usbclk, dataPlus, 
        dataMinus, computerMinus, computerPlus, usbMinus, usbPlus );
  input [3:0] inst;
  input clk, eop, intercept, rst, usbclk;
  output dataPlus, dataMinus;
  inout computerMinus,  computerPlus,  usbMinus,  usbPlus;
  wire   computerDataMinus, computerDataPlus, computerLock,
         computerDataMinusOutput, computerDataPlusOutput, usbLock,
         usbDataMinus, usbDataPlusOutput, usbDataPlus, usbDataMinusOutput, n1,
         n2, n3, n4, n5;
  tri   computerMinus;
  tri   computerPlus;
  tri   usbMinus;
  tri   usbPlus;

  computerInterceptor U_0 ( .usbClk(usbclk), .rst(rst), .computerDataPlus(
        computerDataPlus), .computerDataMinus(computerDataMinus), 
        .computerLock(computerLock), .clk(clk), .eop(eop), 
        .computerDataPlusOutput(computerDataPlusOutput), 
        .computerDataMinusOutput(computerDataMinusOutput) );
  lockingDetector U_1 ( .endOfPacket(eop), .rst(rst), .clk(clk), .inst(inst), 
        .usbLock(usbLock), .computerLock(computerLock) );
  tristate_3 U_2 ( .lock(computerLock), .interceptorOutput(
        computerDataMinusOutput), .interceptorInput(usbDataMinus), .dataLine(
        usbMinus) );
  tristate_2 U_3 ( .lock(usbLock), .interceptorOutput(usbDataPlusOutput), 
        .interceptorInput(computerDataPlus), .dataLine(computerPlus) );
  tristate_1 U_5 ( .lock(computerLock), .interceptorOutput(
        computerDataPlusOutput), .interceptorInput(usbDataPlus), .dataLine(
        usbPlus) );
  tristate_0 U_6 ( .lock(usbLock), .interceptorOutput(usbDataMinusOutput), 
        .interceptorInput(computerDataMinus), .dataLine(computerMinus) );
  usbInterceptor U_4 ( .usbClk(usbclk), .rst(rst), .intercept(intercept), 
        .usbDataPlus(usbDataPlus), .usbDataMinus(usbDataMinus), .usbLock(
        usbLock), .clk(clk), .eop(eop), .usbDataPlusOutput(usbDataPlusOutput), 
        .usbDataMinusOutput(usbDataMinusOutput) );
  MUX2X1 U2 ( .B(n1), .A(n2), .S(usbLock), .Y(dataPlus) );
  INVX1 U3 ( .A(usbPlus), .Y(n2) );
  NOR2X1 U4 ( .A(computerPlus), .B(n3), .Y(n1) );
  MUX2X1 U5 ( .B(n4), .A(n5), .S(usbLock), .Y(dataMinus) );
  INVX1 U6 ( .A(usbMinus), .Y(n5) );
  NOR2X1 U7 ( .A(computerMinus), .B(n3), .Y(n4) );
  INVX1 U8 ( .A(computerLock), .Y(n3) );
endmodule


module sd_control_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module sd_control ( clk, rst, sd_clock, fifo_empty, data_in, data_out, 
        clk_mode, tsr_load, sd_enable, clk_enable, data_read );
  input [7:0] data_in;
  output [7:0] data_out;
  input clk, rst, sd_clock, fifo_empty;
  output clk_mode, tsr_load, sd_enable, clk_enable, data_read;
  wire   sd_clock1, sd_clock2, sdc, N77, N588, N589, N590, n2, n3, n4, n5, n6,
         n7, n8, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         \r362/carry[4] , \r362/carry[3] , \r362/carry[2] , n1, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216;
  wire   [3:0] sd;
  wire   [6:0] count1;
  wire   [4:0] count2;
  wire   [2:0] count3;
  wire   [3:0] nextSd;
  wire   [4:0] nextCount2;

  DFFSR sd_clock1_reg ( .D(sd_clock), .CLK(clk), .R(rst), .S(1'b1), .Q(
        sd_clock1) );
  DFFSR sd_clock2_reg ( .D(sd_clock1), .CLK(clk), .R(rst), .S(1'b1), .Q(
        sd_clock2) );
  DFFSR sdc_reg ( .D(N77), .CLK(clk), .R(rst), .S(1'b1), .Q(sdc) );
  DFFSR \sd_reg[0]  ( .D(nextSd[0]), .CLK(clk), .R(rst), .S(1'b1), .Q(sd[0])
         );
  DFFSR \sd_reg[2]  ( .D(nextSd[2]), .CLK(clk), .R(rst), .S(1'b1), .Q(sd[2])
         );
  DFFSR \sd_reg[1]  ( .D(nextSd[1]), .CLK(clk), .R(rst), .S(1'b1), .Q(sd[1])
         );
  DFFSR \sd_reg[3]  ( .D(nextSd[3]), .CLK(clk), .R(rst), .S(1'b1), .Q(sd[3])
         );
  DFFSR \count1_reg[3]  ( .D(n318), .CLK(clk), .R(rst), .S(1'b1), .Q(count1[3]) );
  DFFSR \count1_reg[6]  ( .D(n322), .CLK(clk), .R(rst), .S(1'b1), .Q(count1[6]) );
  DFFSR \count1_reg[0]  ( .D(n315), .CLK(clk), .R(rst), .S(1'b1), .Q(count1[0]) );
  DFFSR \count1_reg[1]  ( .D(n316), .CLK(clk), .R(rst), .S(1'b1), .Q(count1[1]) );
  DFFSR \count1_reg[2]  ( .D(n317), .CLK(clk), .R(rst), .S(1'b1), .Q(count1[2]) );
  DFFSR \count1_reg[4]  ( .D(n319), .CLK(clk), .R(rst), .S(1'b1), .Q(count1[4]) );
  DFFSR \count1_reg[5]  ( .D(n320), .CLK(clk), .R(rst), .S(1'b1), .Q(count1[5]) );
  DFFSR \count3_reg[0]  ( .D(n313), .CLK(clk), .R(rst), .S(1'b1), .Q(count3[0]) );
  DFFSR \count3_reg[1]  ( .D(n314), .CLK(clk), .R(rst), .S(1'b1), .Q(count3[1]) );
  DFFSR \count3_reg[2]  ( .D(n321), .CLK(clk), .R(rst), .S(1'b1), .Q(count3[2]) );
  DFFSR \count2_reg[0]  ( .D(nextCount2[0]), .CLK(clk), .R(rst), .S(1'b1), .Q(
        count2[0]) );
  DFFSR \count2_reg[4]  ( .D(nextCount2[4]), .CLK(clk), .R(rst), .S(1'b1), .Q(
        count2[4]) );
  DFFSR \count2_reg[3]  ( .D(nextCount2[3]), .CLK(clk), .R(rst), .S(1'b1), .Q(
        count2[3]) );
  DFFSR \count2_reg[2]  ( .D(nextCount2[2]), .CLK(clk), .R(rst), .S(1'b1), .Q(
        count2[2]) );
  DFFSR \count2_reg[1]  ( .D(nextCount2[1]), .CLK(clk), .R(rst), .S(1'b1), .Q(
        count2[1]) );
  sd_control_DW01_inc_0 r400 ( .A(count1), .SUM({n2, n3, n4, n5, n6, n7, n8})
         );
  HAX1 \r362/U1_1_1  ( .A(count2[1]), .B(count2[0]), .YC(\r362/carry[2] ), 
        .YS(N588) );
  HAX1 \r362/U1_1_2  ( .A(count2[2]), .B(\r362/carry[2] ), .YC(\r362/carry[3] ), .YS(N589) );
  HAX1 \r362/U1_1_3  ( .A(count2[3]), .B(\r362/carry[3] ), .YC(\r362/carry[4] ), .YS(N590) );
  AOI21X1 U25 ( .A(n152), .B(n52), .C(n48), .Y(n55) );
  AOI22X1 U26 ( .A(n111), .B(count2[4]), .C(\r362/carry[4] ), .D(n103), .Y(n1)
         );
  INVX2 U27 ( .A(n1), .Y(nextCount2[4]) );
  NAND3X1 U28 ( .A(n9), .B(n10), .C(n11), .Y(tsr_load) );
  AOI22X1 U29 ( .A(n12), .B(n13), .C(n14), .D(n15), .Y(n11) );
  NAND3X1 U30 ( .A(n16), .B(n17), .C(n18), .Y(n15) );
  NOR2X1 U31 ( .A(n19), .B(n20), .Y(n18) );
  OAI21X1 U32 ( .A(n21), .B(n22), .C(n23), .Y(n20) );
  NAND2X1 U33 ( .A(count3[0]), .B(n24), .Y(n22) );
  OR2X1 U34 ( .A(n25), .B(count3[1]), .Y(n21) );
  AOI22X1 U35 ( .A(n26), .B(n27), .C(n28), .D(n29), .Y(n16) );
  OAI21X1 U36 ( .A(n30), .B(n31), .C(n32), .Y(n13) );
  OAI21X1 U37 ( .A(n33), .B(n31), .C(n34), .Y(nextSd[3]) );
  AOI21X1 U38 ( .A(n28), .B(n35), .C(clk_mode), .Y(n34) );
  INVX1 U39 ( .A(n36), .Y(n33) );
  NAND3X1 U40 ( .A(n37), .B(n38), .C(n39), .Y(nextSd[2]) );
  NOR2X1 U41 ( .A(n40), .B(n19), .Y(n39) );
  NAND2X1 U42 ( .A(n41), .B(n42), .Y(n19) );
  NAND3X1 U43 ( .A(n43), .B(n44), .C(n45), .Y(n40) );
  AOI21X1 U44 ( .A(n46), .B(n47), .C(n48), .Y(n38) );
  NOR2X1 U45 ( .A(n49), .B(n50), .Y(n46) );
  INVX1 U46 ( .A(n51), .Y(n37) );
  OAI22X1 U47 ( .A(n32), .B(n52), .C(n9), .D(n53), .Y(n51) );
  NAND3X1 U48 ( .A(n54), .B(n55), .C(n56), .Y(nextSd[1]) );
  NOR2X1 U49 ( .A(n57), .B(n58), .Y(n56) );
  OAI22X1 U50 ( .A(n42), .B(n59), .C(n60), .D(n61), .Y(n58) );
  INVX1 U51 ( .A(n62), .Y(n61) );
  OAI22X1 U52 ( .A(n17), .B(n85), .C(n86), .D(n53), .Y(n57) );
  NOR2X1 U53 ( .A(n87), .B(n88), .Y(n54) );
  OR2X1 U54 ( .A(n89), .B(n90), .Y(nextSd[0]) );
  NAND3X1 U55 ( .A(n91), .B(n92), .C(n93), .Y(n90) );
  MUX2X1 U56 ( .B(n94), .A(n95), .S(n85), .Y(n93) );
  INVX1 U57 ( .A(n49), .Y(n85) );
  INVX1 U58 ( .A(n87), .Y(n92) );
  OAI21X1 U59 ( .A(sdc), .B(n9), .C(n45), .Y(n87) );
  INVX1 U60 ( .A(n96), .Y(n91) );
  MUX2X1 U61 ( .B(n10), .A(n97), .S(n53), .Y(n96) );
  NAND3X1 U62 ( .A(n98), .B(n60), .C(n99), .Y(n89) );
  AOI22X1 U63 ( .A(n100), .B(n59), .C(n24), .D(n101), .Y(n99) );
  OAI21X1 U64 ( .A(n102), .B(n104), .C(n105), .Y(nextCount2[3]) );
  NAND2X1 U65 ( .A(N590), .B(n103), .Y(n105) );
  OAI21X1 U66 ( .A(n102), .B(n106), .C(n107), .Y(nextCount2[2]) );
  NAND2X1 U67 ( .A(N589), .B(n103), .Y(n107) );
  OAI21X1 U68 ( .A(n102), .B(n108), .C(n109), .Y(nextCount2[1]) );
  NAND2X1 U69 ( .A(N588), .B(n103), .Y(n109) );
  MUX2X1 U70 ( .B(n110), .A(n102), .S(count2[0]), .Y(nextCount2[0]) );
  INVX1 U71 ( .A(n111), .Y(n102) );
  OAI21X1 U72 ( .A(n112), .B(n113), .C(n114), .Y(n111) );
  INVX1 U73 ( .A(n103), .Y(n110) );
  OAI21X1 U74 ( .A(n42), .B(n115), .C(n116), .Y(n103) );
  NAND3X1 U75 ( .A(n26), .B(n27), .C(n49), .Y(n116) );
  OAI21X1 U76 ( .A(n117), .B(n118), .C(n119), .Y(n322) );
  NAND2X1 U77 ( .A(n2), .B(n120), .Y(n119) );
  INVX1 U78 ( .A(count1[6]), .Y(n118) );
  OAI21X1 U79 ( .A(n121), .B(n25), .C(n122), .Y(n321) );
  NAND3X1 U80 ( .A(n123), .B(count3[0]), .C(count3[1]), .Y(n122) );
  INVX1 U81 ( .A(count3[2]), .Y(n25) );
  OAI21X1 U82 ( .A(n117), .B(n124), .C(n125), .Y(n320) );
  NAND2X1 U83 ( .A(n3), .B(n120), .Y(n125) );
  INVX1 U84 ( .A(count1[5]), .Y(n124) );
  OAI21X1 U85 ( .A(n117), .B(n126), .C(n127), .Y(n319) );
  NAND2X1 U86 ( .A(n4), .B(n120), .Y(n127) );
  OAI21X1 U87 ( .A(n117), .B(n128), .C(n129), .Y(n318) );
  NAND2X1 U88 ( .A(n5), .B(n120), .Y(n129) );
  OAI21X1 U89 ( .A(n117), .B(n130), .C(n131), .Y(n317) );
  NAND2X1 U90 ( .A(n6), .B(n120), .Y(n131) );
  OAI21X1 U91 ( .A(n117), .B(n132), .C(n133), .Y(n316) );
  NAND2X1 U92 ( .A(n7), .B(n120), .Y(n133) );
  OAI21X1 U93 ( .A(n117), .B(n134), .C(n135), .Y(n315) );
  NAND2X1 U94 ( .A(n8), .B(n120), .Y(n135) );
  OAI21X1 U95 ( .A(n62), .B(n60), .C(n136), .Y(n120) );
  INVX1 U96 ( .A(n137), .Y(n136) );
  AOI21X1 U97 ( .A(n44), .B(n138), .C(n112), .Y(n137) );
  NOR2X1 U98 ( .A(n139), .B(n140), .Y(n62) );
  NAND3X1 U99 ( .A(count1[3]), .B(count1[2]), .C(count1[6]), .Y(n140) );
  NAND3X1 U100 ( .A(count1[0]), .B(n132), .C(n141), .Y(n139) );
  NOR2X1 U101 ( .A(count1[5]), .B(count1[4]), .Y(n141) );
  INVX1 U102 ( .A(count1[0]), .Y(n134) );
  AND2X1 U103 ( .A(n142), .B(n97), .Y(n117) );
  NAND2X1 U104 ( .A(n143), .B(n144), .Y(n97) );
  OAI21X1 U105 ( .A(n145), .B(n146), .C(n112), .Y(n142) );
  NAND3X1 U106 ( .A(n147), .B(n148), .C(sdc), .Y(n112) );
  NAND3X1 U107 ( .A(count1[1]), .B(count1[0]), .C(count1[2]), .Y(n148) );
  OAI21X1 U108 ( .A(n149), .B(n49), .C(n114), .Y(n146) );
  AOI21X1 U109 ( .A(n100), .B(n150), .C(n151), .Y(n114) );
  AOI21X1 U110 ( .A(n26), .B(n49), .C(n55), .Y(n151) );
  NOR2X1 U111 ( .A(n36), .B(n31), .Y(n48) );
  OAI21X1 U112 ( .A(count3[1]), .B(n52), .C(n101), .Y(n36) );
  OR2X1 U113 ( .A(n52), .B(n30), .Y(n101) );
  NAND2X1 U114 ( .A(n152), .B(n52), .Y(n98) );
  NAND2X1 U115 ( .A(sdc), .B(n12), .Y(n52) );
  INVX1 U116 ( .A(n153), .Y(n12) );
  NOR2X1 U117 ( .A(n154), .B(count2[0]), .Y(n26) );
  AND2X1 U118 ( .A(n115), .B(n59), .Y(n150) );
  NAND3X1 U119 ( .A(n155), .B(n49), .C(n156), .Y(n59) );
  NOR2X1 U120 ( .A(count2[3]), .B(count2[2]), .Y(n156) );
  NAND2X1 U121 ( .A(sdc), .B(n157), .Y(n115) );
  NOR2X1 U122 ( .A(n158), .B(n159), .Y(n149) );
  OAI21X1 U123 ( .A(n160), .B(n29), .C(n161), .Y(n145) );
  MUX2X1 U124 ( .B(n162), .A(n121), .S(count3[1]), .Y(n314) );
  INVX1 U125 ( .A(n163), .Y(n121) );
  OAI21X1 U126 ( .A(count3[0]), .B(n160), .C(n164), .Y(n163) );
  NAND2X1 U127 ( .A(n123), .B(count3[0]), .Y(n162) );
  MUX2X1 U128 ( .B(n45), .A(n164), .S(count3[0]), .Y(n313) );
  AOI21X1 U129 ( .A(n35), .B(n28), .C(n24), .Y(n164) );
  INVX1 U130 ( .A(n160), .Y(n28) );
  INVX1 U131 ( .A(n123), .Y(n45) );
  NOR2X1 U132 ( .A(n35), .B(n160), .Y(n123) );
  NAND2X1 U133 ( .A(n49), .B(n29), .Y(n35) );
  NOR2X1 U134 ( .A(n53), .B(n165), .Y(n49) );
  INVX1 U135 ( .A(sdc), .Y(n53) );
  INVX1 U136 ( .A(n10), .Y(data_read) );
  NAND2X1 U137 ( .A(n166), .B(n167), .Y(data_out[7]) );
  AOI22X1 U138 ( .A(n168), .B(n165), .C(data_in[7]), .D(n158), .Y(n166) );
  NAND3X1 U139 ( .A(n169), .B(n170), .C(n171), .Y(data_out[6]) );
  NOR2X1 U140 ( .A(n172), .B(n173), .Y(n171) );
  OAI21X1 U141 ( .A(n14), .B(n43), .C(n174), .Y(n173) );
  NAND3X1 U142 ( .A(n160), .B(n9), .C(n113), .Y(n172) );
  AOI21X1 U143 ( .A(data_in[6]), .B(n158), .C(n27), .Y(n170) );
  NOR2X1 U144 ( .A(n175), .B(n94), .Y(n169) );
  NAND2X1 U145 ( .A(n176), .B(n41), .Y(n94) );
  INVX1 U146 ( .A(n88), .Y(n176) );
  OAI21X1 U147 ( .A(n177), .B(n41), .C(n23), .Y(n88) );
  NAND2X1 U148 ( .A(n178), .B(n179), .Y(data_out[5]) );
  AOI21X1 U149 ( .A(data_in[5]), .B(n158), .C(n152), .Y(n178) );
  NAND2X1 U150 ( .A(n180), .B(n181), .Y(data_out[4]) );
  AOI21X1 U151 ( .A(data_in[4]), .B(n158), .C(n182), .Y(n180) );
  NAND2X1 U152 ( .A(n183), .B(n181), .Y(data_out[3]) );
  NOR3X1 U153 ( .A(n159), .B(n152), .C(n184), .Y(n181) );
  AOI21X1 U154 ( .A(data_in[3]), .B(n158), .C(n185), .Y(n183) );
  INVX1 U155 ( .A(n174), .Y(n185) );
  NAND2X1 U156 ( .A(n186), .B(n167), .Y(data_out[2]) );
  INVX1 U157 ( .A(n187), .Y(n167) );
  NAND3X1 U158 ( .A(n32), .B(n188), .C(n189), .Y(n187) );
  AOI21X1 U159 ( .A(data_in[2]), .B(n158), .C(n168), .Y(n186) );
  INVX1 U160 ( .A(n43), .Y(n168) );
  NAND2X1 U161 ( .A(n190), .B(n179), .Y(data_out[1]) );
  INVX1 U162 ( .A(n191), .Y(n179) );
  NAND3X1 U163 ( .A(n174), .B(n43), .C(n189), .Y(n191) );
  NOR2X1 U164 ( .A(n184), .B(n192), .Y(n189) );
  OAI21X1 U165 ( .A(n14), .B(n113), .C(n193), .Y(n192) );
  NAND2X1 U166 ( .A(n194), .B(n195), .Y(n184) );
  OAI21X1 U167 ( .A(n30), .B(n153), .C(n24), .Y(n195) );
  INVX1 U168 ( .A(n31), .Y(n24) );
  INVX1 U169 ( .A(n29), .Y(n30) );
  OAI21X1 U170 ( .A(count3[1]), .B(count3[0]), .C(count3[2]), .Y(n29) );
  OAI21X1 U171 ( .A(n196), .B(n197), .C(n182), .Y(n174) );
  NAND2X1 U172 ( .A(n155), .B(n14), .Y(n197) );
  NOR3X1 U173 ( .A(count2[0]), .B(count2[4]), .C(n108), .Y(n155) );
  NAND2X1 U174 ( .A(n106), .B(n104), .Y(n196) );
  INVX1 U175 ( .A(count2[3]), .Y(n104) );
  AOI22X1 U176 ( .A(n152), .B(n153), .C(data_in[1]), .D(n158), .Y(n190) );
  NAND3X1 U177 ( .A(n198), .B(n194), .C(n199), .Y(data_out[0]) );
  AOI21X1 U178 ( .A(n152), .B(n153), .C(n200), .Y(n199) );
  NAND2X1 U179 ( .A(n31), .B(n188), .Y(n200) );
  INVX1 U180 ( .A(n182), .Y(n188) );
  NOR2X1 U181 ( .A(n42), .B(n157), .Y(n182) );
  NAND2X1 U182 ( .A(count2[0]), .B(n157), .Y(n153) );
  NOR2X1 U183 ( .A(n154), .B(n165), .Y(n157) );
  NAND3X1 U184 ( .A(n108), .B(n106), .C(n201), .Y(n154) );
  NOR2X1 U185 ( .A(count2[4]), .B(count2[3]), .Y(n201) );
  INVX1 U186 ( .A(count2[2]), .Y(n106) );
  INVX1 U187 ( .A(count2[1]), .Y(n108) );
  INVX1 U188 ( .A(n32), .Y(n152) );
  INVX1 U189 ( .A(n175), .Y(n194) );
  NAND2X1 U190 ( .A(n161), .B(n202), .Y(n175) );
  OAI21X1 U191 ( .A(fifo_empty), .B(n165), .C(n158), .Y(n161) );
  AOI21X1 U192 ( .A(data_in[0]), .B(n158), .C(n159), .Y(n198) );
  NAND3X1 U193 ( .A(n32), .B(n44), .C(n203), .Y(clk_mode) );
  NOR2X1 U194 ( .A(n47), .B(n95), .Y(n203) );
  INVX1 U195 ( .A(n23), .Y(n47) );
  OR2X1 U196 ( .A(n204), .B(n205), .Y(clk_enable) );
  OAI21X1 U197 ( .A(n14), .B(n44), .C(n138), .Y(n205) );
  NOR3X1 U198 ( .A(n159), .B(n100), .C(n27), .Y(n138) );
  NAND2X1 U199 ( .A(n32), .B(n31), .Y(n27) );
  NAND3X1 U200 ( .A(sd[1]), .B(sd[2]), .C(n144), .Y(n31) );
  NAND3X1 U201 ( .A(sd[0]), .B(sd[3]), .C(n206), .Y(n32) );
  INVX1 U202 ( .A(n42), .Y(n100) );
  NAND3X1 U203 ( .A(sd[2]), .B(n177), .C(n144), .Y(n42) );
  NAND2X1 U204 ( .A(n193), .B(n17), .Y(n159) );
  INVX1 U205 ( .A(n95), .Y(n17) );
  NAND2X1 U206 ( .A(n113), .B(n43), .Y(n95) );
  NAND3X1 U207 ( .A(sd[0]), .B(sd[3]), .C(n207), .Y(n43) );
  NOR2X1 U208 ( .A(sd[1]), .B(n50), .Y(n207) );
  INVX1 U209 ( .A(sd[2]), .Y(n50) );
  NAND3X1 U210 ( .A(sd[0]), .B(sd[3]), .C(n143), .Y(n113) );
  INVX1 U211 ( .A(n208), .Y(n193) );
  NAND3X1 U212 ( .A(n41), .B(n160), .C(n23), .Y(n208) );
  NAND3X1 U213 ( .A(sd[3]), .B(n209), .C(sd[1]), .Y(n23) );
  NAND3X1 U214 ( .A(sd[3]), .B(n209), .C(n143), .Y(n160) );
  NAND3X1 U215 ( .A(n209), .B(n210), .C(sd[2]), .Y(n41) );
  NAND3X1 U216 ( .A(n10), .B(n202), .C(n9), .Y(n204) );
  NAND2X1 U217 ( .A(n144), .B(n206), .Y(n9) );
  NOR2X1 U218 ( .A(n209), .B(sd[3]), .Y(n144) );
  INVX1 U219 ( .A(sd_enable), .Y(n202) );
  NAND2X1 U220 ( .A(n86), .B(n60), .Y(sd_enable) );
  NAND3X1 U221 ( .A(n209), .B(n210), .C(n206), .Y(n60) );
  NOR2X1 U222 ( .A(n177), .B(sd[2]), .Y(n206) );
  INVX1 U223 ( .A(sd[1]), .Y(n177) );
  INVX1 U224 ( .A(sd[0]), .Y(n209) );
  NAND2X1 U225 ( .A(n143), .B(n210), .Y(n86) );
  INVX1 U226 ( .A(sd[3]), .Y(n210) );
  NOR2X1 U227 ( .A(sd[1]), .B(sd[2]), .Y(n143) );
  NAND3X1 U228 ( .A(n14), .B(n211), .C(n158), .Y(n10) );
  INVX1 U229 ( .A(n44), .Y(n158) );
  NAND3X1 U230 ( .A(sd[3]), .B(sd[2]), .C(n212), .Y(n44) );
  NOR2X1 U231 ( .A(sd[1]), .B(sd[0]), .Y(n212) );
  INVX1 U232 ( .A(fifo_empty), .Y(n211) );
  INVX1 U233 ( .A(n165), .Y(n14) );
  NAND3X1 U234 ( .A(count1[0]), .B(n147), .C(n213), .Y(n165) );
  NOR2X1 U235 ( .A(n132), .B(n130), .Y(n213) );
  INVX1 U236 ( .A(count1[2]), .Y(n130) );
  INVX1 U237 ( .A(count1[1]), .Y(n132) );
  INVX1 U238 ( .A(n214), .Y(n147) );
  NAND3X1 U239 ( .A(n128), .B(n126), .C(n215), .Y(n214) );
  NOR2X1 U240 ( .A(count1[6]), .B(count1[5]), .Y(n215) );
  INVX1 U241 ( .A(count1[4]), .Y(n126) );
  INVX1 U242 ( .A(count1[3]), .Y(n128) );
  NOR2X1 U243 ( .A(sd_clock2), .B(n216), .Y(N77) );
  INVX1 U244 ( .A(sd_clock1), .Y(n216) );
endmodule


module sniffer_top_t ( clk, rst, dataOut, scl, sd_enable, dataMinusComputer, 
        dataPlusComputer, dataMinusUsb, dataPlusUsb );
  input clk, rst;
  output dataOut, scl, sd_enable;
  inout dataMinusComputer,  dataPlusComputer,  dataMinusUsb,  dataPlusUsb;
  wire   fifo_read, fifo_write, fifoEmpty, fifoFull, sclEnable, clk_mode,
         tsrEnable, tsrLoad, data_read, eop, intercept, dataPlus, dataMinus,
         dclk;
  wire   [7:0] data_out;
  wire   [7:0] rData;
  wire   [7:0] dout;
  wire   [1:0] data_ready;
  wire   [3:0] inst;
  tri   dataMinusComputer;
  tri   dataPlusComputer;
  tri   dataMinusUsb;
  tri   dataPlusUsb;

  FifoTop_gregLength4_gregWidth8_addrSize2 U_2 ( .clk(clk), .rEnable(fifo_read), .resetN(rst), .wData(data_out), .wEnable(fifo_write), .fifoEmpty(fifoEmpty), 
        .fifoFull(fifoFull), .rData(rData) );
  SpiClkDivide_165_3_0_0 U_5 ( .clk(clk), .resetN(rst), .sclEnable(sclEnable), 
        .sclSpeed(clk_mode), .tsrEnable(tsrEnable), .scl(scl) );
  SpiXmitSR_srWidth8 U_4 ( .clk(clk), .resetN(rst), .tsrEnable(tsrEnable), 
        .tsrLoad(tsrLoad), .tsrData(dout), .dataOut(dataOut) );
  controller U_0 ( .clk(clk), .rst(rst), .fifo_full(fifoFull), 
        .decoder_instruction(inst), .data_ready(data_ready), .eop_found(eop), 
        .data_read(data_read), .fifo_read(fifo_read), .fifo_write(fifo_write), 
        .intercept(intercept) );
  decoder U_1 ( .clk(clk), .rst(rst), .data0(dataPlus), .data1(dataMinus), 
        .halt(intercept), .data(data_ready), .inst(inst), .data_out(data_out), 
        .dclk(dclk), .eopOut(eop) );
  interceptor U_3 ( .clk(clk), .eop(eop), .intercept(intercept), .inst(inst), 
        .rst(rst), .usbclk(dclk), .dataPlus(dataPlus), .dataMinus(dataMinus), 
        .computerMinus(dataMinusComputer), .computerPlus(dataPlusComputer), 
        .usbMinus(dataMinusUsb), .usbPlus(dataPlusUsb) );
  sd_control U_6 ( .clk(clk), .rst(rst), .sd_clock(scl), .fifo_empty(fifoEmpty), .data_in(rData), .data_out(dout), .clk_mode(clk_mode), .tsr_load(tsrLoad), 
        .sd_enable(sd_enable), .clk_enable(sclEnable), .data_read(data_read)
         );
endmodule

module  sniffer_top ( clk, rst, dataOut, scl, sd_enable, dataMinusComputer, dataPlusComputer, 
	dataMinusUsb, dataPlusUsb );

input   clk, rst;
inout   dataMinusComputer, dataPlusComputer, dataMinusUsb, dataPlusUsb;
output  dataOut, scl, sd_enable;
wire	nclk, nrst, ndataMinusComputer, ndataPlusComputer, ndataMinusUsb, ndataPlusUsb, ndataOut, nscl, nsd_enable;

        sniffer_top_t I0 ( .clk(nclk), .rst(nrst), .dataOut(ndataOut), .scl(nscl), 
	.sd_enable(nsd_enable), .dataMinusComputer(ndataMinusComputer), .dataPlusComputer(ndataPlusComputer), 
	.dataMinusUsb(ndataMinusUsb), .dataPlusUsb(ndataPlusUsb));

PADVDD U1 (  );
PADGND U2 (  );
PADOUT U3 ( .DO(ndataOut), .YPAD(dataOut) );
PADOUT U4 ( .DO(nscl), .YPAD(scl) );
PADOUT U5 ( .DO(nsd_enable), .YPAD(sd_enable) );
PADINC U6 ( .DI(nclk), .YPAD(clk) );
PADINC U7 ( .DI(nrst), .YPAD(rst) );
PADINC U8 ( .DI(ndataMinusComputer), .YPAD(dataMinusComputer) );
PADINC U9 ( .DI(ndataMinusUsb), .YPAD(dataMinusUsb) );
PADINC U10 ( .DI(ndataPlusComputer), .YPAD(dataPlusComputer) );
PADINC U11 ( .DI(ndataPlusUsb), .YPAD(dataPlusUsb) );

endmodule
