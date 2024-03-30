//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Wed Mar 27 17:53:01 2024
//Host        : DESKTOP-0SNREP6 running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FCLK_CLK2_0,
    FCLK_CLK3_0,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    HDMI_DDC_scl_io,
    HDMI_DDC_sda_io,
    HDMI_HPD_tri_i,
    HDMI_OEN,
    IIC_0_scl_io,
    IIC_0_sda_io,
    SPI0_MISO_I_0,
    SPI0_MOSI_O_0,
    SPI0_SCLK_O_0,
    SPI0_SS_O_0,
    TMDS_Clk_n_0,
    TMDS_Clk_p_0,
    TMDS_Data_n_0,
    TMDS_Data_p_0,
    UART_0_0_rxd,
    UART_0_0_txd,
    ps2_clock_0_tri_io,
    ps2_dat_0_tri_io,
    uart_rtl_0_rxd,
    uart_rtl_0_txd);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  output FCLK_CLK2_0;
  output FCLK_CLK3_0;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  inout HDMI_DDC_scl_io;
  inout HDMI_DDC_sda_io;
  input [0:0]HDMI_HPD_tri_i;
  output [0:0]HDMI_OEN;
  inout IIC_0_scl_io;
  inout IIC_0_sda_io;
  input SPI0_MISO_I_0;
  output SPI0_MOSI_O_0;
  output SPI0_SCLK_O_0;
  output SPI0_SS_O_0;
  output TMDS_Clk_n_0;
  output TMDS_Clk_p_0;
  output [2:0]TMDS_Data_n_0;
  output [2:0]TMDS_Data_p_0;
  input UART_0_0_rxd;
  output UART_0_0_txd;
  inout ps2_clock_0_tri_io;
  inout ps2_dat_0_tri_io;
  input uart_rtl_0_rxd;
  output uart_rtl_0_txd;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FCLK_CLK2_0;
  wire FCLK_CLK3_0;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire HDMI_DDC_scl_i;
  wire HDMI_DDC_scl_io;
  wire HDMI_DDC_scl_o;
  wire HDMI_DDC_scl_t;
  wire HDMI_DDC_sda_i;
  wire HDMI_DDC_sda_io;
  wire HDMI_DDC_sda_o;
  wire HDMI_DDC_sda_t;
  wire [0:0]HDMI_HPD_tri_i;
  wire [0:0]HDMI_OEN;
  wire IIC_0_scl_i;
  wire IIC_0_scl_io;
  wire IIC_0_scl_o;
  wire IIC_0_scl_t;
  wire IIC_0_sda_i;
  wire IIC_0_sda_io;
  wire IIC_0_sda_o;
  wire IIC_0_sda_t;
  wire SPI0_MISO_I_0;
  wire SPI0_MOSI_O_0;
  wire SPI0_SCLK_O_0;
  wire SPI0_SS_O_0;
  wire TMDS_Clk_n_0;
  wire TMDS_Clk_p_0;
  wire [2:0]TMDS_Data_n_0;
  wire [2:0]TMDS_Data_p_0;
  wire UART_0_0_rxd;
  wire UART_0_0_txd;
  wire ps2_clock_0_tri_i;
  wire ps2_clock_0_tri_io;
  wire ps2_clock_0_tri_o;
  wire ps2_clock_0_tri_t;
  wire ps2_dat_0_tri_i;
  wire ps2_dat_0_tri_io;
  wire ps2_dat_0_tri_o;
  wire ps2_dat_0_tri_t;
  wire uart_rtl_0_rxd;
  wire uart_rtl_0_txd;

  IOBUF HDMI_DDC_scl_iobuf
       (.I(HDMI_DDC_scl_o),
        .IO(HDMI_DDC_scl_io),
        .O(HDMI_DDC_scl_i),
        .T(HDMI_DDC_scl_t));
  IOBUF HDMI_DDC_sda_iobuf
       (.I(HDMI_DDC_sda_o),
        .IO(HDMI_DDC_sda_io),
        .O(HDMI_DDC_sda_i),
        .T(HDMI_DDC_sda_t));
  IOBUF IIC_0_scl_iobuf
       (.I(IIC_0_scl_o),
        .IO(IIC_0_scl_io),
        .O(IIC_0_scl_i),
        .T(IIC_0_scl_t));
  IOBUF IIC_0_sda_iobuf
       (.I(IIC_0_sda_o),
        .IO(IIC_0_sda_io),
        .O(IIC_0_sda_i),
        .T(IIC_0_sda_t));
  IOBUF ps2_clock_0_tri_iobuf
       (.I(ps2_clock_0_tri_o),
        .IO(ps2_clock_0_tri_io),
        .O(ps2_clock_0_tri_i),
        .T(ps2_clock_0_tri_t));
  IOBUF ps2_dat_0_tri_iobuf
       (.I(ps2_dat_0_tri_o),
        .IO(ps2_dat_0_tri_io),
        .O(ps2_dat_0_tri_i),
        .T(ps2_dat_0_tri_t));
  system system_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FCLK_CLK2_0(FCLK_CLK2_0),
        .FCLK_CLK3_0(FCLK_CLK3_0),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .HDMI_DDC_scl_i(HDMI_DDC_scl_i),
        .HDMI_DDC_scl_o(HDMI_DDC_scl_o),
        .HDMI_DDC_scl_t(HDMI_DDC_scl_t),
        .HDMI_DDC_sda_i(HDMI_DDC_sda_i),
        .HDMI_DDC_sda_o(HDMI_DDC_sda_o),
        .HDMI_DDC_sda_t(HDMI_DDC_sda_t),
        .HDMI_HPD_tri_i(HDMI_HPD_tri_i),
        .HDMI_OEN(HDMI_OEN),
        .IIC_0_scl_i(IIC_0_scl_i),
        .IIC_0_scl_o(IIC_0_scl_o),
        .IIC_0_scl_t(IIC_0_scl_t),
        .IIC_0_sda_i(IIC_0_sda_i),
        .IIC_0_sda_o(IIC_0_sda_o),
        .IIC_0_sda_t(IIC_0_sda_t),
        .SPI0_MISO_I_0(SPI0_MISO_I_0),
        .SPI0_MOSI_O_0(SPI0_MOSI_O_0),
        .SPI0_SCLK_O_0(SPI0_SCLK_O_0),
        .SPI0_SS_O_0(SPI0_SS_O_0),
        .TMDS_Clk_n_0(TMDS_Clk_n_0),
        .TMDS_Clk_p_0(TMDS_Clk_p_0),
        .TMDS_Data_n_0(TMDS_Data_n_0),
        .TMDS_Data_p_0(TMDS_Data_p_0),
        .UART_0_0_rxd(UART_0_0_rxd),
        .UART_0_0_txd(UART_0_0_txd),
        .ps2_clock_0_tri_i(ps2_clock_0_tri_i),
        .ps2_clock_0_tri_o(ps2_clock_0_tri_o),
        .ps2_clock_0_tri_t(ps2_clock_0_tri_t),
        .ps2_dat_0_tri_i(ps2_dat_0_tri_i),
        .ps2_dat_0_tri_o(ps2_dat_0_tri_o),
        .ps2_dat_0_tri_t(ps2_dat_0_tri_t),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd));
endmodule
