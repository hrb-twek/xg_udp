# set_property LOC GTXE2_CHANNEL_X0Y7 [get_cells **/*/transceiver_inst/gtwizard_inst/*/gtwizard_i/gt0_GTWIZARD_i/gtxe2_i]
set_property LOC A4 [get_ports SFP0_TXP]
set_property LOC A3 [get_ports SFP0_TXN]
set_property LOC B6 [get_ports SFP0_RXP]
set_property LOC B5 [get_ports SFP0_RXN]

#-----------------------------------------------------------
# Clock source used for the IDELAY Controller (if present) -
# and for the transceiver reset circuitry                  -
#-----------------------------------------------------------

# create_clock -name independent_clock -period 5.000 [get_ports independent_clock]

#-----------------------------------------------------------
# PCS/PMA Clock period Constraints: please do not relax    -
#-----------------------------------------------------------

create_clock -add -name GTREFCLK -period 6.400 [get_ports GTREFCLK_P]
#-----------------------------------------------------------
# Transceiver I/O placement:                               -
#-----------------------------------------------------------

set_property LOC F6 [get_ports GTREFCLK_P]
set_property LOC F5 [get_ports GTREFCLK_N]





