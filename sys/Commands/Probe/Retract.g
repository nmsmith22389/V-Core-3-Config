var DontRetract = global.Tramming
;  || global.HomingZ

;var DontRetract = false

if !var.DontRetract
	M280 P0 S90 ; retract BLTouch
	set global.ProbeDeployed = false

;var ProbeValue = sensors.probes[0].value[0]
;var ProbeThreshold = sensors.probes[0].threshold

; To avoid errors
;if var.ProbeValue >= var.ProbeThreshold
	;G4 P200
;    M98 P"Commands/Probe/Reset.g"
;	echo "Probe Reset"
	;M280 P0 S90 ; retract BLTouch