# This file specifies how the pads are placed
# The name of each pad here has to match the
# name in the verilog code
# The Mosis padframe has 4 corners and 40 pads

Version: 2

Pad: U130 N PADNC
Pad: U125 N PADNC
Pad: U100 N PADNC
Pad: U1 N PADVDD #vdd
Pad: U101 N PADNC
Pad: U102 N PADNC
Pad: U103 N PADNC
Pad: U2 N PADGND #gnd
Pad: U104 N PADNC
Pad: U105 N PADNC
#Pad: U126 N PADNC


Pad: U131 E PADNC
Pad: U106 E PADNC
Pad: U4 E PADOUT #scl
Pad: U107 E PADNC
Pad: U108 E PADNC
Pad: U5 E PADOUT #sd_enable
Pad: U109 E PADNC
Pad: U110 E PADNC
Pad: U3 E PADOUT #mosi
Pad: U111 E PADNC
#Pad: U127 E PADNC

Pad: U132 S PADNC
Pad: U113 S PADNC
Pad: U112 S PADNC
Pad: U7 S PADINC #rst
Pad: U114 S PADNC
Pad: U115 S PADNC
Pad: U116 S PADNC
Pad: U6 S PADINC #clk
Pad: U117 S PADNC
Pad: U118 S PADNC
#Pad: U128 S PADNC

Pad: U133 W PADNC
Pad: U10 W PADINOUT #D+ computer
Pad: U119 W PADNC
Pad: U120 W PADNC
Pad: U11 W PADINOUT #D+ usb
Pad: U121 W PADNC
Pad: U9 W PADINOUT #D- usb
Pad: U124 W PADNC
Pad: U122 W PADNC
Pad: U8 W PADINOUT #D- computer
#Pad: U129 W PADNC

Orient: R0
Pad: c04 NW PADFC

Orient: R90
Pad: c02 SW PADFC

Orient: R180
Pad: c01 SE PADFC

Orient: R270
Pad: c03 NE PADFC









