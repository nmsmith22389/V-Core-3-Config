M563 P0 S"LGX" D0 H1 F0     ; define tool 0
G10 P0 X0 Y0 Z0             ; set tool 0 axis offsets
M568 P0 R0 S0               ; set initial tool 0 active and standby temperatures to 0C
M302 S180 R180              ; allow extrusion starting from 180C and retractions already from 18

; Pressure Advance
; Broken: Was causing extruder jamming
M572 D0 S0.05
; M572 D0 S0.1
