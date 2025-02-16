set_global_assignment -entity "max10flash" -library "lib_max10flash" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "max10flash" -library "lib_max10flash" -name IP_TOOL_VERSION "23.1"
set_global_assignment -entity "max10flash" -library "lib_max10flash" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_max10flash" -name SPD_FILE [file join $::quartus(sip_path) "../max10flash.spd"]
set_global_assignment -library "lib_max10flash" -name MISC_FILE [file join $::quartus(sip_path) "../../max10flash.qsys"]

set_global_assignment -library "lib_max10flash" -name MISC_FILE [file join $::quartus(sip_path) "max10flash.v"]
set_global_assignment -library "lib_max10flash" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_onchip_flash_util.v"]
set_global_assignment -library "lib_max10flash" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_onchip_flash.v"]
set_global_assignment -library "lib_max10flash" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_onchip_flash_avmm_data_controller.v"]
