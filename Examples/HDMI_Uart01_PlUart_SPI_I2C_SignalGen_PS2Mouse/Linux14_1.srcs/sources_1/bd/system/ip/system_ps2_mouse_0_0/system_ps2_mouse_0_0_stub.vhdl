-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed Mar 27 14:15:14 2024
-- Host        : DESKTOP-0SNREP6 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/Linux14_1/Linux14_1.srcs/sources_1/bd/system/ip/system_ps2_mouse_0_0/system_ps2_mouse_0_0_stub.vhdl
-- Design      : system_ps2_mouse_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_ps2_mouse_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    ps2_clk : inout STD_LOGIC;
    ps2_data : inout STD_LOGIC;
    mouse_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mouse_data_new : out STD_LOGIC;
    state_std : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ps2_clock_T : out STD_LOGIC;
    ps2_clock_O : out STD_LOGIC;
    ps2_clock_I : in STD_LOGIC;
    ps2_dat_T : out STD_LOGIC;
    ps2_dat_O : out STD_LOGIC;
    ps2_dat_I : in STD_LOGIC
  );

end system_ps2_mouse_0_0;

architecture stub of system_ps2_mouse_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,reset_n,ps2_clk,ps2_data,mouse_data[31:0],mouse_data_new,state_std[31:0],ps2_clock_T,ps2_clock_O,ps2_clock_I,ps2_dat_T,ps2_dat_O,ps2_dat_I";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ps2_mouse_w,Vivado 2018.2";
begin
end;
