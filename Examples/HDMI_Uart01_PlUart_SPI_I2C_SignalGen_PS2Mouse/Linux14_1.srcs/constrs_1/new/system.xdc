#
set_property IOSTANDARD LVCMOS33 [get_ports HDMI_DDC_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports HDMI_DDC_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports {HDMI_HPD_tri_i[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports IIC_0_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports IIC_0_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports {HDMI_OEN[0]}]
set_property PACKAGE_PIN L14 [get_ports {HDMI_HPD_tri_i[0]}]
set_property PACKAGE_PIN W18 [get_ports IIC_0_scl_io]
set_property PACKAGE_PIN W19 [get_ports IIC_0_sda_io]
set_property PACKAGE_PIN V17 [get_ports {HDMI_OEN[0]}]
set_property PACKAGE_PIN N17 [get_ports HDMI_DDC_scl_io]
set_property PACKAGE_PIN P18 [get_ports HDMI_DDC_sda_io]

set_property PACKAGE_PIN T20 [get_ports {TMDS_Data_p_0[1]}]
set_property PACKAGE_PIN V20 [get_ports {TMDS_Data_p_0[2]}]
set_property PACKAGE_PIN U18 [get_ports {TMDS_Data_p_0[0]}]
set_property PACKAGE_PIN U14 [get_ports TMDS_Clk_p_0]

set_property IOSTANDARD LVCMOS33 [get_ports FCLK_CLK2_0]
set_property IOSTANDARD LVCMOS33 [get_ports FCLK_CLK3_0]
set_property PACKAGE_PIN R16 [get_ports FCLK_CLK2_0]
set_property PACKAGE_PIN R17 [get_ports FCLK_CLK3_0]

set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_0_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_0_txd]
set_property PACKAGE_PIN V12 [get_ports uart_rtl_0_txd]
set_property PACKAGE_PIN W13 [get_ports uart_rtl_0_rxd]


set_property IOSTANDARD LVCMOS33 [get_ports UART_0_0_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_0_0_txd]
set_property PACKAGE_PIN R18 [get_ports UART_0_0_rxd]
set_property PACKAGE_PIN T17 [get_ports UART_0_0_txd]

set_property IOSTANDARD LVCMOS33 [get_ports SPI0_MOSI_O_0]
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_SCLK_O_0]
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_SS_O_0]
set_property PACKAGE_PIN T14 [get_ports SPI0_MOSI_O_0]
set_property PACKAGE_PIN T15 [get_ports SPI0_SCLK_O_0]
set_property PACKAGE_PIN P14 [get_ports SPI0_SS_O_0]

set_property IOSTANDARD LVCMOS33 [get_ports SPI0_MISO_I_0]
set_property PACKAGE_PIN R14 [get_ports SPI0_MISO_I_0]

#PS/2 Mouse =Guido=
set_property IOSTANDARD LVCMOS33 [get_ports ps2_clock_0_tri_io]
set_property IOSTANDARD LVCMOS33 [get_ports ps2_dat_0_tri_io]
set_property PACKAGE_PIN Y18 [get_ports ps2_dat_0_tri_io]
set_property PACKAGE_PIN Y19 [get_ports ps2_clock_0_tri_io]
set_property PULLUP true [get_ports ps2_dat_0_tri_io];
set_property PULLUP true [get_ports ps2_clock_0_tri_io];

set_property BITSTREAM.CONFIG.DONEPIN PULLNONE [current_design]
