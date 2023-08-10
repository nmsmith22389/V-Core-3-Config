
var FilamentTemp = 225

; heat up tool / hotend
;M568 R{var.FilamentTemp} S{var.FilamentTemp}

; Wait for temps
;M116 P0

; Wait
G4 S1

; Purge
M83
G1 E10 F{3 * 60}

; Retract
G1 E-1 F{25 * 60}

; Unload
G1 E-10 F{2 * 60}

G1 E-15 F{5 * 60}

G1 E-75 F{8 * 60}
