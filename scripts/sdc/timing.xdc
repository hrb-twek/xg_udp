# create_clock -period 5.000 -name OSC_CLK [get_ports OSC_CLK_P]
create_clock -add -name GTREFCLK -period 6.400 [get_ports GTREFCLK_P]
