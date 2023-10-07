connect -url tcp:127.0.0.1:3121
source H:/FPGA/VGA/Gen4/Gen4.sdk/gener4_wrapper_hw_platform_0/ps7_init.tcl
targets -set -filter {jtag_cable_name =~ "Platform Cable USB 00001abcffac01" && level==0} -index 1
fpga -file H:/FPGA/VGA/Gen4/Gen4.sdk/gener4_wrapper_hw_platform_0/gener4_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB 00001abcffac01"} -index 0
loadhw -hw H:/FPGA/VGA/Gen4/Gen4.sdk/gener4_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB 00001abcffac01"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB 00001abcffac01"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB 00001abcffac01"} -index 0
dow H:/FPGA/VGA/Gen4/Gen4.sdk/G4oktober/Debug/G4oktober.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB 00001abcffac01"} -index 0
con
