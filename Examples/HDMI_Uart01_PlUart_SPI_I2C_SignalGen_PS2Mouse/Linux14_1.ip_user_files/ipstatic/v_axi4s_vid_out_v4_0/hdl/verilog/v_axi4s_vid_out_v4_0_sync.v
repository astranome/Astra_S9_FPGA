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
//----------------------------------------------------------
//--------------------------------------------------------------------------
//  Module Description:
//  This module is the synchronizer for the AXI4-Stream to video-out bridge.
//
//  Verilog-standard:  Verilog 2001
//--------------------------------------------------------------------------

`timescale 1ps/1ps
`default_nettype wire
(* DowngradeIPIdentifiedWarnings="yes" *)

module v_axi4s_vid_out_v4_0_1_sync #( 
  parameter C_ADDR_WIDTH = 10,                       // FIFO address width [5,10,11,12,13]
  parameter C_VTG_MASTER_SLAVE = 0,                  // VTC timing mode, 1:Master Mode, 0:Slave Mode
  parameter C_HYSTERESIS_LEVEL = 12,                 // Hysteresis level or intial fill level
  parameter C_SYNC_LOCK_THRESHOLD = 4                // Minimum of one frame required to acheive lock
) (
  input  wire                      VID_OUT_CLK,      // Native video clock
  input  wire                      VID_CE,           // Native video clock enable
  input  wire                      VID_RESET,        // Native video resetn

  // FIFO signals
  input  wire                      FIFO_SOF,         // FIFO start of frame
  input  wire                      FIFO_EOL,         // FIFO end of line
  input  wire                      FIFO_FIELD_ID,    // FIFO field-id
  input  wire [C_ADDR_WIDTH:0]     FIFO_RD_LEVEL,    // FIFO read Level
  input  wire                      FIFO_EMPTY,       // FIFO emtpy
  output wire                      FIFO_RD_EN,       // FIFO read enable 
  
  // VTG signals
  input  wire                      VTG_VSYNC,        // VTG vertical sync
  input  wire                      VTG_HSYNC,        // VTG horizontal sync
  input  wire                      VTG_FIELD_ID,     // VTG field-id
  input  wire                      VTG_ACTIVE_VIDEO, // VTG data enable
  output wire                      VTG_EN,           // VTG enable
 
  // Status signals
  output wire                      LOCKED,
  output wire [32-1:0]             STATUS
);

  // Local Parameters
  localparam [32-1:0] C_SYNC_VTG_LAG_MAX       = 2**C_ADDR_WIDTH;

  localparam [4-1:0]  C_SYNC_IDLE              = 0,  // Idle State

                      C_SYNC_CALN_SOF_VTG      = 1,  // Coarse Align, VTG SOF
                      C_SYNC_CALN_SOF_FIFO     = 2,  // Coarse Align, FIFO SOF

                      C_SYNC_FALN_EOL_LEADING  = 3,  // Fine Align, VTG Leading FIFO EOL
                      C_SYNC_FALN_EOL_LAGGING  = 4,  // Fine Align, VTG Lagging FIFO EOL
                      C_SYNC_FALN_SOF_LEADING  = 5,  // Fine Align, VTG Leading FIFO SOF
                      C_SYNC_FALN_SOF_LAGGING  = 6,  // Fine Align, VTG Lagging FIFO SOF
                      C_SYNC_FALN_ACTIVE       = 7,  // Fine Align, Running
                      C_SYNC_FALN_LOCK         = 8,  // Fine Align, Locked

                      C_SYNC_LALN_EOL_LEADING  = 9,  // Lost Align, VTG Leading FIFO EOL 
                      C_SYNC_LALN_EOL_LAGGING  = 10, // Lost Align, VTG Lagging FIFO EOL 
                      C_SYNC_LALN_SOF_LEADING  = 11, // Lost Align, VTG Leading FIFO SOF
                      C_SYNC_LALN_SOF_LAGGING  = 12; // Lost Align, VTG Lagging FIFO SOF
             
  // State Signals
  reg  [4-1:0]   state = C_SYNC_IDLE;
  reg  [4-1:0]   state_dly = C_SYNC_IDLE;
  reg  [4-1:0]   next_state;

  // Status Signals
  reg  [32-1:0]  status_reg = 32'h00000000;

  // FIFO SOF/EOL Signals
  reg  sof_ignore = 1'b1;
  reg  fifo_sof_dly = 1'b0; 
  reg  fifo_eol_dly = 1'b0;
  reg  fifo_fid_dly = 1'b0;
  reg  fifo_eol_re_dly = 1'b0;
  wire fifo_eol_fe = fifo_eol_dly & ~FIFO_EOL;
  wire fifo_eol_re = ~fifo_eol_dly & FIFO_EOL;
  wire fifo_sof_fe = fifo_sof_dly & ~FIFO_SOF;
  wire fifo_sof_re = ~fifo_sof_dly & FIFO_SOF;

  // FIFO Flush Signals
  wire fifo_flush_eol;
  wire fifo_force_rd = fifo_flush_eol;

  // VTG SOF/EOL Signals
  reg  vtg_de_dly = 1'b0;          
  reg  vtg_vsync_dly = 1'b0;          
  reg  vtg_vsync_bp = 1'b0;

  wire vtg_vsync_re = ~vtg_vsync_dly & VTG_VSYNC;
  wire vtg_vsync_fe = vtg_vsync_dly & ~VTG_VSYNC;
  wire vtg_de_re = ~vtg_de_dly & VTG_ACTIVE_VIDEO;
  wire vtg_de_fe = vtg_de_dly & ~VTG_ACTIVE_VIDEO;
  
  wire vtg_sof = vtg_de_re & vtg_vsync_bp;
  wire vtg_eol_dly = vtg_de_fe;
  reg  vtg_sof_dly = 1'b0;
  reg  vtg_fid_dly = 1'b0;

  // VTG Lag Signals
  reg  [32-1:0]  vtg_lag_threshold = C_HYSTERESIS_LEVEL; 
  reg  [32-1:0]  vtg_lag = 0; 

  // SOF Count Signals
  reg [8-1:0] vtg_sof_cnt = 8'h00;
  reg [8-1:0] fifo_sof_cnt = 8'h00;

  // EOL Count Signals
  reg [13-1:0] fifo_eol_cnt = 13'h0000;
  reg [13-1:0] fifo_eol_cnt_dly = 13'h0000;
  reg fifo_eol_error = 1'b0;
  
  // Pix Count Signals
  reg [13-1:0] fifo_pix_cnt = 13'h0000;
  reg [13-1:0] fifo_pix_cnt_dly = 13'h0000;
  reg fifo_pix_error = 1'b0;

  // Assignments
  assign fifo_flush_eol = (state == C_SYNC_FALN_EOL_LEADING); 
  assign LOCKED = (state == C_SYNC_FALN_LOCK);
  assign STATUS = status_reg;

  generate if(C_VTG_MASTER_SLAVE == 0) begin : gen_fifo_vtg_en_slave_mode
    assign VTG_EN = VID_CE &  
                    ((state == C_SYNC_IDLE) ||
                    (state == C_SYNC_FALN_ACTIVE) ||
                    (state == C_SYNC_FALN_EOL_LAGGING) ||
                    (state == C_SYNC_FALN_SOF_LAGGING) ||
                    (state == C_SYNC_FALN_LOCK));
  end else if(C_VTG_MASTER_SLAVE == 1) begin : gen_fifo_vtg_en_master_mode
    assign VTG_EN = VID_CE;
  end endgenerate

  generate if(C_VTG_MASTER_SLAVE == 0) begin : gen_fifo_rd_en_slave_mode
    assign FIFO_RD_EN = VID_CE & 
                        ((fifo_force_rd) ||
                        (state == C_SYNC_IDLE) ||
                        (state == C_SYNC_CALN_SOF_VTG) ||
                        ((state > C_SYNC_CALN_SOF_FIFO) & VTG_ACTIVE_VIDEO));
  end else if(C_VTG_MASTER_SLAVE == 1) begin : gen_fifo_rd_en_master_mode
    assign FIFO_RD_EN = VID_CE &
                        ((state == C_SYNC_IDLE) ||
                        ((state >= C_SYNC_FALN_EOL_LEADING) & VTG_ACTIVE_VIDEO));
  end endgenerate

  // Status Process
  always @(posedge VID_OUT_CLK) begin
    if(VID_RESET) begin
      status_reg <= 32'h00000000;
    end else if(VID_CE) begin
      state_dly <= state;
      if(state_dly != state) begin
        case(state)
        C_SYNC_IDLE:             status_reg[0]  <= 1'b1;
        C_SYNC_CALN_SOF_VTG:     status_reg[1]  <= 1'b1;
        C_SYNC_CALN_SOF_FIFO:    status_reg[2]  <= 1'b1;
        C_SYNC_FALN_EOL_LEADING: status_reg[3]  <= 1'b1;
        C_SYNC_FALN_EOL_LAGGING: status_reg[4]  <= 1'b1;
        C_SYNC_FALN_SOF_LEADING: status_reg[5]  <= 1'b1;
        C_SYNC_FALN_SOF_LAGGING: status_reg[6]  <= 1'b1;
        C_SYNC_FALN_ACTIVE:      status_reg[7]  <= 1'b1;
        C_SYNC_FALN_LOCK:        status_reg[8]  <= 1'b1;
        C_SYNC_LALN_EOL_LEADING: status_reg[9]  <= 1'b1;
        C_SYNC_LALN_EOL_LAGGING: status_reg[10] <= 1'b1;
        C_SYNC_LALN_SOF_LEADING: status_reg[11] <= 1'b1;
        C_SYNC_LALN_SOF_LAGGING: status_reg[12] <= 1'b1;
        endcase
      end
      status_reg[13] <= fifo_pix_error;
      status_reg[14] <= fifo_eol_error;
      status_reg[C_ADDR_WIDTH+16-1:16] <= vtg_lag;
    end
  end

  // FIFO Signal Delay Process
  always @(posedge VID_OUT_CLK) begin
    if(VID_RESET) begin
      fifo_sof_dly <= 1'b0; 
      fifo_eol_dly <= 1'b0;
      fifo_fid_dly <= 1'b0;
      fifo_eol_re_dly <= 1'b0;
    end else if(VID_CE) begin
      fifo_sof_dly <= FIFO_SOF; 
      fifo_eol_dly <= FIFO_EOL;
      fifo_fid_dly <= FIFO_FIELD_ID;
      fifo_eol_re_dly <= fifo_eol_re;
    end
  end

  // SOF Ignore
  // - Ignore the first SOF
  always @(posedge VID_OUT_CLK) begin
    if(VID_RESET || state==C_SYNC_IDLE) begin
      sof_ignore <= 1'b1;
    end else if(VID_CE) begin
      if(fifo_eol_cnt > 13'h0000 && ~FIFO_FIELD_ID)
        sof_ignore <= 1'b0;
    end
  end
  
  // VTG Signal Delay Process
  always @(posedge VID_OUT_CLK) begin
    if(VID_RESET) begin
      vtg_de_dly <= 1'b0;
      vtg_vsync_dly <= 1'b0;
      vtg_sof_dly <= 1'b0;
      vtg_fid_dly <= 1'b0;
    end else if(VID_CE) begin
      vtg_de_dly <= VTG_ACTIVE_VIDEO;
      vtg_vsync_dly <= VTG_VSYNC;
      vtg_sof_dly <= vtg_sof;
      vtg_fid_dly <= VTG_FIELD_ID;
    end
  end

  // VTG Backporch Process
  always @(posedge VID_OUT_CLK) begin
    if(VID_RESET || vtg_de_dly) begin
      vtg_vsync_bp <= 1'b0;
    end else if(VID_CE) begin
      if(vtg_vsync_fe)
        vtg_vsync_bp <= 1'b1;
    end
  end

  // VTG Lag Process
  // - During fine alignment track the VTG lag
  always @(posedge VID_OUT_CLK) begin
    if(VID_RESET || state == C_SYNC_IDLE) begin
      vtg_lag <= vtg_lag_threshold;
    end else if(VID_CE) begin
      if((state == C_SYNC_FALN_EOL_LEADING) || (state == C_SYNC_FALN_SOF_LEADING)) begin
        vtg_lag <= vtg_lag + 1'b1;
      end
    end
  end

  // SOF Count Process
  always @(posedge VID_OUT_CLK) begin
    if(VID_RESET || state < C_SYNC_FALN_ACTIVE) begin
      vtg_sof_cnt <= 8'h0;
      fifo_sof_cnt <= 8'h0;
    end else if(VID_CE) begin
      if(vtg_sof_dly)
        vtg_sof_cnt <= vtg_sof_cnt + 1'b1;
      if(fifo_sof_fe)
        fifo_sof_cnt <= fifo_sof_cnt + 1'b1;
    end
  end

  // EOL Count Process
  always @(posedge VID_OUT_CLK) begin
    if(VID_RESET || state < C_SYNC_CALN_SOF_FIFO) begin
      fifo_eol_cnt <= 13'h0000;
      fifo_eol_cnt_dly <= 13'h0000;
    end else if(VID_CE) begin
      if(fifo_sof_fe) begin
        fifo_eol_cnt <= 13'h0000;
        fifo_eol_cnt_dly <= fifo_eol_cnt;
      end else if(fifo_eol_re_dly) begin
        fifo_eol_cnt <= fifo_eol_cnt + 1'b1;
      end
    end
  end

  // EOL Error Process
  // - Asserted when there is a mismatch in the number of lines 
  // between consecutive frames
  always @(posedge VID_OUT_CLK) begin
    if(VID_RESET) begin
      fifo_eol_error <= 1'b0;
    end else if(VID_CE) begin
      if(fifo_sof_fe && (fifo_eol_cnt_dly > 0) && (fifo_eol_cnt != fifo_eol_cnt_dly)) 
        fifo_eol_error <= 1'b1;
    end
  end

  // Pixel Count Process
  always @(posedge VID_OUT_CLK) begin
    if(VID_RESET || state < C_SYNC_CALN_SOF_FIFO) begin
      fifo_pix_cnt <= 13'h0000;
      fifo_pix_cnt_dly <= 13'h0000;
    end else if(VID_CE) begin
      if(fifo_eol_re_dly) begin
        fifo_pix_cnt <= 13'h0000;
        if(fifo_eol_cnt > 0 || fifo_pix_cnt_dly > 0)
          fifo_pix_cnt_dly <= fifo_pix_cnt;
      end else if(FIFO_RD_EN && ~FIFO_EMPTY) begin
        fifo_pix_cnt <= fifo_pix_cnt + 1'b1;
      end
    end
  end

  // Pixel Error Process
  // - Asserted when there is a mismatch in the number of active pixels
  // between consecutive lines
  // - Cleared every SOF
  always @(posedge VID_OUT_CLK) begin
    if(VID_RESET) begin
      fifo_pix_error <= 1'b0;
    end else if(VID_CE) begin
      if(fifo_eol_re_dly && (fifo_pix_cnt_dly > 0) && (fifo_pix_cnt != fifo_pix_cnt_dly))
        fifo_pix_error <= 1'b1;
      else if(fifo_sof_fe)
        fifo_pix_error <= 1'b0;
    end
  end 

  // Current State Process
  always @(posedge VID_OUT_CLK) begin
    if(VID_RESET)
      state <= C_SYNC_IDLE;
    else if(VID_CE) 
      state <= next_state;
  end

  // Next State Process
  generate if(C_VTG_MASTER_SLAVE == 0) begin : gen_sync_slave_mode
    always @(*) begin
      next_state = C_SYNC_IDLE;
  
      if(VID_RESET) begin
        next_state = C_SYNC_IDLE;
      end else begin
        case(state) 
  
          // Wait for VTG SOF
          C_SYNC_IDLE: begin
            if(vtg_sof && ~VTG_FIELD_ID)
              next_state = C_SYNC_CALN_SOF_VTG;
            else
              next_state = C_SYNC_IDLE;
          end  
  
          // Wait for FIFO SOF
          // - If the intial fill level is set to zero skip directly to fine alignment
          C_SYNC_CALN_SOF_VTG: begin
            if(FIFO_SOF && ~FIFO_FIELD_ID && (vtg_lag_threshold > 0))
              next_state = C_SYNC_CALN_SOF_FIFO;
            else if(FIFO_SOF && ~FIFO_FIELD_ID)
              next_state = C_SYNC_FALN_ACTIVE;
            else
              next_state = C_SYNC_CALN_SOF_VTG;
          end
  
          // Wait for FIFO Fill 
          C_SYNC_CALN_SOF_FIFO: begin
            if(FIFO_RD_LEVEL >= vtg_lag_threshold)
              next_state = C_SYNC_FALN_ACTIVE;
            else
              next_state = C_SYNC_CALN_SOF_FIFO;
          end
          
          // Fine Align Active
          C_SYNC_FALN_ACTIVE: begin
            if(vtg_eol_dly && ~fifo_eol_re_dly)
              next_state = C_SYNC_FALN_EOL_LEADING;
            else if(~vtg_eol_dly && fifo_eol_re_dly && ~fifo_force_rd)
              next_state = C_SYNC_FALN_EOL_LAGGING;
            else if(vtg_sof_dly && ~fifo_sof_fe && ~sof_ignore)
              next_state = C_SYNC_FALN_SOF_LEADING;
            else if(~vtg_sof_dly && fifo_sof_fe && ~sof_ignore && ~fifo_force_rd)
              next_state = C_SYNC_FALN_SOF_LAGGING;
            else if((vtg_sof_dly && fifo_sof_fe) && (vtg_sof_cnt >= C_SYNC_LOCK_THRESHOLD-1) && (fifo_sof_cnt >= C_SYNC_LOCK_THRESHOLD-1))
              next_state = C_SYNC_FALN_LOCK;
            else
              next_state = C_SYNC_FALN_ACTIVE;
          end
  
          // VTG Leading EOL
          // - Flush out EOL from FIFO
          C_SYNC_FALN_EOL_LEADING: begin
            if(vtg_lag >= C_SYNC_VTG_LAG_MAX-1'b1)
              next_state = C_SYNC_IDLE;
            else if(fifo_eol_re_dly)
              next_state = C_SYNC_FALN_ACTIVE;
            else
              next_state = C_SYNC_FALN_EOL_LEADING;
          end
  
          // VTG Lagging EOL
          // - Indicates Early EOL caused by incorrect VTG settings or an extra
          // read during EOL flushing. An extra read can occur during EOL flushing
          // if the last pixel arrives immediately before the next active line.
          // - Since the source of the error is unknown continue as normal
          C_SYNC_FALN_EOL_LAGGING: begin
            next_state = C_SYNC_FALN_ACTIVE;
          end
  
          // VTG Leading SOF
          // - Lag VTG until FIFO SOF
          C_SYNC_FALN_SOF_LEADING: begin
            if(vtg_lag >= C_SYNC_VTG_LAG_MAX-1'b1)
              next_state = C_SYNC_IDLE;
            else if(fifo_sof_fe)
              next_state = C_SYNC_FALN_ACTIVE;
            else 
              next_state = C_SYNC_FALN_SOF_LEADING;
          end
  
          // VTG Lagging SOF
          // - Indicates Early SOF caused by incorrect VTG settings
          C_SYNC_FALN_SOF_LAGGING: begin
            next_state = C_SYNC_FALN_ACTIVE;
          end
  
          // VTG Locked 
          C_SYNC_FALN_LOCK: begin
            if(vtg_eol_dly & ~fifo_eol_re_dly)
              next_state = C_SYNC_LALN_EOL_LEADING;
            else if(~vtg_eol_dly & fifo_eol_re_dly)
              next_state = C_SYNC_LALN_EOL_LAGGING;
            else if(vtg_sof_dly && ~fifo_sof_fe)
              next_state = C_SYNC_LALN_SOF_LEADING;
            else if(~vtg_sof_dly && fifo_sof_fe)
              next_state = C_SYNC_LALN_SOF_LAGGING;
            else
              next_state = C_SYNC_FALN_LOCK;
          end
  
          // Lost Lock, VTG Leading EOL
          C_SYNC_LALN_EOL_LEADING: begin
            next_state = C_SYNC_IDLE;
          end
  
          // Lost Lock, VTG Lagging EOL
          // - Indicates Early EOL caused by incorrect VTG settings
          // - Should never occur since it would be caught during fine alignment
          C_SYNC_LALN_EOL_LAGGING: begin
            next_state = C_SYNC_IDLE;
          end

          // Lost Lock, VTG Leading SOF
          C_SYNC_LALN_SOF_LEADING: begin
            next_state = C_SYNC_IDLE;
          end

          // Lost Lock, VTG Lagging SOF
          // - Indicates Early SOF caused by incorrect VTG settings
          // - Should never occur since it would be caught during fine alignment
          C_SYNC_LALN_SOF_LAGGING: begin
            next_state = C_SYNC_IDLE;
          end
  
        endcase
      end
    end
  end else if(C_VTG_MASTER_SLAVE == 1) begin : gen_sync_master_mode
    always @(*) begin
      next_state = C_SYNC_IDLE;
  
      if(VID_RESET) begin
        next_state = C_SYNC_IDLE;
      end else begin
        case(state) 

          // Wait for FIFO SOF
          C_SYNC_IDLE: begin
            if(FIFO_SOF && ~FIFO_FIELD_ID)
              next_state = C_SYNC_CALN_SOF_FIFO;
            else
              next_state = C_SYNC_IDLE;
          end

          // Wait for FIFO Fill 
          C_SYNC_CALN_SOF_FIFO: begin
            if(FIFO_RD_LEVEL >= vtg_lag_threshold)
              next_state = C_SYNC_CALN_SOF_VTG;
            else
              next_state = C_SYNC_CALN_SOF_FIFO;
          end

          // Wait for VTG vsync
          C_SYNC_CALN_SOF_VTG: begin
            if(vtg_sof && ~VTG_FIELD_ID)
              next_state = C_SYNC_FALN_ACTIVE;
            else
              next_state = C_SYNC_CALN_SOF_VTG;
          end 

          // Fine Align Active
          C_SYNC_FALN_ACTIVE: begin
            if(vtg_eol_dly && ~fifo_eol_re_dly)
              next_state = C_SYNC_FALN_EOL_LEADING;
            else if(~vtg_eol_dly && fifo_eol_re_dly && ~fifo_force_rd)
              next_state = C_SYNC_FALN_EOL_LAGGING;
            else if(vtg_sof_dly && ~fifo_sof_fe && ~sof_ignore)
              next_state = C_SYNC_FALN_SOF_LEADING;
            else if(~vtg_sof_dly && fifo_sof_fe && ~sof_ignore && ~fifo_force_rd)
              next_state = C_SYNC_FALN_SOF_LAGGING;
            else if((vtg_sof_dly && fifo_sof_fe) && (vtg_sof_cnt >= C_SYNC_LOCK_THRESHOLD-1) && (fifo_sof_cnt >= C_SYNC_LOCK_THRESHOLD-1))
              next_state = C_SYNC_FALN_LOCK;
            else
              next_state = C_SYNC_FALN_ACTIVE;
          end

          // VTG Leading EOL
          // - Flush out EOL from FIFO
          C_SYNC_FALN_EOL_LEADING: begin
            if(vtg_lag >= C_SYNC_VTG_LAG_MAX-1'b1)
              next_state = C_SYNC_IDLE;
            else if(fifo_eol_re_dly)
              next_state = C_SYNC_FALN_ACTIVE;
            else
              next_state = C_SYNC_FALN_EOL_LEADING;
          end

          // VTG Lagging EOL
          // - Indicates Early EOL caused by incorrect VTG settings or an extra
          // read during EOL flushing. An extra read can occur during EOL flushing
          // if the last pixel arrives immediately before the next active line.
          // - Since the source of the error is unknown continue as normal
          C_SYNC_FALN_EOL_LAGGING: begin
            next_state = C_SYNC_FALN_ACTIVE;
          end
  
          // VTG Leading SOF
          // - Lag VTG until FIFO SOF
          C_SYNC_FALN_SOF_LEADING: begin
            if(vtg_lag >= C_SYNC_VTG_LAG_MAX-1'b1)
              next_state = C_SYNC_IDLE;
            else if(fifo_sof_fe)
              next_state = C_SYNC_FALN_ACTIVE;
            else 
              next_state = C_SYNC_FALN_SOF_LEADING;
          end
  
          // VTG Lagging SOF
          // - Indicates Early SOF caused by incorrect VTG settings
          C_SYNC_FALN_SOF_LAGGING: begin
            next_state = C_SYNC_FALN_ACTIVE;
          end
  
          // VTG Locked 
          C_SYNC_FALN_LOCK: begin
            if(vtg_eol_dly & ~fifo_eol_re_dly)
              next_state = C_SYNC_LALN_EOL_LEADING;
            else if(~vtg_eol_dly & fifo_eol_re_dly)
              next_state = C_SYNC_LALN_EOL_LAGGING;
            else if(vtg_sof_dly && ~fifo_sof_fe)
              next_state = C_SYNC_LALN_SOF_LEADING;
            else if(~vtg_sof_dly && fifo_sof_fe)
              next_state = C_SYNC_LALN_SOF_LAGGING;
            else
              next_state = C_SYNC_FALN_LOCK;
          end
  
          // Lost Lock, VTG Leading EOL
          C_SYNC_LALN_EOL_LEADING: begin
            next_state = C_SYNC_IDLE;
          end
  
          // Lost Lock, VTG Lagging EOL
          // - Indicates Early EOL caused by incorrect VTG settings
          // - Should never occur since it would be caught during fine alignment
          C_SYNC_LALN_EOL_LAGGING: begin
            next_state = C_SYNC_IDLE;
          end

          // Lost Lock, VTG Leading SOF
          C_SYNC_LALN_SOF_LEADING: begin
            next_state = C_SYNC_IDLE;
          end

          // Lost Lock, VTG Lagging SOF
          // - Indicates Early SOF caused by incorrect VTG settings
          // - Should never occur since it would be caught during fine alignment
          C_SYNC_LALN_SOF_LAGGING: begin
            next_state = C_SYNC_IDLE;
          end

        endcase 
      end
    end
  end endgenerate
  
endmodule

`default_nettype wire
