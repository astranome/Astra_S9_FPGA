// $Revision: $ $Date:  $
//-----------------------------------------------------------------------------
//  (c) Copyright 2015 Xilinx, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Xilinx, Inc. and is protected under U.S. and
//  international copyright and other intellectual property
//  laws.
//
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  Xilinx, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) Xilinx shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or Xilinx had been advised of the
//  possibility of the same.
//
//  CRITICAL APPLICATIONS
//  Xilinx products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of Xilinx products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES. 
//
//--------------------------------------------------------------------------
//  Module Description:
//  This module is the stream coupler for the AXI4-Stream to video-out bridge.
//  It instantiates a fifo used to absorb stalls in the AXI4-Stream input
//  and provides synchronous or asynchronous clock domains. Component width
//  conversion is provided by either trimming or padding the input. The 
//  AXI4-Stream input signals are used to control the fifo write enable. 
//  The synchronizer module is used to control the fifo read enable.
//
//  Verilog-standard:  Verilog 2001
//--------------------------------------------------------------------------

`timescale 1ps/1ps
`default_nettype none
(* DowngradeIPIdentifiedWarnings="yes" *)

module v_axi4s_vid_out_v4_0_1_coupler #(
  parameter C_FAMILY = "virtex6",
  parameter C_HAS_ASYNC_CLK = 0,                         // Enable asyncronous clock domains
  parameter C_ADDR_WIDTH = 10,                           // FIFO address width [5,10,11,12,13]
  parameter C_PIXELS_PER_CLOCK = 1,                      // Pixels per clock [1,2,4]
  parameter C_COMPONENTS_PER_PIXEL = 3,                  // Components per pixel [1,2,3,4]
  parameter C_S_AXIS_COMPONENT_WIDTH = 8,                // AXIS video component width [8,10,12,16]
  parameter C_NATIVE_COMPONENT_WIDTH = 8,                // Native video component width [8,10,12,16]
  parameter C_S_AXIS_TDATA_WIDTH = 24,                   // AXIS video tdata width
  parameter C_NATIVE_DATA_WIDTH = 24                     // Native video data width
) (
  // System Signals
  input  wire VIDEO_OUT_CLK,                             // Native video clock
  input  wire VID_CE,                                    // Native video clock enable
  input  wire VID_RESET,                                 // Native video reset

  input  wire ACLK,                                      // AXI4-Stream clock
  input  wire ACLKEN,                                    // AXI4-Stream clock enable
  input  wire ARESETN,                                   // AXI4-Stream resetn, active low

  // FIFO write signals
  input  wire [C_S_AXIS_TDATA_WIDTH+3-1:0] FIFO_WR_DATA, // FIFO write data
  input  wire FIFO_VALID,                                // FIFO valid
  output wire FIFO_READY,                                // FIFO ready

  // FIFO read signals
  output wire [C_NATIVE_DATA_WIDTH-1:0] FIFO_RD_DATA,    // FIFO read data
  output wire FIFO_EOL,                                  // FIFO end of line
  output wire FIFO_SOF,                                  // FIFO start of frame
  output wire FIFO_FIELD_ID,                             // FIFO field-id
  input  wire FIFO_RD_EN,                                // FIFO read enable
  output wire [C_ADDR_WIDTH:0] FIFO_LEVEL_WR,            // FIFO fill level write domain
  output wire [C_ADDR_WIDTH:0] FIFO_LEVEL_RD,            // FIFO fill level read domain

  // FIFO status signals
  output wire FIFO_EMPTY,                                // FIFO empty
  output wire FIFO_OVERFLOW,                             // FIFO overflow
  output wire FIFO_UNDERFLOW                             // FIFO underflow
);

  // Parameters
  localparam C_NUM_COMPONENTS       = C_PIXELS_PER_CLOCK * C_COMPONENTS_PER_PIXEL;
  localparam C_DO_TRIM              = C_S_AXIS_COMPONENT_WIDTH > C_NATIVE_COMPONENT_WIDTH;
  localparam C_DO_PAD               = C_S_AXIS_COMPONENT_WIDTH < C_NATIVE_COMPONENT_WIDTH;
  localparam C_DATA_WIDTH           = C_DO_TRIM ? ((C_NUM_COMPONENTS * C_NATIVE_COMPONENT_WIDTH) + 3) : ((C_NUM_COMPONENTS * C_S_AXIS_COMPONENT_WIDTH) + 3);
  localparam C_DIFF_COMPONENT_WIDTH = C_DO_TRIM ? C_S_AXIS_COMPONENT_WIDTH-C_NATIVE_COMPONENT_WIDTH : C_NATIVE_COMPONENT_WIDTH-C_S_AXIS_COMPONENT_WIDTH;
  localparam C_IMPLEMENTATION_TYPE  = C_HAS_ASYNC_CLK ? 2 : 0;
  localparam C_EN_SAFETY_CKT        = C_HAS_ASYNC_CLK ? 0 : 0;

  // Wire and register declarations
  genvar                   i;
  wire [C_DATA_WIDTH-1:0]  din_i;      
  wire [C_DATA_WIDTH-1:0]  dout_i;      
  wire [C_NATIVE_DATA_WIDTH-1:0] dout_from_pad;      
  wire                     full_i;     
  wire                     wr_en_i;   
  wire                     rd_en_i;   
  wire                     wr_clk_i;
  wire                     rd_clk_i;
  wire                     clk_i;
  wire                     wr_rst_i = 1'b0;
  wire                     rd_rst_i = 1'b0;
  wire                     srst_i   = (C_HAS_ASYNC_CLK) ? 1'b0 : ~ARESETN;
  wire                     rst_i = (C_HAS_ASYNC_CLK) ? (VID_RESET | ~ARESETN) : 1'b0;
  wire [C_ADDR_WIDTH:0]    rd_data_count_i;
  wire [C_ADDR_WIDTH:0]    wr_data_count_i; 
  wire [C_ADDR_WIDTH:0]    data_count_i;
  wire                     overflow_i;
  wire                     underflow_i;
  wire                     valid_i;
  wire                     empty_i;
  wire                     wr_rst_busy_i;
  wire                     rd_rst_busy_i;
 
  // Assignments
  assign FIFO_RD_DATA   = dout_from_pad;
  assign FIFO_EOL       = dout_i[C_DATA_WIDTH-3];
  assign FIFO_SOF       = dout_i[C_DATA_WIDTH-2];
  assign FIFO_FIELD_ID  = dout_i[C_DATA_WIDTH-1];
  assign FIFO_READY     = ~full_i & ARESETN & ~wr_rst_busy_i;
  assign wr_en_i        = FIFO_VALID & FIFO_READY & ACLKEN & ARESETN; 
  assign rd_en_i        = FIFO_RD_EN & VID_CE;
  assign FIFO_EMPTY     = empty_i;
  assign FIFO_OVERFLOW  = overflow_i;
  assign FIFO_UNDERFLOW = underflow_i;

  generate
    if(C_HAS_ASYNC_CLK) begin : gen_async_fifo_signals
      assign wr_clk_i = ACLK;
      assign rd_clk_i = VIDEO_OUT_CLK;
      assign clk_i = 1'b0;
      assign FIFO_LEVEL_RD = rd_data_count_i;
      assign FIFO_LEVEL_WR = wr_data_count_i;
    end else begin : gen_sync_fifo_signals
      assign wr_clk_i = 1'b0;
      assign rd_clk_i = 1'b0;
      assign clk_i = ACLK;
      assign FIFO_LEVEL_RD = data_count_i;
      assign FIFO_LEVEL_WR = data_count_i;
    end
  endgenerate

  // Trim data input to FIFO
  generate
    if(C_DO_TRIM) begin : gen_trim_to_fifo
      for(i=0; i<C_NUM_COMPONENTS; i=i+1) begin : gen_trim_to_fifo_loop
        assign din_i[i*C_NATIVE_COMPONENT_WIDTH +: C_NATIVE_COMPONENT_WIDTH] = FIFO_WR_DATA[(i*C_S_AXIS_COMPONENT_WIDTH+C_DIFF_COMPONENT_WIDTH) +: C_NATIVE_COMPONENT_WIDTH];
      end
      assign din_i[C_DATA_WIDTH-1:C_DATA_WIDTH-3] = FIFO_WR_DATA[C_S_AXIS_TDATA_WIDTH+3-1:C_S_AXIS_TDATA_WIDTH+3-3];
    end else begin : gen_no_trim_to_fifo
      assign din_i = {FIFO_WR_DATA[C_S_AXIS_TDATA_WIDTH+3-1:C_S_AXIS_TDATA_WIDTH+3-3], FIFO_WR_DATA[C_DATA_WIDTH-4:0]};
    end
  endgenerate

  // Pad data output from FIFO
  generate
    if(C_DO_PAD) begin : gen_pad_from_fifo
      for(i=0; i<C_NUM_COMPONENTS; i=i+1) begin : gen_pad_from_fifo_loop
        assign dout_from_pad[i*C_NATIVE_COMPONENT_WIDTH +: C_NATIVE_COMPONENT_WIDTH] = {dout_i[i*C_S_AXIS_COMPONENT_WIDTH +: C_S_AXIS_COMPONENT_WIDTH],{C_DIFF_COMPONENT_WIDTH{1'b0}}};
      end
    end else begin : gen_no_pad_from_fifo
        assign dout_from_pad = dout_i;
    end
  endgenerate

  fifo_generator_v13_0_1 #(
    .C_COMMON_CLOCK(C_HAS_ASYNC_CLK==0),
    .C_COUNT_TYPE(0),
    .C_DATA_COUNT_WIDTH(C_ADDR_WIDTH+1),
    .C_DEFAULT_VALUE("BlankString"),
    .C_DIN_WIDTH(C_DATA_WIDTH),
    .C_DOUT_RST_VAL("0"),
    .C_DOUT_WIDTH(C_DATA_WIDTH),
    .C_ENABLE_RLOCS(0),
    .C_FAMILY(C_FAMILY),
    .C_FULL_FLAGS_RST_VAL(C_HAS_ASYNC_CLK),
    .C_HAS_ALMOST_EMPTY(0),
    .C_HAS_ALMOST_FULL(0),
    .C_HAS_BACKUP(0),
    .C_HAS_DATA_COUNT(C_HAS_ASYNC_CLK==0),
    .C_HAS_INT_CLK(0),
    .C_HAS_MEMINIT_FILE(0),
    .C_HAS_OVERFLOW(1),
    .C_HAS_RD_DATA_COUNT(C_HAS_ASYNC_CLK),
    .C_HAS_RD_RST(0),
    .C_HAS_RST(C_HAS_ASYNC_CLK),
    .C_HAS_SRST(C_HAS_ASYNC_CLK==0),
    .C_HAS_UNDERFLOW(1),
    .C_HAS_VALID(1),
    .C_HAS_WR_ACK(0),
    .C_HAS_WR_DATA_COUNT(C_HAS_ASYNC_CLK),
    .C_HAS_WR_RST(0),
    .C_IMPLEMENTATION_TYPE(C_IMPLEMENTATION_TYPE),
    .C_INIT_WR_PNTR_VAL(0),
    .C_MEMORY_TYPE(1),
    .C_MIF_FILE_NAME("BlankString"),
    .C_OPTIMIZATION_MODE(0),
    .C_OVERFLOW_LOW(0),
    .C_PRELOAD_LATENCY(0),
    .C_PRELOAD_REGS(1),
    .C_PRIM_FIFO_TYPE("1kx36"),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL(4),
    .C_PROG_EMPTY_THRESH_NEGATE_VAL(5),
    .C_PROG_EMPTY_TYPE(0),
    .C_PROG_FULL_THRESH_ASSERT_VAL((2**C_ADDR_WIDTH)-1),
    .C_PROG_FULL_THRESH_NEGATE_VAL((2**C_ADDR_WIDTH)-2),
    .C_PROG_FULL_TYPE(0),
    .C_RD_DATA_COUNT_WIDTH(C_ADDR_WIDTH+1),
    .C_RD_DEPTH((2**C_ADDR_WIDTH)),
    .C_RD_FREQ(1),
    .C_RD_PNTR_WIDTH(C_ADDR_WIDTH),
    .C_UNDERFLOW_LOW(0),
    .C_USE_DOUT_RST(1),
    .C_USE_ECC(0),
    .C_USE_EMBEDDED_REG(1),
    .C_USE_PIPELINE_REG(0),
    .C_POWER_SAVING_MODE(0),
    .C_USE_FIFO16_FLAGS(0),
    .C_USE_FWFT_DATA_COUNT(1),
    .C_VALID_LOW(0),
    .C_WR_ACK_LOW(0),
    .C_WR_DATA_COUNT_WIDTH(C_ADDR_WIDTH+1),
    .C_WR_DEPTH((2**C_ADDR_WIDTH)),
    .C_WR_FREQ(1),
    .C_WR_PNTR_WIDTH(C_ADDR_WIDTH),
    .C_WR_RESPONSE_LATENCY(1),
    .C_MSGON_VAL(1),
    .C_ENABLE_RST_SYNC(1),
    .C_ERROR_INJECTION_TYPE(0),
    .C_EN_SAFETY_CKT(C_EN_SAFETY_CKT),
    .C_SYNCHRONIZER_STAGE(2),
    .C_INTERFACE_TYPE(0),
    .C_AXI_TYPE(1),
    .C_HAS_AXI_WR_CHANNEL(1),
    .C_HAS_AXI_RD_CHANNEL(1),
    .C_HAS_SLAVE_CE(0),
    .C_HAS_MASTER_CE(0),
    .C_ADD_NGC_CONSTRAINT(0),
    .C_USE_COMMON_OVERFLOW(0),
    .C_USE_COMMON_UNDERFLOW(0),
    .C_USE_DEFAULT_SETTINGS(0),
    .C_AXI_ID_WIDTH(1),
    .C_AXI_ADDR_WIDTH(32),
    .C_AXI_DATA_WIDTH(64),
    .C_AXI_LEN_WIDTH(8),
    .C_AXI_LOCK_WIDTH(1),
    .C_HAS_AXI_ID(0),
    .C_HAS_AXI_AWUSER(0),
    .C_HAS_AXI_WUSER(0),
    .C_HAS_AXI_BUSER(0),
    .C_HAS_AXI_ARUSER(0),
    .C_HAS_AXI_RUSER(0),
    .C_AXI_ARUSER_WIDTH(1),
    .C_AXI_AWUSER_WIDTH(1),
    .C_AXI_WUSER_WIDTH(1),
    .C_AXI_BUSER_WIDTH(1),
    .C_AXI_RUSER_WIDTH(1),
    .C_HAS_AXIS_TDATA(1),
    .C_HAS_AXIS_TID(0),
    .C_HAS_AXIS_TDEST(0),
    .C_HAS_AXIS_TUSER(1),
    .C_HAS_AXIS_TREADY(1),
    .C_HAS_AXIS_TLAST(0),
    .C_HAS_AXIS_TSTRB(0),
    .C_HAS_AXIS_TKEEP(0),
    .C_AXIS_TDATA_WIDTH(8),
    .C_AXIS_TID_WIDTH(1),
    .C_AXIS_TDEST_WIDTH(1),
    .C_AXIS_TUSER_WIDTH(4),
    .C_AXIS_TSTRB_WIDTH(1),
    .C_AXIS_TKEEP_WIDTH(1),
    .C_WACH_TYPE(0),
    .C_WDCH_TYPE(0),
    .C_WRCH_TYPE(0),
    .C_RACH_TYPE(0),
    .C_RDCH_TYPE(0),
    .C_AXIS_TYPE(0),
    .C_IMPLEMENTATION_TYPE_WACH(1),
    .C_IMPLEMENTATION_TYPE_WDCH(1),
    .C_IMPLEMENTATION_TYPE_WRCH(1),
    .C_IMPLEMENTATION_TYPE_RACH(1),
    .C_IMPLEMENTATION_TYPE_RDCH(1),
    .C_IMPLEMENTATION_TYPE_AXIS(1),
    .C_APPLICATION_TYPE_WACH(0),
    .C_APPLICATION_TYPE_WDCH(0),
    .C_APPLICATION_TYPE_WRCH(0),
    .C_APPLICATION_TYPE_RACH(0),
    .C_APPLICATION_TYPE_RDCH(0),
    .C_APPLICATION_TYPE_AXIS(0),
    .C_PRIM_FIFO_TYPE_WACH("512x36"),
    .C_PRIM_FIFO_TYPE_WDCH("1kx36"),
    .C_PRIM_FIFO_TYPE_WRCH("512x36"),
    .C_PRIM_FIFO_TYPE_RACH("512x36"),
    .C_PRIM_FIFO_TYPE_RDCH("1kx36"),
    .C_PRIM_FIFO_TYPE_AXIS("1kx18"),
    .C_USE_ECC_WACH(0),
    .C_USE_ECC_WDCH(0),
    .C_USE_ECC_WRCH(0),
    .C_USE_ECC_RACH(0),
    .C_USE_ECC_RDCH(0),
    .C_USE_ECC_AXIS(0),
    .C_ERROR_INJECTION_TYPE_WACH(0),
    .C_ERROR_INJECTION_TYPE_WDCH(0),
    .C_ERROR_INJECTION_TYPE_WRCH(0),
    .C_ERROR_INJECTION_TYPE_RACH(0),
    .C_ERROR_INJECTION_TYPE_RDCH(0),
    .C_ERROR_INJECTION_TYPE_AXIS(0),
    .C_DIN_WIDTH_WACH(32),
    .C_DIN_WIDTH_WDCH(64),
    .C_DIN_WIDTH_WRCH(2),
    .C_DIN_WIDTH_RACH(32),
    .C_DIN_WIDTH_RDCH(64),
    .C_DIN_WIDTH_AXIS(1),
    .C_WR_DEPTH_WACH(16),
    .C_WR_DEPTH_WDCH(1024),
    .C_WR_DEPTH_WRCH(16),
    .C_WR_DEPTH_RACH(16),
    .C_WR_DEPTH_RDCH(1024),
    .C_WR_DEPTH_AXIS(1024),
    .C_WR_PNTR_WIDTH_WACH(4),
    .C_WR_PNTR_WIDTH_WDCH(C_ADDR_WIDTH),
    .C_WR_PNTR_WIDTH_WRCH(4),
    .C_WR_PNTR_WIDTH_RACH(4),
    .C_WR_PNTR_WIDTH_RDCH(C_ADDR_WIDTH),
    .C_WR_PNTR_WIDTH_AXIS(C_ADDR_WIDTH),
    .C_HAS_DATA_COUNTS_WACH(0),
    .C_HAS_DATA_COUNTS_WDCH(0),
    .C_HAS_DATA_COUNTS_WRCH(0),
    .C_HAS_DATA_COUNTS_RACH(0),
    .C_HAS_DATA_COUNTS_RDCH(0),
    .C_HAS_DATA_COUNTS_AXIS(0),
    .C_HAS_PROG_FLAGS_WACH(0),
    .C_HAS_PROG_FLAGS_WDCH(0),
    .C_HAS_PROG_FLAGS_WRCH(0),
    .C_HAS_PROG_FLAGS_RACH(0),
    .C_HAS_PROG_FLAGS_RDCH(0),
    .C_HAS_PROG_FLAGS_AXIS(0),
    .C_PROG_FULL_TYPE_WACH(0),
    .C_PROG_FULL_TYPE_WDCH(0),
    .C_PROG_FULL_TYPE_WRCH(0),
    .C_PROG_FULL_TYPE_RACH(0),
    .C_PROG_FULL_TYPE_RDCH(0),
    .C_PROG_FULL_TYPE_AXIS(0),
    .C_PROG_FULL_THRESH_ASSERT_VAL_WACH(1023),
    .C_PROG_FULL_THRESH_ASSERT_VAL_WDCH(1023),
    .C_PROG_FULL_THRESH_ASSERT_VAL_WRCH(1023),
    .C_PROG_FULL_THRESH_ASSERT_VAL_RACH(1023),
    .C_PROG_FULL_THRESH_ASSERT_VAL_RDCH(1023),
    .C_PROG_FULL_THRESH_ASSERT_VAL_AXIS(1023),
    .C_PROG_EMPTY_TYPE_WACH(0),
    .C_PROG_EMPTY_TYPE_WDCH(0),
    .C_PROG_EMPTY_TYPE_WRCH(0),
    .C_PROG_EMPTY_TYPE_RACH(0),
    .C_PROG_EMPTY_TYPE_RDCH(0),
    .C_PROG_EMPTY_TYPE_AXIS(0),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH(1022),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH(1022),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH(1022),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH(1022),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH(1022),
    .C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS(1022),
    .C_REG_SLICE_MODE_WACH(0),
    .C_REG_SLICE_MODE_WDCH(0),
    .C_REG_SLICE_MODE_WRCH(0),
    .C_REG_SLICE_MODE_RACH(0),
    .C_REG_SLICE_MODE_RDCH(0),
    .C_REG_SLICE_MODE_AXIS(0)
  ) FIFO_INST (
    .backup(1'd0),
    .backup_marker(1'd0),
    .clk(clk_i),
    .rst(rst_i),
    .srst(srst_i),
    .wr_clk(wr_clk_i),
    .wr_rst(wr_rst_i),
    .rd_clk(rd_clk_i),
    .rd_rst(rd_rst_i),
    .din(din_i),
    .wr_en(wr_en_i),
    .rd_en(rd_en_i),
    .prog_empty_thresh({C_ADDR_WIDTH{1'b0}}),
    .prog_empty_thresh_assert({C_ADDR_WIDTH{1'b0}}),
    .prog_empty_thresh_negate({C_ADDR_WIDTH{1'b0}}),
    .prog_full_thresh({C_ADDR_WIDTH{1'b0}}),
    .prog_full_thresh_assert({C_ADDR_WIDTH{1'b0}}),
    .prog_full_thresh_negate({C_ADDR_WIDTH{1'b0}}),
    .int_clk(1'd0),
    .injectdbiterr(1'd0),
    .injectsbiterr(1'd0),
    .sleep(1'd0),
    .dout(dout_i),
    .full(full_i),
    .overflow(overflow_i),
    .empty(empty_i),
    .valid(valid_i),
    .underflow(underflow_i),
    .rd_data_count(rd_data_count_i),
    .wr_data_count(wr_data_count_i),
    .data_count(data_count_i),
    .wr_rst_busy(wr_rst_busy_i),
    .rd_rst_busy(rd_rst_busy_i),
    .m_aclk(1'd0),
    .s_aclk(1'd0),
    .s_aresetn(1'd0),
    .m_aclk_en(1'd0),
    .s_aclk_en(1'd0),
    .s_axi_awid(1'd0),
    .s_axi_awaddr(32'd0),
    .s_axi_awlen(8'd0),
    .s_axi_awsize(3'd0),
    .s_axi_awburst(2'd0),
    .s_axi_awlock(1'd0),
    .s_axi_awcache(4'd0),
    .s_axi_awprot(3'd0),
    .s_axi_awqos(4'd0),
    .s_axi_awregion(4'd0),
    .s_axi_awuser(1'd0),
    .s_axi_awvalid(1'd0),
    .s_axi_wid(1'd0),
    .s_axi_wdata(64'd0),
    .s_axi_wstrb(8'd0),
    .s_axi_wlast(1'd0),
    .s_axi_wuser(1'd0),
    .s_axi_wvalid(1'd0),
    .s_axi_bready(1'd0),
    .m_axi_awready(1'd0),
    .m_axi_wready(1'd0),
    .m_axi_bid(1'd0),
    .m_axi_bresp(2'd0),
    .m_axi_buser(1'd0),
    .m_axi_bvalid(1'd0),
    .s_axi_arid(1'd0),
    .s_axi_araddr(32'd0),
    .s_axi_arlen(8'd0),
    .s_axi_arsize(3'd0),
    .s_axi_arburst(2'd0),
    .s_axi_arlock(1'd0),
    .s_axi_arcache(4'd0),
    .s_axi_arprot(3'd0),
    .s_axi_arqos(4'd0),
    .s_axi_arregion(4'd0),
    .s_axi_aruser(1'd0),
    .s_axi_arvalid(1'd0),
    .s_axi_rready(1'd0),
    .m_axi_arready(1'd0),
    .m_axi_rid(1'd0),
    .m_axi_rdata(64'd0),
    .m_axi_rresp(2'd0),
    .m_axi_rlast(1'd0),
    .m_axi_ruser(1'd0),
    .m_axi_rvalid(1'd0),
    .s_axis_tvalid(1'd0),
    .s_axis_tdata(8'd0),
    .s_axis_tstrb(1'd0),
    .s_axis_tkeep(1'd0),
    .s_axis_tlast(1'd0),
    .s_axis_tid(1'd0),
    .s_axis_tdest(1'd0),
    .s_axis_tuser(4'd0),
    .m_axis_tready(1'd0),
    .axi_aw_injectsbiterr(1'd0),
    .axi_aw_injectdbiterr(1'd0),
    .axi_aw_prog_full_thresh(4'd0),
    .axi_aw_prog_empty_thresh(4'd0),
    .axi_w_injectsbiterr(1'd0),
    .axi_w_injectdbiterr(1'd0),
    .axi_w_prog_full_thresh({C_ADDR_WIDTH{1'b0}}),
    .axi_w_prog_empty_thresh({C_ADDR_WIDTH{1'b0}}),
    .axi_b_injectsbiterr(1'd0),
    .axi_b_injectdbiterr(1'd0),
    .axi_b_prog_full_thresh(4'd0),
    .axi_b_prog_empty_thresh(4'd0),
    .axi_ar_injectsbiterr(1'd0),
    .axi_ar_injectdbiterr(1'd0),
    .axi_ar_prog_full_thresh(4'd0),
    .axi_ar_prog_empty_thresh(4'd0),
    .axi_r_injectsbiterr(1'd0),
    .axi_r_injectdbiterr(1'd0),
    .axi_r_prog_full_thresh({C_ADDR_WIDTH{1'b0}}),
    .axi_r_prog_empty_thresh({C_ADDR_WIDTH{1'b0}}),
    .axis_injectsbiterr(1'd0),
    .axis_injectdbiterr(1'd0),
    .axis_prog_full_thresh({C_ADDR_WIDTH{1'b0}}),
    .axis_prog_empty_thresh({C_ADDR_WIDTH{1'b0}})
  );
                 
endmodule

`default_nettype wire
