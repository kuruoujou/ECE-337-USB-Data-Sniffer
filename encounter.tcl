###################################
# Run the design through Encounter
# Modified for SoC Encounter 8.1
###################################

# Setup design and create floorplan
loadConfig ./encounter.conf 

# Create Floorplan
floorplan -r 1.0 1.8 40 40 40 40 

# Add supply rings around core
addRing -spacing_bottom 9.9 -width_left 9.9 -width_bottom 9.9 -width_top 9.9 -spacing_top 9.9 -layer_bottom metal1 -width_right 9.9 -around core -center 1 -layer_top metal1 -spacing_right 9.9 -spacing_left 9.9 -layer_right metal2 -layer_left metal2 -offset_top 9.9 -offset_bottom 9.9 -offset_left 9.9 -offset_right 9.9 -nets { gnd vdd }

# Place standard cells

setPlaceMode -congEffort high
placeDesign -inPlaceOpt
checkPlace

# If design is congested, try
#setPlaceMode -congEffort high


# Route power nets
sroute -noBlockPins -noPadRings


# Perform trial route and get initial timing results pre-Clock Tree Synthesis (CTS)
trialroute
timeDesign -preCTS 
# reports are in timingReports subdirectory of project

# Perform pre-CTS optimization
setOptMode -yieldEffort none
setOptMode -highEffort
setOptMode -maxDensity 0.95 
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -noSimplifyNetlist
optDesign -preCTS -drv

# derive clock tree contraint from constraints originally loaded from encounter.pt
createClockTreeSpec -output encounter.cts

# now apply the constraints
specifyClockTree -file encounter.cts

# Clock tree synthesis
# generate the clock tree routing and buffering where necessary
ckSynthesis -rguide cts.rguide -report report.ctsrpt -macromodel report.ctsmdl -fix_added_buffers

# Perform trial route and get preliminary timing results including effects of clock tree insertion
trialroute
timeDesign -postCTS 
# reports are in timingReports subdirectory of project

# Extract RC
setExtractRCMode -default -assumeMetFill
extractRC -outfile encounter.cap

# Perform post-CTS optimization
setOptMode -yieldEffort none
setOptMode -highEffort
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -noSimplifyNetlist
optDesign -postCTS -hold 
optDesign -postCTS -drv 

# see the .ctsrpt file for report on max clock skew
reportClockTree -postRoute -localSkew -report skew.post_troute_local.ctsrpt

# Add filler cells
addFiller -cell FILL


# Metal fill
#addMetalFill -layer {1 2 3} -nets {gnd vdd}

# Connect all new cells to VDD/GND
globalNetConnect vdd -type tiehi
globalNetConnect vdd -type pgpin -pin vdd -all -override

globalNetConnect gnd -type tielo
globalNetConnect gnd -type pgpin -pin gnd -all -override

# Route power nets
#sroute -allowJogging { preferWithChanges differentLayer } -nets {VDD VSS}
sroute 

# Route
#setNanoRouteMode -quiet
#setNanoRouteMode -quiet -drouteFixAntenna true
#setNanoRouteMode -quiet -routeInsertAntennaDiode true
#setNanoRouteMode -quiet -routeWithTimingDriven true
#setNanoRouteMode -quiet -routeWithEco true
#setNanoRouteMode -quiet -routeWithSiDriven true
#setNanoRouteMode -quiet -routeWithSiPostRouteFix true
#setNanoRouteMode -quiet -drouteAutoStop true
#setNanoRouteMode -quiet -routeSelectedNetOnly true
globalDetailRoute

# Get final timing results
setExtractRCMode -engine detail -reduce 0.0
extractRC

# Post-Route Optimization
setOptMode -yieldEffort none
setOptMode -effort high
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -simplifyNetlist false
setOptMode -usefulSkew false
optDesign -postRoute -incr 


# Add filler
addFiller -cell FILL -prefix FIL -fillBoundary

# Run DRC and Connection checks
verifyConnectivity -type all -error 1000 -warning 50
verifyGeometry

# Output GDSII
streamOut final.gds2 -mapFile gds2_encounter.map -outputMacros -stripes 1 -units 1000 -mode ALL
#streamOut final.gds2
saveNetlist -excludeLeafCell final.v

# Output DSPF RC Data
rcout -spf final.dspf

puts "**************************************"
puts "* Encounter script finished          *"
puts "*                                    *"
puts "* Results:                           *"
puts "* --------                           *"
puts "* Layout:  final.gds2                *"
puts "* Netlist: final.v                   *"
puts "* Timing:  timing.rep.5.final        *"
puts "*                                    *"
puts "* Type 'win' to get the Main Window  *"
puts "* or type 'exit' to quit             *"
puts "*                                    *"
puts "**************************************"


