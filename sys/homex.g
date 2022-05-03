; homex.g
; called to home the X axis

; if exists(global.ProbeDeployed) && global.ProbeDeployed == true
; 	abort "Can't home X... Probe is deployed!"

set global.HomingX = true

; if !global.HomingAll
;     M98 P"0:/macros/Movement/StealthChop Tuning.g"

G91                                             ; relative positioning

G1 H2 Z5 F3600                                  ; lift Z relative to current position

M400                                            ; wait for all moves to finish

M98 P"Config/Drives/Acceleration/Slow.g" ; reduce acceleration for homing moves

G1 H1 X-315 F3600                               ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F360                                      ; go back a few mm
G1 H1 X-315 F360                                ; move slowly to X axis endstop once more (second pass)

M98 P"Config/Drives/Acceleration/Default.g" ; return to full acceleration

G1 H2 Z-5 F3600                                 ; lower Z again

G90                                             ; absolute positioning

set global.HomingX = false
