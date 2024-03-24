set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-1 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]
set_property CFGBVS VCCO [current_design]

set_property -dict { IOSTANDARD LVDS PACKAGE_PIN AA10 } [get_ports OSC_CLK_P]


# set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN F8 } [get_ports UART_RXD]
# set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN F9 } [get_ports UART_TXD]

set_property -dict { IOSTANDARD LVCMOS25 PACKAGE_PIN G20 } [get_ports LED]

set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN A13 } [get_ports SW]


set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN F14 } [get_ports SFP0_TX_FAULT]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN G12 } [get_ports SFP0_TX_DIS]
# set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN F13 } [get_ports SFP0_SDA]
# set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN F10 } [get_ports SFP0_SCL]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN F12 } [get_ports SFP0_MOD_ABS]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN E11 } [get_ports SFP0_RS0]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN G11 } [get_ports SFP0_RX_LOS]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN D11 } [get_ports SFP0_RS1]


