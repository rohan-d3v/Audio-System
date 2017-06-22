set_global_assignment -entity "fir" -library "lib_fir" -name IP_TOOL_NAME "altera_fir_compiler_ii"
set_global_assignment -entity "fir" -library "lib_fir" -name IP_TOOL_VERSION "15.0"
set_global_assignment -entity "fir" -library "lib_fir" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fir" -name SPD_FILE [file join $::quartus(sip_path) "fir.spd"]

set_global_assignment -library "lib_fir" -name MISC_FILE [file join $::quartus(sip_path) "fir_sim/fir.vo"]
set_global_assignment -library "lib_fir" -name MISC_FILE [file join $::quartus(sip_path) "fir_sim/fir_nativelink.tcl"]
set_global_assignment -library "lib_fir" -name MISC_FILE [file join $::quartus(sip_path) "fir_sim/fir_msim.tcl"]
set_global_assignment -library "lib_fir" -name MISC_FILE [file join $::quartus(sip_path) "fir_sim/fir_tb.vhd"]
set_global_assignment -library "lib_fir" -name MISC_FILE [file join $::quartus(sip_path) "fir_sim/fir_mlab.m"]
set_global_assignment -library "lib_fir" -name MISC_FILE [file join $::quartus(sip_path) "fir_sim/fir_model.m"]
set_global_assignment -library "lib_fir" -name MISC_FILE [file join $::quartus(sip_path) "fir_sim/fir_coef_int.txt"]
set_global_assignment -library "lib_fir" -name MISC_FILE [file join $::quartus(sip_path) "fir_sim/fir_input.txt"]
set_global_assignment -library "lib_fir" -name MISC_FILE [file join $::quartus(sip_path) "fir_sim/fir_param.txt"]
