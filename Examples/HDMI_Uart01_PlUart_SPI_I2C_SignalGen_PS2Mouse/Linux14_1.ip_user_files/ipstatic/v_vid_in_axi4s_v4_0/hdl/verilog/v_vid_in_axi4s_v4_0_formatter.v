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
//  This module is the data formatter for the Video-In to AXI4-Stream bridge.
//  The data formater generates the start of frame (SOF) and end of line (EOL)
//  signals associated with a video data sample based on incoming native video
//  timing. The video data is concatenated with the SOF/EOL signals to produce
//  the fifo write data and the parallel fifo write enable.
//
//  Verilog-standard:  Verilog 2001
//--------------------------------------------------------------------------

`timescale 1ps/1ps
`default_nettype none
(* DowngradeIPIdentifiedWarnings="yes" *)

module v_vid_in_axi4s_v4_0_1_formatter #( 
  parameter  C_NATIVE_DATA_WIDTH = 24
) (
  // System signals
  input  wire VID_IN_CLK,           // Native video clock 
  input  wire VID_RESET,            // Native video reset
  input  wire VID_CE,               // Native video clock enable

  // Video input signals
  input  wire VID_ACTIVE_VIDEO,     // Native video input data enable
  input  wire VID_VBLANK,           // Native video input vertical blank
  input  wire VID_HBLANK,           // Native video input horizontal blank
  input  wire VID_VSYNC,            // Native video input vertical sync
  input  wire VID_HSYNC,            // Native video input horizontal sync
  input  wire VID_FIELD_ID,         // Native video input field-id
  input  wire [C_NATIVE_DATA_WIDTH-1:0] VID_DATA, // Native video input data 
  
  // Video timing detector signals
  output wire VTD_ACTIVE_VIDEO,     // Native video output data enable
  output wire VTD_VBLANK,           // Native video output vertical blank
  output wire VTD_HBLANK,           // Native video output horizontal blank
  output wire VTD_VSYNC,            // Native video output vertical sync
  output wire VTD_HSYNC,            // Native video output horizontal sync
  output wire VTD_FIELD_ID,         // Native video output field-id
  input  wire VTD_LOCKED,           // Native video locked signal from VTD
  
  // FIFO write signals
  output wire [C_NATIVE_DATA_WIDTH+2:0] FIFO_WR_DATA, // FIFO write data
  output wire FIFO_WR_EN            // FIFO write enable
);

  // Wire and register declarations
  reg  de_1 = 0;         
  reg  vblank_1 = 0;
  reg  hblank_1 = 0;
  reg  vsync_1 = 0;  
  reg  hsync_1 = 0;
  reg  [C_NATIVE_DATA_WIDTH -1:0] data_1 = 0;  
  reg  de_2 = 0;  
  reg  v_blank_sync_2 = 0;  
  reg  [C_NATIVE_DATA_WIDTH -1:0] data_2 = 0;  
  reg  de_3 = 0;  // DE output register
  reg  [C_NATIVE_DATA_WIDTH -1:0] data_3 = 0;  // data output register
  reg  vert_blanking_intvl = 0; // SR, reset by DE rising
  reg  field_id_1 = 0;
  reg  field_id_2 = 0;
  reg  field_id_3 = 0;
  
  wire v_blank_sync_1;  // vblank or vsync
  wire de_rising;                   
  wire de_falling;      
  wire vsync_rising;
  reg  sof;
  reg  sof_1;
  reg  eol;   
  reg  vtd_locked;
  wire sof_rising;

  // Assignments
  assign FIFO_WR_DATA     = {field_id_3,sof_1,eol,data_3};
  assign FIFO_WR_EN       = de_3 & ~VID_RESET & vtd_locked;
  assign VTD_ACTIVE_VIDEO = de_1;
  assign VTD_VBLANK       = vblank_1;
  assign VTD_HBLANK       = hblank_1;
  assign VTD_VSYNC        = vsync_1;
  assign VTD_HSYNC        = hsync_1;
  assign VTD_FIELD_ID     = field_id_1;

  assign v_blank_sync_1 = vblank_1 || vsync_1;
  assign de_rising  = de_1  && !de_2;  
  assign de_falling = !de_1 && de_2;  
  assign vsync_rising = v_blank_sync_1 && !v_blank_sync_2;    
  assign sof_rising = sof & ~sof_1;

  // VTD locked process
  always @(posedge VID_IN_CLK) begin
    if(VID_RESET | ~VTD_LOCKED) begin
      vtd_locked <= 1'b0;
    end else if(VID_CE) begin
      vtd_locked <= (sof_rising & VTD_LOCKED) ? 1'b1 : vtd_locked;
    end
  end
  
  // input, output, and delay registers
  always @ (posedge VID_IN_CLK) begin
    if(VID_RESET) begin
      de_1           <= 1'b0;  
      de_2           <= 1'b0; 
      de_3           <= 1'b0; 
      vblank_1       <= 1'b0; 
      hblank_1       <= 1'b0; 
      vsync_1        <= 1'b0; 
      hsync_1        <= 1'b0; 
      field_id_1     <= 1'b0; 
      field_id_2     <= 1'b0; 
      field_id_3     <= 1'b0; 
      data_1         <= {C_NATIVE_DATA_WIDTH{1'b0}}; 
      data_2         <= {C_NATIVE_DATA_WIDTH{1'b0}}; 
      data_3         <= {C_NATIVE_DATA_WIDTH{1'b0}}; 
      v_blank_sync_2 <= 1'b0; 
      eol            <= 1'b0; 
      sof            <= 1'b0; 
      sof_1          <= 1'b0;
    end else if(VID_CE) begin 
      de_1           <= VID_ACTIVE_VIDEO;
      de_2           <= de_1;    
      de_3           <= de_2;    
      vblank_1       <= VID_VBLANK;
      hblank_1       <= VID_HBLANK;
      vsync_1        <= VID_VSYNC;
      hsync_1        <= VID_HSYNC;
      field_id_1     <= VID_FIELD_ID;
      field_id_2     <= field_id_1;
      field_id_3     <= field_id_2;
      data_1         <= VID_DATA; 
      data_2         <= data_1;
      data_3         <= data_2;
      v_blank_sync_2 <= v_blank_sync_1; 
      eol            <= de_falling;
      sof            <= de_rising && vert_blanking_intvl;
      sof_1          <= sof;
    end      
  end 
  
  // Vertical back porch SR register
  always @ (posedge VID_IN_CLK) begin
    if (VID_CE) begin
      if (vsync_rising)   // falling edge of vsync
        vert_blanking_intvl <= 1;
      else if (de_rising)        // rising edge of data enable
        vert_blanking_intvl <= 0;
    end
  end
  
endmodule

`default_nettype wire

