# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"


}

proc update_PARAM_VALUE.clk_freq { PARAM_VALUE.clk_freq } {
	# Procedure called to update clk_freq when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.clk_freq { PARAM_VALUE.clk_freq } {
	# Procedure called to validate clk_freq
	return true
}

proc update_PARAM_VALUE.ps2_debounce_counter_size { PARAM_VALUE.ps2_debounce_counter_size } {
	# Procedure called to update ps2_debounce_counter_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ps2_debounce_counter_size { PARAM_VALUE.ps2_debounce_counter_size } {
	# Procedure called to validate ps2_debounce_counter_size
	return true
}


proc update_MODELPARAM_VALUE.clk_freq { MODELPARAM_VALUE.clk_freq PARAM_VALUE.clk_freq } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.clk_freq}] ${MODELPARAM_VALUE.clk_freq}
}

proc update_MODELPARAM_VALUE.ps2_debounce_counter_size { MODELPARAM_VALUE.ps2_debounce_counter_size PARAM_VALUE.ps2_debounce_counter_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ps2_debounce_counter_size}] ${MODELPARAM_VALUE.ps2_debounce_counter_size}
}

