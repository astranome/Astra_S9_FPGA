// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sun Sep 17 23:02:59 2023
// Host        : UUBP-THINK running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog H:/FPGA/S9miner_sample-master/P04_SD_BOOT/zynq_wrapper.v -mode pin_planning -force
// Design      : zynq_wrapper
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
module zynq_wrapper(DDR_0_dqs_p, DDR_0_dm, DDR_0_ba, DDR_0_addr, DDR_0_dq, DDR_0_dqs_n, DDR_0_cas_n, DDR_0_ck_n, DDR_0_ck_p, DDR_0_cke, DDR_0_cs_n, DDR_0_odt, DDR_0_ras_n, DDR_0_reset_n, DDR_0_we_n, FIXED_IO_0_mio, FIXED_IO_0_ddr_vrn, FIXED_IO_0_ddr_vrp, FIXED_IO_0_ps_clk, FIXED_IO_0_ps_porb, FIXED_IO_0_ps_srstb);
  inout [3:0] DDR_0_dqs_p;
  inout [3:0] DDR_0_dm;
  inout [2:0] DDR_0_ba;
  inout [14:0] DDR_0_addr;
  inout [31:0] DDR_0_dq;
  inout [3:0] DDR_0_dqs_n;
  inout DDR_0_cas_n;
  inout DDR_0_ck_n;
  inout DDR_0_ck_p;
  inout DDR_0_cke;
  inout DDR_0_cs_n;
  inout DDR_0_odt;
  inout DDR_0_ras_n;
  inout DDR_0_reset_n;
  inout DDR_0_we_n;
  inout [53:0] FIXED_IO_0_mio;
  inout FIXED_IO_0_ddr_vrn;
  inout FIXED_IO_0_ddr_vrp;
  inout FIXED_IO_0_ps_clk;
  inout FIXED_IO_0_ps_porb;
  inout FIXED_IO_0_ps_srstb;

endmodule
