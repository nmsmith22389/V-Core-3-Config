if exists(param.P)
	M98 P"0:/macros/Movement/Center Probe.g" Z{param.Z} F{param.F}
else
	M98 P"0:/macros/Movement/Center Nozzle.g" Z{param.Z} F{param.F}