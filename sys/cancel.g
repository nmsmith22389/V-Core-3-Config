; cancel.g
;
; Run when the print is paused, and then canceled.
;

echo "Canceling..."

M98 P"stop.g"

;G91                 ; Relative positioning
;G1 E-1 F2700        ; Retract a bit
;G1 E-0.5 Z0.2 F2400 ; Retract and raise Z
;G0 X5 Y5 F3000      ; Wipe out
;G0 Z10              ; Raise Z more
;G90                 ; Absolute positioning
;
;G0 X0 Y{move.axes[1].max} ; Present print
;M106 P1 S0                ; Turn-off fan
;M568 P1 S0 R0             ; Turn-off hotend
;M140 S0 R0                ; Turn-off bed
;M140 S-999                ; Turn-off bed
;M220 S100                 ; Set speed factor back to 100% in case it was changed
;M221 S100                 ; Set extrusion factor back to 100% in case it was changed
;M290 R0 S0                ; Clear babystepping
;
;M84 X Y E ;Disable all steppers but Z