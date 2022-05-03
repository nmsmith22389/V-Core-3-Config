; homez.g
; called to home the Z axis

;> BLTouch
M98 P"0:/macros/Diagnostic/BLTouch/Probe Alarm Release (Reset).g"	; Precautionary alarm release
M98 P"0:/macros/Diagnostic/BLTouch/Probe Retract.g"					; Ensure the pin is raised

set global.HomingZ = true
set global.Probing = true

if !global.HomingAll
	M98 P"0:/macros/Movement/StealthChop Tuning.g"

G91             ; relative positioning
G1 H2 Z5 F900   ; lift Z relative to current position
M400            ; wait for all moves to finish
M98 P"Config/Drives/Acceleration/Slow.g" ; reduce acceleration for homing moves
G90             ; absolute positioning
G0.1 P          ; center probe
G30             ; home Z by probing the bed
M98 P"Config/Drives/Acceleration/Default.g" ; return to full acceleration

set global.HomingZ = false
set global.Probing = false

; M402 ;? NEEDED?

; Uncomment the following lines to lift Z after probing
;G91             ; relative positioning
;G1 Z25 F100      ; lift Z relative to current position
;G90             ; absolute positioning

