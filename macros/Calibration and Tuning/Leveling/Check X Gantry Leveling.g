;move.kinematics.tiltCorrection.screwX[0]

var BedPadding = 30
var ScrewAX = move.kinematics.tiltCorrection.screwX[0]	; 1st screw X coordinates
var ScrewBX = move.kinematics.tiltCorrection.screwX[1]	; 2nd screw X coordinates
var MinX = move.axes[0].min								; Axis min
var MaxX = move.axes[0].max								; Axis max
var MidY = move.axes[1].max / 2							; Middle of Y-Axis
var PosA = floor(max(var.MinX, 0) + var.BedPadding)		; 1st screw probe point (X-Axis)
var PosB = floor(var.MaxX - var.BedPadding)				; 2nd screw probe point (X-Axis)
; Current Z-Axis position
var PosZ = move.axes[2].machinePosition < 15 ? 15 : move.axes[2].machinePosition

M117 "Checking X-Axis gantry leveling..."

;M117 "Leveling first..."

G0 Y{var.MidY} Z{var.PosZ} F1200

G28 Z

;M117 "Probing lead screws..."

G30 P0 X{var.PosA} Y{var.MidY} Z-99999

var DistA = sensors.probes[0].lastStopHeight - sensors.probes[0].triggerHeight

G30 P1 X{var.PosB} Y{var.MidY} Z-99999 S-1

var DistB = sensors.probes[0].lastStopHeight - sensors.probes[0].triggerHeight

M291 P{"<b>Screw 1 <sub>(" ^ var.PosA ^ ")</sub>:</b> " ^ var.DistA ^ "<br/><b>Screw 2 <sub>(" ^ var.PosB ^ ")</sub>:</b> " ^ var.DistB ^ "<br/>"} S1 T0