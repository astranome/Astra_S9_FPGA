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
//  This is the top level module for the Video-In to AXI4-Stream bridge. 
//  The bridge is used to convert native video input to AXI4-Stream output.
//  AXI4-Stream SOF (TUSER[0]) and EOL (TLAST) are generated using native
//  vsync and active video signals. Input samples are pushed onto the ouput
//  as soon as they become available. An internal fifo is used to buffer
//  data samples when back-pressure is asserted on the AXI4-Stream channel. The 
//  fifo supports synchronous or asynchronous clocking modes with configurable
//  fifo depth. 
//
//  Verilog-standard:  Verilog 2001
//--------------------------------------------------------------------------
//  Structure:
//    TOP_INST
//      FORMATTER_INST
//      COUPLER_INST
//        FIFO_INST
//--------------------------------------------------------------------------

`timescale 1ps/1ps
`default_nettype none
(* DowngradeIPIdentifiedWarnings="yes" *)

module v_vid_in_axi4s_v4_0_1 #(
  parameter C_FAMILY = "virtex6",         

  // Video Format
  parameter C_PIXELS_PER_CLOCK = 1,       // Pixels per clock [1,2,4]
  parameter C_COMPONENTS_PER_PIXEL = 3,   // Components per pixel [1,2,3,4]
  parameter C_M_AXIS_COMPONENT_WIDTH = 8, // AXIS video component width [8,10,12,16]
  parameter C_NATIVE_COMPONENT_WIDTH = 8, // Native video component width [8,10,12,16]
  parameter C_NATIVE_DATA_WIDTH = 24,     // Native video data width
  parameter C_M_AXIS_TDATA_WIDTH = 24,    // AXIS video tdata width

  // FIFO Settings
  parameter C_HAS_ASYNC_CLK = 0,          // Enable asyncronous clock domains
  parameter C_ADDR_WIDTH = 10             // FIFO address width [5,10,11,12,13]
) (
  // Native video signals
  input  wire vid_io_in_clk,              // Native video clock
  input  wire vid_io_in_ce,               // Native video clock enable
  input  wire vid_io_in_reset,            // Native video reset, active high
  input  wire vid_active_video,           // Native video data enable
  input  wire vid_vblank,                 // Native video vertical blank
  input  wire vid_hblank,                 // Native video horizontal blank
  input  wire vid_vsync,                  // Native video vertical sync
  input  wire vid_hsync,                  // Native video horizontal sync
  input  wire vid_field_id,               // Native video field-id
  input  wire [C_NATIVE_DATA_WIDTH-1:0] vid_data, // Native video data 

  // AXI4-Stream signals
  input  wire aclk,                       // AXI4-Stream clock
  input  wire aclken,                     // AXI4-Stream clock enable
  input  wire aresetn,                    // AXI4-Stream reset, active low 
  output wire [C_M_AXIS_TDATA_WIDTH-1:0] m_axis_video_tdata, // AXI4-Stream data
  output wire m_axis_video_tvalid,        // AXI4-Stream valid 
  input  wire m_axis_video_tready,        // AXI4-Stream ready 
  output wire m_axis_video_tuser,         // AXI4-Stream tuser (SOF)
  output wire m_axis_video_tlast,         // AXI4-Stream tlast (EOL)
  output wire fid,                        // Field-id output

  // Video timing detector signals
  output wire vtd_active_video,           // VTD data enable
  output wire vtd_vblank,                 // VTD vertical blank
  output wire vtd_hblank,                 // VTD horizontal blank
  output wire vtd_vsync,                  // VTD vertical sync
  output wire vtd_hsync,                  // VTD horizontal sync
  output wire vtd_field_id,               // VTD field-id
  
  // FIFO status signals
  output wire overflow,                   // FIFO overflow status
  output wire underflow,                  // FIFO underflow status

  // Video timing detector locked
  input  wire axis_enable                 // AXI4-Stream locked
);

  // Register and Wire Declarations
  wire                              vid_clk = (C_HAS_ASYNC_CLK) ? vid_io_in_clk : aclk;
  wire                              vid_reset = (C_HAS_ASYNC_CLK) ? vid_io_in_reset : ~aresetn;
  wire   [C_NATIVE_DATA_WIDTH+2:0]  idf_data;
  wire                              idf_de;  
  wire   [C_M_AXIS_TDATA_WIDTH+2:0] rd_data;

  // Assignments
  assign  m_axis_video_tdata  = rd_data[C_M_AXIS_TDATA_WIDTH -1:0];
  assign  m_axis_video_tlast  = rd_data[C_M_AXIS_TDATA_WIDTH];   
  assign  m_axis_video_tuser  = rd_data[C_M_AXIS_TDATA_WIDTH +1];
  assign  fid                 = rd_data[C_M_AXIS_TDATA_WIDTH +2];

  // Module instances
  v_vid_in_axi4s_v4_0_1_formatter #(
    .C_NATIVE_DATA_WIDTH(C_NATIVE_DATA_WIDTH)
  ) FORMATTER_INST (
    .VID_IN_CLK       (vid_clk),
    .VID_RESET        (vid_reset),
    .VID_CE           (vid_io_in_ce),

    .VID_ACTIVE_VIDEO (vid_active_video),
    .VID_VBLANK       (vid_vblank),
    .VID_HBLANK       (vid_hblank),
    .VID_VSYNC        (vid_vsync),
    .VID_HSYNC        (vid_hsync),
    .VID_FIELD_ID     (vid_field_id),
    .VID_DATA         (vid_data),
    
    .VTD_ACTIVE_VIDEO (vtd_active_video),
    .VTD_VBLANK       (vtd_vblank),
    .VTD_HBLANK       (vtd_hblank),
    .VTD_VSYNC        (vtd_vsync),
    .VTD_HSYNC        (vtd_hsync),
    .VTD_FIELD_ID     (vtd_field_id),
    .VTD_LOCKED       (axis_enable),

    .FIFO_WR_DATA     (idf_data),
    .FIFO_WR_EN       (idf_de)
  );

  v_vid_in_axi4s_v4_0_1_coupler #(
    .C_FAMILY                 (C_FAMILY),
    .C_HAS_ASYNC_CLK          (C_HAS_ASYNC_CLK),
    .C_ADDR_WIDTH             (C_ADDR_WIDTH),
    .C_PIXELS_PER_CLOCK       (C_PIXELS_PER_CLOCK),
    .C_COMPONENTS_PER_PIXEL   (C_COMPONENTS_PER_PIXEL),
    .C_M_AXIS_COMPONENT_WIDTH (C_M_AXIS_COMPONENT_WIDTH),  
    .C_NATIVE_COMPONENT_WIDTH (C_NATIVE_COMPONENT_WIDTH),
    .C_M_AXIS_TDATA_WIDTH     (C_M_AXIS_TDATA_WIDTH), 
    .C_NATIVE_DATA_WIDTH      (C_NATIVE_DATA_WIDTH)
  ) COUPLER_INST (
    .VID_IN_CLK     (vid_clk),
    .VID_RESET      (vid_reset),
    .VID_CE         (vid_io_in_ce),

    .ACLK           (aclk),
    .ACLKEN         (aclken),
    .ARESETN        (aresetn),

    .FIFO_WR_DATA   (idf_data),
    .FIFO_WR_EN     (idf_de),

    .FIFO_RD_DATA   (rd_data),
    .FIFO_VALID     (m_axis_video_tvalid),
    .FIFO_READY     (m_axis_video_tready),

    .FIFO_OVERFLOW  (overflow),
    .FIFO_UNDERFLOW (underflow)
  );
  
endmodule

`default_nettype wire

