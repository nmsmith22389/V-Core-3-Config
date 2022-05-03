;var ProbeValue = sensors.probes[0].value[0]
;var ProbeThreshold = sensors.probes[0].threshold

; To avoid errors
;if var.ProbeValue >= var.ProbeThreshold
;	G4 P200
;    M98 P"Commands/Probe/Reset.g"
;	echo "Probe Reset"

M280 P0 S10 ; deploy BLTouch

M280 P0 S60 ; Touch SW

;M98 P"Commands/Probe/TouchSW.g"
set global.ProbeDeployed = true