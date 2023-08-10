;
;    /\   /\   __ _  _ __  ___
;    \ \ / /  / _` || '__|/ __|
;     \ V /  | (_| || |   \__ \
;      \_/    \__,_||_|   |___/
;    ==========================

var defaultHotend = 150
var defaultBed = 60

M291 R"Hotend Temp" P"Specify hotend temperature." S5 L0 F{var.defaultHotend} J1 T60

var TempHotend = input > 0 ? input : var.defaultHotend

M291 R"Bed Temp" P"Specify bed temperature." S5 L0 F{var.defaultBed} J1 T60

var TempBed = input > 0 ? input : var.defaultBed
var DiveHeight = 15
var ProbeCount = 5

var ProbePosX = 155
var ProbePosY = 75

;? Workaround until I can use arrays
var Probe1 = 0
var Probe2 = 0
var Probe3 = 0
var Probe4 = 0
var Probe5 = 0
var ProbeAvg = 0

var msg = ""

;    ==========================

; M291 P"Grid bed compensation map and Z Probe trigger height will be cleared.<br>Ok or Cancel?" R"WARNING" S3 ; User must click OK or cancel.
; M291 P"Heights will be found in gcode console if logging successful gcode is enabled" R"Did you remember to enabled gcode logging?" S3

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
; M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
G90
G0 X{var.ProbePosX} Y{var.ProbePosY} F{80 * 60}
G0 Z3 F{6 * 60}
M400
G92 Z6          ; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
M400
G92 Z0.2          ; Set z = 0
G90
G0 Z3 F400
M568 P0 S0 R0   ; Turn off hotend heater as it's no longer needed

M291 P{"Probe will now move to center of bed and measure trigger height <strong>" ^ var.ProbeCount ^ "</strong> times"} R"ZProbe Trigger Height Calibration"

M400

G0 X{var.ProbePosX - sensors.probes[0].offsets[0]} Y{var.ProbePosY - sensors.probes[0].offsets[1]} F{50 * 60}
;M98 P"0:/macros/Calibration and Tuning/Leveling/Center Probe.g"

G0 F{6 * 60}

; Start probing
;
while iterations < var.ProbeCount
	;echo iterations
	if iterations == (var.ProbeCount - 1)
		echo "Doing last Z probe and saving Z offset."
		G0 Z{var.DiveHeight}
		M400
		G30 S-3  ; measure probe height and set it.
		G4 P200
		M400
		set var.Probe5 = sensors.probes[0].lastStopHeight
		;M500 P31 ; save trigger height to config-override.g
		G1 Z{var.DiveHeight}
		break
	else
		G0 Z{var.DiveHeight}
		M400
		G30 S-1
		G4 P200
		M400
		if iterations == 0
			set var.Probe1 = sensors.probes[0].lastStopHeight
		elif iterations == 1
			set var.Probe2 = sensors.probes[0].lastStopHeight
		elif iterations == 2
			set var.Probe3 = sensors.probes[0].lastStopHeight
		elif iterations == 3
			set var.Probe4 = sensors.probes[0].lastStopHeight

set var.ProbeAvg = (var.Probe1 + var.Probe2 + var.Probe3 + var.Probe4 + var.Probe5)/5
echo "Probe Trigger Height (Averaged): " ^ var.ProbeAvg
G31 Z{var.ProbeAvg}
echo >"0:/sys/Config/Probe/Probe_Offset.g" "G31 K0 P500 X-27.5 Y-21.0 Z" ^ var.ProbeAvg

M400

; Turn off heaters
;
M568 P0 S-999 R-999     ; Switch off hotend
M140 S-999              ; Switch off bed
;M98 P"ZSpeedsNormal.g"	; return to normal speeds
;M98 P"CurrentsNormal.g"
M913 Z100
echo "Homing..."
G28	Z	; Home Z
G0.1 Z50 F{30 * 60}
;M84     ; Turn off the motors
echo "Probing complete!"
;M291 R"Probing complete" P"Turning off heaters and homing axis.<br>Check log for trigger heights and enter into <code>config.g</code>" S1

