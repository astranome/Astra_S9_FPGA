# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\EBAZ4205_PS2mouse\Vitis\EBAZ4205_PS2_mouse_linux\EBAZ4205_PS2_mouse_linux\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\EBAZ4205_PS2mouse\Vitis\EBAZ4205_PS2_mouse_linux\EBAZ4205_PS2_mouse_linux\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {EBAZ4205_PS2_mouse_linux}\
-hw {D:\EBAZ4205_eth_ps2mouse\ebaz4205_wrapper.xsa}\
-proc {ps7_cortexa9} -os {linux} -out {D:/EBAZ4205_PS2mouse/Vitis/EBAZ4205_PS2_mouse_linux}

platform write
platform active {EBAZ4205_PS2_mouse_linux}
platform generate
