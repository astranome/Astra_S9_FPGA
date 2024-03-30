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
//  This module is the data formatter for the AXI4-Stream to video-out bridge.
//  The delayed video timing generator input signals are passed to the output 
//  when the synchronizer is LOCKED.
//
//  Verilog-standard:  Verilog 2001
//--------------------------------------------------------------------------

`timescale 1ps/1ps
`default_nettype none
(* DowngradeIPIdentifiedWarnings="yes" *)

module v_axi4s_vid_out_v4_0_1_formatter #(
  parameter  C_NATIVE_DATA_WIDTH = 24
) (
  input  wire VID_OUT_CLK,        // Native video clock
  input  wire VID_CE,             // Native video clock enable
  input  wire VID_RESET,          // Native video reset

  // FIFO signals
  input  wire [C_NATIVE_DATA_WIDTH-1:0] FIFO_DATA, // FIFO read data
  input  wire FIFO_RD_EN,         // FIFO read enable

  // VTG timing signals
  input  wire VTG_VSYNC,          // VTG vertical sync
  input  wire VTG_HSYNC,          // VTG horizontal sync
  input  wire VTG_VBLANK,         // VTG vertical blank
  input  wire VTG_HBLANK,         // VTG horizontal blank
  input  wire VTG_ACTIVE_VIDEO,   // VTG active video
  input  wire VTG_FIELD_ID,       // VTG field-id

  // Synchronizer signals
  input  wire LOCKED,             // Synchronizer locked

  // Native video signals
  output  wire VID_ACTIVE_VIDEO,  // Native video data enable
  output  wire VID_VSYNC,         // Native video vertical sync
  output  wire VID_HSYNC,         // Native video horizontal sync
  output  wire VID_VBLANK,        // Native video vertical blank
  output  wire VID_HBLANK,        // Native video horizontal blank
  output  wire VID_FIELD_ID,      // Native video field-id
  output  wire [C_NATIVE_DATA_WIDTH-1:0] VID_DATA // Native video data
);

  // Signal Declarations
  reg [C_NATIVE_DATA_WIDTH -1:0] in_data_mux = {C_NATIVE_DATA_WIDTH{1'b0}}; // Output disabling mux
  reg in_de_mux              = 1'b0;  
  reg in_vsync_mux           = 1'b0;  
  reg in_hsync_mux           = 1'b0;  
  reg in_vblank_mux          = 1'b0;  
  reg in_hblank_mux          = 1'b0; 
  reg in_field_id_mux        = 1'b0; 
  reg fivid_reset_full_frame = 1'b0;  // activates at start of full frame after reset.
  reg vtg_vblank_1           = 1'b0;  // delayed vblank 
  reg vblank_rising          = 1'b0;  //detects rising edge of vblank 
  
  
  // Assignments
  assign VID_DATA           = in_data_mux;
  assign VID_VSYNC          = in_vsync_mux;
  assign VID_HSYNC          = in_hsync_mux;
  assign VID_VBLANK         = in_vblank_mux;
  assign VID_HBLANK         = in_hblank_mux;
  assign VID_ACTIVE_VIDEO   = in_de_mux;
  assign VID_FIELD_ID       = in_field_id_mux;

  // Detect rising edge of vblank
  always @ (posedge VID_OUT_CLK) begin
    if (VID_CE) begin
      vtg_vblank_1 <= VTG_VBLANK;
      vblank_rising <= VTG_VBLANK && !vtg_vblank_1;
    end
  end

  // Detect start of full frame after reset and LOCKED
  always @ (posedge VID_OUT_CLK)begin
    if (VID_RESET || !LOCKED) begin
     fivid_reset_full_frame <= 0;
    end else if (vblank_rising & VID_CE) begin
     fivid_reset_full_frame <= 1;
    end 
  end	 
  
  //  Input Mux.  Zero outputs when not LOCKED and not full frame
  always @ (posedge VID_OUT_CLK)begin
    if (!LOCKED || VID_RESET || !fivid_reset_full_frame) begin
      in_de_mux     <= 0;
      in_vsync_mux  <= 0;
      in_hsync_mux  <= 0;    
      in_vblank_mux <= 0;
      in_hblank_mux <= 0;
      in_field_id_mux <= 0;    
      in_data_mux   <= 0;
    end else if (VID_CE) begin
      in_de_mux     <= VTG_ACTIVE_VIDEO;
      in_vsync_mux  <= VTG_VSYNC;
      in_hsync_mux  <= VTG_HSYNC;
      in_vblank_mux <= VTG_VBLANK;
      in_hblank_mux <= VTG_HBLANK;
      in_field_id_mux <= VTG_FIELD_ID;
      if (FIFO_RD_EN)
        in_data_mux  <= FIFO_DATA;
    end
  end

endmodule

`default_nettype wire
