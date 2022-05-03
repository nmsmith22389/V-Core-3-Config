;
;    /\   /\   __ _  _ __  ___
;    \ \ / /  / _` || '__|/ __|
;     \ V /  | (_| || |   \__ \
;      \_/    \__,_||_|   |___/
;    ==========================

var TempHotend = 150
var TempBed = 50
var DiveHeight = 15
var ProbeCount = 5

;    ==========================

M291 P"Grid bed compensation map and Z Probe trigger height will be cleared.<br>Ok or Cancel?" R"WARNING" S3 ; User must click OK or cancel.
M291 P"Heights will be found in gcode console if logging successful gcode is enabled" R"Did you remember to enabled gcode logging?" S3

; Clear compensation map and Z probe trigger height
;
G28 Z			; home all axis
M561	    ; Disable any current bed compensation
G90			; Absolute positioning
T0			; Activate first tool
;M98 P"ZSpeedsSlow.g"	; Set lower speeds for Z homing and lower Z motor current
M913 Z50		; Drop motor current to prevent damage in case of head crash

; Preheat to probing temps
;
echo "Preheating to bed to " ^ {var.TempBed} ^ " and nozzle to " ^ {var.TempHotend} ^ " for accurate probing"
M104 S{var.TempHotend}  ; Set nozzle to 210 and release
M190 S{var.TempBed}     ; Set bed to 60 and wait
M109 S{var.TempHotend}  ; Set nozzle to 210 and wait

; Jog Z axis to bed surface
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
M98 P"0:/macros/Calibration and Tuning/Leveling/Center Nozzle.g"
G90 G1 Z3 F400
M400
G92 Z4          ; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
M400
G92 Z0          ; Set z = 0
G90 G1 Z3 F400
M568 P0 S0 R0   ; Turn off hotend heater as it's no longer needed
M291 P"Probe will now move to center of bed and measure trigger height <strong>" ^ {var.ProbeCount} ^ "</strong> times" R"ZProbe Trigger Height Calibration" T3
M400
M98 P"0:/macros/Calibration and Tuning/Leveling/Center Probe.g"

; Start probing
;
while iterations < var.ProbeCount
	;echo iterations
	if iterations == (var.ProbeCount - 1)
		echo "Doing last Z probe and saving Z offset."
		G0 Z{var.DiveHeight}
		M400
		G30 S-3  ; measure probe height and set it.
		M400
		;M500 P31 ; save trigger height to config-override.g
		G1 Z{var.DiveHeight}
		break
	else
		G0 Z{var.DiveHeight}
		M400
		G30 S-1
		M400



; Turn off heaters
;
M568 P0 S-999 R-999     ; Switch off hotend
M140 S-999              ; Switch off bed
;M98 P"ZSpeedsNormal.g"	; return to normal speeds
;M98 P"CurrentsNormal.g"
M913 Z100
M400
echo "Homing..."
G28		; Home Z
M98 P"0:/macros/Calibration and Tuning/Leveling/Center Nozzle.g"
G0 Z50  ; Lift Z up
;M84     ; Turn off the motors
M291 R"Probing complete" P"Turning off heaters and homing axis.<br>Check log for trigger heights and enter into <code>config.g</code>" S1

