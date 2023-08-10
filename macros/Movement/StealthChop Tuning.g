;echo "Disabling steppers..."
;M18
;G4 S1

;echo "Enabling steppers..."
M17
G4 P200

;echo "Moving..."
;G91
;G0 H2 X15 Y15 F{40 * 60}

;G4 P500

;echo "Done!"

;G91                     ; relative positioning
;G1 H2 X0.2 Y0.2 F3000   ; power up X and Y motors to ensure they are not stalled
;G4 P150                 ; wait 150ms
;M400                    ; wait for current moves to finish
;G1 H2 X-0.2 Y-0.2 F3000 ; move back to original position