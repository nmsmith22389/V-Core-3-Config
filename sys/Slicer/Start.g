;
;    __     _  _                       ___  _         _             _
;   / _\   | |(_)  ___   ___  _ __    / _ \| |  ___  | |__    __ _ | | ___
;   \ \    | || | / __| / _ \| '__|  / /_\/| | / _ \ | '_ \  / _` || |/ __|
;   _\ \   | || || (__ |  __/| |    / /_\\ | || (_) || |_) || (_| || |\__ \
;   \__/   |_||_| \___| \___||_|    \____/ |_| \___/ |_.__/  \__,_||_||___/
;   =======================================================================
;
;   > Extruder Temp (Layer 0)
;   global SlicerETemp = {material_print_temperature_layer_0}
;   > Bed Temp (Layer 0)
;   global SlicerBTemp = {material_bed_temperature_layer_0}
;
;   -----------------------------------------------------------------------

; Set speed factor back to 100% in case it was changed
if move.speedFactor != 1
    M220 S100

; Set extrusion factor back to 100% in case it was changed
if move.extruders[0].factor != 1
    M221 S100

; Clear babystepping on Z
if move.axes[2].babystep != 0
    M290 R0 S0

; Turn part cooling blower off if it is on
if fans[tools[0].fans[0]].requestedValue != 0
    M106 P{tools[0].fans[0]} S0

; Select Tool
if state.currentTool != 0
    T0

M568 P0 S{floor(global.SlicerETemp / 2)} R{floor(global.SlicerETemp / 2)}                       ; Set tool temps
M140 S{global.SlicerBTemp} R{global.SlicerBTemp}                          ; Set bed temp
M116 H0                                                                   ; Wait for bed to reach temp

;;;;;;;;G32                                                                       ; Home + Level X Axis
;G29 S1                                                                    ; Load heightmap

; TODO: If Tramming failed check if need rehome and try again. Do in separate file
;if result != 0
;	G0.1 P Z25
	

;M400
;G4 S1

G28 Z
;G28

G4 P500
M400

; Automesh
M557.1
G4 S1
G29

M400

;;;;;;G29 S1

;if result == 0
;	abort "Mesh leveling failed!"
;	;M98 P"0:/macros/Calibration and Tuning/Fast BLtouch Mesh.g"
;	G29
;	
;	if result != 0
;		M291 P"<b class='error--text'>Mesh probing failed!</b><br><br>Continue?" R"Warning" S3
;else
;	M291 P"<b class='error--text'>Automesh failed!</b><br><br>Continue?" R"Warning" S3

;M566 P1                                                                  ; Jerk between all moves

; ===== Wait =====
; This not only waits for the hotend to reach temp but
; also gives time to clear crap from the nozzle.

G0.1 Z50                            ; Center the nozzle before waiting
;G0 Z50 F900
;M400
M568 P0 S{global.SlicerETemp} R{global.SlicerETemp}                       ; Set tool temps
M116 P0                                                                   ; Wait for tool to reach temp

; Purge Sequence
;;;G12 P

;;;G0.1

G4 S3                                                                     ; Wait for 1 second