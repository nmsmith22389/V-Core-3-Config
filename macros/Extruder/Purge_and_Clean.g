var MinX = move.axes[0].min + 5

if move.axes[2].userPosition <= 50
	G0 Z50 F6000 ; Raise Z

G0 X{var.MinX} F9000 ; Move to X Min
M83
G1 E20 F180 ; Extrude (Purge)
M82
;M98 P"0:/macros/Extruder/Retract.g" ; Retract
M98 P"0:/macros/Extruder/Clean_Nozzle.g" ; Clean