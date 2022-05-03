; 1. The Z probe input pin on the control board is not pull-up or has an abnormal input circuit.
;   (A board with a large capacity capacitor in the end-stop input circuit, such as the Melzi )
;
;   ☞ And if the nozzle is in contact with the bed after missing the trigger signal
;   ☞ If you want more precision bed leveling, Remove the capacitor(recommended).
;   ☞ This setting is not required if the large capacity capacitor has already been removed from the board.
;   ☞ Do not activate 5V logic on the 3.3V logic system without 3.3V logic conversion.
;
; Step 1: Connect the 3pin (brown, red, orange) and 2pin (black, white) to the control board.
; Step 2: M280 P0 S10  ← least 500ms
; Step 3: M280 P0 S140 ← least 150ms
; Step 4: M280 P0 S130 ← least 150ms
; Step 5: M280 P0 S140 ← least 150ms
; Step 6: Check if there is a 5V Logic Mode indication.
;   If no 5V Logic Mode Indication is found, perform Steps 2 to Step 5 again.

echo "Converting BLTouch to 5V mode..."

; Step 1
M280 P0 S10
G4 P510

; Step 2
M280 P0 S140
G4 P160

; Step 3
M280 P0 S130
G4 P160

; Step 4
M280 P0 S140
G4 P160