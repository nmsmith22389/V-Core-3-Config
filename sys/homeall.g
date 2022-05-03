; homeall.g
; called to home all axes

;> BLTouch
M98 P"0:/macros/Diagnostic/BLTouch/Probe Alarm Release (Reset).g"	; Precautionary alarm release
M98 P"0:/macros/Diagnostic/BLTouch/Probe Retract.g"					; Ensure the pin is raised

if !global.HomingAll
	M98 P"0:/macros/Movement/StealthChop Tuning.g"

set global.HomingAll = true

;> Home X & Y Axes
set global.HomingX = true
set global.HomingY = true

M98 P"Config/Drives/Acceleration/Slow.g" ; reduce acceleration for homing moves

G91				; relative positioning

G1 H2 Z5 F3600	; lift Z relative to current position

M400			; wait for all moves to finish

G1 H1 X-625 Y605 F3600  ; Move quickly to X and Y axis endstops and stop there (first pass)
G1 H1 X-625 F1800       ; Move quickly to X and Y axis endstops and stop there (first pass)
G1 H1 Y605 F1800        ; Move quickly to X and Y axis endstops and stop there (first pass)

G1 X5 Y-5 F600       ; Go back a few mm

G1 H1 X-625 Y605 F360   ; Move slowly to X and Y axis endstops once more (second pass)
G1 H1 X-625 F360        ; Move slowly to X and Y axis endstops once more (second pass)
G1 H1 Y605 F360         ; Move slowly to X and Y axis endstops once more (second pass)

M98 P"Config/Drives/Acceleration/Default.g" ; return to full acceleration

set global.HomingX = false
set global.HomingY = false

; M98 P"homex.g"
; G4 P200
; M98 P"homey.g"
; G4 P200
M400
M98 P"homez.g"

; If not printing then move the print head to a good location
if state.status != "processing"	;if NOT printing
	G0.1

set global.HomingAll = false

