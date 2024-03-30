-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:user:ps2_mouse:1.0
-- IP Revision: 31

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY system_ps2_mouse_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    reset_n : IN STD_LOGIC;
    ps2_clk : INOUT STD_LOGIC;
    ps2_data : INOUT STD_LOGIC;
    mouse_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    mouse_data_new : OUT STD_LOGIC;
    state_std : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ps2_clock_T : OUT STD_LOGIC;
    ps2_clock_O : OUT STD_LOGIC;
    ps2_clock_I : IN STD_LOGIC;
    ps2_dat_T : OUT STD_LOGIC;
    ps2_dat_O : OUT STD_LOGIC;
    ps2_dat_I : IN STD_LOGIC
  );
END system_ps2_mouse_0_0;

ARCHITECTURE system_ps2_mouse_0_0_arch OF system_ps2_mouse_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF system_ps2_mouse_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT ps2_mouse_w IS
    GENERIC (
      clk_freq : INTEGER;
      ps2_debounce_counter_size : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      reset_n : IN STD_LOGIC;
      ps2_clk : INOUT STD_LOGIC;
      ps2_data : INOUT STD_LOGIC;
      mouse_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      mouse_data_new : OUT STD_LOGIC;
      state_std : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ps2_clock_T : OUT STD_LOGIC;
      ps2_clock_O : OUT STD_LOGIC;
      ps2_clock_I : IN STD_LOGIC;
      ps2_dat_T : OUT STD_LOGIC;
      ps2_dat_O : OUT STD_LOGIC;
      ps2_dat_I : IN STD_LOGIC
    );
  END COMPONENT ps2_mouse_w;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF system_ps2_mouse_0_0_arch: ARCHITECTURE IS "ps2_mouse_w,Vivado 2018.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF system_ps2_mouse_0_0_arch : ARCHITECTURE IS "system_ps2_mouse_0_0,ps2_mouse_w,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF system_ps2_mouse_0_0_arch: ARCHITECTURE IS "system_ps2_mouse_0_0,ps2_mouse_w,{x_ipProduct=Vivado 2018.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=ps2_mouse,x_ipVersion=1.0,x_ipCoreRevision=31,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,clk_freq=50000000,ps2_debounce_counter_size=8}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF system_ps2_mouse_0_0_arch: ARCHITECTURE IS "package_project";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ps2_dat_I: SIGNAL IS "xilinx.com:interface:gpio:1.0 ps2_dat TRI_I";
  ATTRIBUTE X_INTERFACE_INFO OF ps2_dat_O: SIGNAL IS "xilinx.com:interface:gpio:1.0 ps2_dat TRI_O";
  ATTRIBUTE X_INTERFACE_INFO OF ps2_dat_T: SIGNAL IS "xilinx.com:interface:gpio:1.0 ps2_dat TRI_T";
  ATTRIBUTE X_INTERFACE_INFO OF ps2_clock_I: SIGNAL IS "xilinx.com:interface:gpio:1.0 ps2_clock TRI_I";
  ATTRIBUTE X_INTERFACE_INFO OF ps2_clock_O: SIGNAL IS "xilinx.com:interface:gpio:1.0 ps2_clock TRI_O";
  ATTRIBUTE X_INTERFACE_INFO OF ps2_clock_T: SIGNAL IS "xilinx.com:interface:gpio:1.0 ps2_clock TRI_T";
  ATTRIBUTE X_INTERFACE_PARAMETER OF mouse_data_new: SIGNAL IS "XIL_INTERFACENAME mouse_data_new, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  ATTRIBUTE X_INTERFACE_INFO OF mouse_data_new: SIGNAL IS "xilinx.com:signal:interrupt:1.0 mouse_data_new INTERRUPT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ps2_clk: SIGNAL IS "XIL_INTERFACENAME ps2_clk, FREQ_HZ 100000000, PHASE 0.000";
  ATTRIBUTE X_INTERFACE_INFO OF ps2_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ps2_clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF reset_n: SIGNAL IS "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW";
  ATTRIBUTE X_INTERFACE_INFO OF reset_n: SIGNAL IS "xilinx.com:signal:reset:1.0 reset_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset_n, ASSOCIATED_BUSIF ps2_dat, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : ps2_mouse_w
    GENERIC MAP (
      clk_freq => 50000000,
      ps2_debounce_counter_size => 8
    )
    PORT MAP (
      clk => clk,
      reset_n => reset_n,
      ps2_clk => ps2_clk,
      ps2_data => ps2_data,
      mouse_data => mouse_data,
      mouse_data_new => mouse_data_new,
      state_std => state_std,
      ps2_clock_T => ps2_clock_T,
      ps2_clock_O => ps2_clock_O,
      ps2_clock_I => ps2_clock_I,
      ps2_dat_T => ps2_dat_T,
      ps2_dat_O => ps2_dat_O,
      ps2_dat_I => ps2_dat_I
    );
END system_ps2_mouse_0_0_arch;
