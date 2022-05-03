; bed.g
; called to perform automatic bed compensation via G32

; var HomedX 	= move.axes[0].homed
; var HomedY 	= move.axes[1].homed
; var HomedZ 	= move.axes[2].homed
; var MidY 	= move.axes[1].max / 2	; Middle of Y-Axis

var AttemptCount = 5
var MaxDeviation = 0.01

var ScrewLeftX = 40
var ScrewLeftY = 10

var ScrewBackX = 155
var ScrewBackY = 275

var ScrewRightX = 270
var ScrewRightY = 10

M290 R0 S0	; clear baby stepping
M561		; clear any bed transform
M400		; finish all moves, clear the buffer

set global.Tramming = true
set global.Probing = true

; G28 Z		; home all

;> Home if needed
if (!move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed)
	G28
else
	G28 Z

;> Deploy the Probe
M401

;> Calibrate Bed
while true

	if iterations >= var.AttemptCount
		echo "Auto calibration repeated attempts ended, final deviation", move.calibration.final.deviation ^ "mm"
		break

	; G30 P0 X5 Y5 Z-99999 ; probe near a leadscrew
	G30 P0 X{var.ScrewLeftX} Y{var.ScrewLeftY} Z-99999 ; probe near a leadscrew

	if result != 0
		continue

	; G30 P1 X150 Y285 Z-99999 ; probe near a leadscrew
	G30 P1 X{var.ScrewBackX} Y{var.ScrewBackY} Z-99999 ; probe near a leadscrew

	if result != 0
		continue

	; G30 P2 X270 Y5 Z-99999 S3 ; probe near a leadscrew and calibrate 3 motors
	G30 P2 X{var.ScrewRightX} Y{var.ScrewRightY} Z-99999 S3 ; probe near a leadscrew and calibrate 3 motors

	if result != 0
		continue

	if move.calibration.initial.deviation <= var.MaxDeviation
		break

	echo "Repeating calibration because deviation is too high (" ^ move.calibration.initial.deviation ^ "mm)"

; end loop

echo "Auto calibration successful, deviation", move.calibration.final.deviation ^ "mm"

; G0.1

set global.Tramming = false
set global.Probing = false

;> Retract the Probe
M402

G28 Z	; rehome Z as the absolute height of the z plane may have shifted
G29 S1	; load saved mesh
