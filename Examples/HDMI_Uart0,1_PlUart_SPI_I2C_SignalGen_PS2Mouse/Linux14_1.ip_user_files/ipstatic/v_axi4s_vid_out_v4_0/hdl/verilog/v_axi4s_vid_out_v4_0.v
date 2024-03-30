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
//  This is the top level module for the AXI4-Stream to Video-Out bridge.
//  The bridge is used to convert AXI4-Stream input to native video by 
//  synchronizing to the video timing generator input signals. An internal
//  fifo is used to absorb stalls in the AXI4-Stream input. The fifo supports
//  synchronous or asynchronous clocking modes with configurable fifo detph. 
//  The write enable logic of the fifo is based on the AXI4-Stream input signals. 
//  When the fifo is full the ready signal is de-asserted forcing backpressure 
//  on the stream. The fifo read enable logic is controlled by the synchronizer
//  module. The synchronizer can be configured in master or slave mode and
//  an intial fill level can be assigned to aid synchronization. 
//
//  Verilog-standard:  Verilog 2001
//--------------------------------------------------------------------------
//  Structure:
//    TOP_INST
//      COUPLER_INST
//        FIFO_INST
//      SYNC_INST
//      FORMATTER_INST
//--------------------------------------------------------------------------

`timescale 1ps/1ps
`default_nettype none
(* DowngradeIPIdentifiedWarnings="yes" *)

module v_axi4s_vid_out_v4_0_1 #(
  parameter C_FAMILY = "virtex6",         

  // Video Format
  parameter C_PIXELS_PER_CLOCK = 1,         // Pixels per clock [1,2,4]
  parameter C_COMPONENTS_PER_PIXEL = 3,     // Components per pixel [1,2,3,4]
  parameter C_S_AXIS_COMPONENT_WIDTH = 8,   // AXIS video component width [8,10,12,16]
  parameter C_NATIVE_COMPONENT_WIDTH = 8,   // Native video component width [8,10,12,16]
  parameter C_NATIVE_DATA_WIDTH = 24,       // Native video data width
  parameter C_S_AXIS_TDATA_WIDTH = 24,      // AXIS video tdata width

  // FIFO Settings
  parameter C_HAS_ASYNC_CLK = 0,            // Enable asyncronous clock domains
  parameter C_ADDR_WIDTH = 10,              // FIFO address width [5,10,11,12,13]

  // Timing Mode 
  parameter C_VTG_MASTER_SLAVE = 0,         // VTC timing mode, 1:Master Mode, 0:Slave Mode
  parameter C_HYSTERESIS_LEVEL = 12,        // Hysteresis level or intial fill level
  parameter C_SYNC_LOCK_THRESHOLD = 4       // Minimum of one frame required to acheive lock
) (
  // AXI4-Stream signals
  input   wire aclk,                        // AXI4-Stream clock
  input   wire aclken,                      // AXI4-Stream clock enable
  input   wire aresetn,                     // AXI4-Stream reset active low
  input   wire [C_S_AXIS_TDATA_WIDTH-1:0] s_axis_video_tdata , // AXI4-Stream data
  input   wire s_axis_video_tvalid,         // AXI4-Stream valid 
  output  wire s_axis_video_tready,         // AXI4-Stream ready 
  input   wire s_axis_video_tuser,          // AXI4-Stream tuser (SOF)
  input   wire s_axis_video_tlast,          // AXI4-Stream tlast (EOL)
  input   wire fid,                         // Field-id input, sampled on SOF
  
  // Native video signals
  input   wire vid_io_out_clk,              // Native video clock
  input   wire vid_io_out_ce,               // Native video clock enable
  input   wire vid_io_out_reset,            // Native video reset, active high
  output  wire vid_active_video,            // Native video data enable
  output  wire vid_vsync,                   // Native video vertical sync
  output  wire vid_hsync,                   // Native video horizontal sync
  output  wire vid_vblank,                  // Native video vertical blank
  output  wire vid_hblank,                  // Native video horizontal blank
  output  wire vid_field_id,                // Native video field-id 
  output  wire [C_NATIVE_DATA_WIDTH-1:0] vid_data, // Native video data 
  
  // VTG signals
  input   wire vtg_vsync,                   // VTG vertical sync
  input   wire vtg_hsync,                   // VTG horizontal sync
  input   wire vtg_vblank,                  // VTG vertical blank
  input   wire vtg_hblank,                  // VTG horizontal blank
  input   wire vtg_active_video,            // VTG data enable
  input   wire vtg_field_id,                // VTG field-id 
  output  wire vtg_ce,                      // VTG clock enable

  // Status signals
  output  wire locked,                      // Syncronizer locked status 
  output  wire overflow,                    // FIFO overflow status
  output  wire underflow,                   // FIFO underflow status
  output  wire [32-1:0] status              // General status 
);


  // Signal declarations 
  wire                            vid_clk = (C_HAS_ASYNC_CLK) ? vid_io_out_clk : aclk;
  wire                            vid_reset = (C_HAS_ASYNC_CLK) ? vid_io_out_reset : ~aresetn;
  wire                            vid_clken = vid_io_out_ce;
  wire [C_NATIVE_DATA_WIDTH -1:0] fifo_data;
  wire                            fifo_eol;
  wire                            fifo_sof;
  wire                            fifo_fid;
  wire [C_ADDR_WIDTH:0]           fifo_level_rd;
  wire                            fifo_rd_en;
  wire                            fifo_empty;

  // Module instances
  v_axi4s_vid_out_v4_0_1_coupler #(
    .C_FAMILY                 (C_FAMILY),
    .C_HAS_ASYNC_CLK          (C_HAS_ASYNC_CLK),
    .C_ADDR_WIDTH             (C_ADDR_WIDTH),
    .C_PIXELS_PER_CLOCK       (C_PIXELS_PER_CLOCK),
    .C_COMPONENTS_PER_PIXEL   (C_COMPONENTS_PER_PIXEL),
    .C_S_AXIS_COMPONENT_WIDTH (C_S_AXIS_COMPONENT_WIDTH),  
    .C_NATIVE_COMPONENT_WIDTH (C_NATIVE_COMPONENT_WIDTH),
    .C_S_AXIS_TDATA_WIDTH     (C_S_AXIS_TDATA_WIDTH), 
    .C_NATIVE_DATA_WIDTH      (C_NATIVE_DATA_WIDTH)
  ) COUPLER_INST (
    .VIDEO_OUT_CLK            (vid_clk),
    .VID_CE                   (vid_clken),
    .VID_RESET                (vid_reset),

    .ACLK                     (aclk),
    .ACLKEN                   (aclken),
    .ARESETN                  (aresetn),

    .FIFO_WR_DATA             ({fid,s_axis_video_tuser,s_axis_video_tlast,s_axis_video_tdata}),
    .FIFO_VALID               (s_axis_video_tvalid),
    .FIFO_READY               (s_axis_video_tready),
                 
    .FIFO_RD_DATA             (fifo_data),
    .FIFO_EOL                 (fifo_eol),
    .FIFO_SOF                 (fifo_sof),
    .FIFO_FIELD_ID            (fifo_fid),
    .FIFO_RD_EN               (fifo_rd_en),
    .FIFO_LEVEL_WR            (),
    .FIFO_LEVEL_RD            (fifo_level_rd),
    .FIFO_EMPTY               (fifo_empty),

    .FIFO_OVERFLOW            (overflow),
    .FIFO_UNDERFLOW           (underflow)
  );

  v_axi4s_vid_out_v4_0_1_sync #(
    .C_ADDR_WIDTH          (C_ADDR_WIDTH),  
    .C_HYSTERESIS_LEVEL    (C_HYSTERESIS_LEVEL),
    .C_VTG_MASTER_SLAVE    (C_VTG_MASTER_SLAVE),
    .C_SYNC_LOCK_THRESHOLD (C_SYNC_LOCK_THRESHOLD)
  ) SYNC_INST (
    .VID_OUT_CLK           (vid_clk),   
    .VID_CE                (vid_clken), 
    .VID_RESET             (vid_reset), 

    .FIFO_SOF              (fifo_sof), 
    .FIFO_EOL              (fifo_eol),
    .FIFO_FIELD_ID         (fifo_fid), 
    .FIFO_RD_LEVEL         (fifo_level_rd),
    .FIFO_EMPTY            (fifo_empty),
    .FIFO_RD_EN            (fifo_rd_en),   
    
    .VTG_VSYNC             (vtg_vsync),
    .VTG_HSYNC             (vtg_hsync),
    .VTG_FIELD_ID          (vtg_field_id),
    .VTG_ACTIVE_VIDEO      (vtg_active_video),
    .VTG_EN                (vtg_ce),

    .LOCKED                (locked),
    .STATUS                (status)
  );

  v_axi4s_vid_out_v4_0_1_formatter #(
    .C_NATIVE_DATA_WIDTH(C_NATIVE_DATA_WIDTH)
  )
  FORMATTER_INST
  (
    .VID_OUT_CLK      (vid_clk),
    .VID_CE           (vid_clken),
    .VID_RESET        (vid_reset),

    .FIFO_DATA        (fifo_data),
    .FIFO_RD_EN       (fifo_rd_en),

    .VTG_VSYNC        (vtg_vsync),
    .VTG_HSYNC        (vtg_hsync),
    .VTG_VBLANK       (vtg_vblank),
    .VTG_HBLANK       (vtg_hblank),
    .VTG_ACTIVE_VIDEO (vtg_active_video),
    .VTG_FIELD_ID     (vtg_field_id),

    .LOCKED           (locked),
  
    .VID_ACTIVE_VIDEO (vid_active_video),
    .VID_VSYNC        (vid_vsync),
    .VID_HSYNC        (vid_hsync),
    .VID_VBLANK       (vid_vblank),
    .VID_HBLANK       (vid_hblank),	
    .VID_FIELD_ID     (vid_field_id),
    .VID_DATA         (vid_data)
  );

endmodule

`default_nettype wire
