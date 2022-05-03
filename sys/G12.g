;M98 P"0:/macros/Extruder/Clean_Nozzle.g"

if exists(param.P)
	M98 P"0:/macros/Extruder/Purge_and_Clean.g"
else
	M98 P"0:/macros/Extruder/Clean_Nozzle.g"