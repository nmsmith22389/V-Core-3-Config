
; heat up tool / hotend
M568 R{global.FilamentTemp} S{global.FilamentTemp}

; Wait for temps
M116 P0

; Wait
G4 S1


