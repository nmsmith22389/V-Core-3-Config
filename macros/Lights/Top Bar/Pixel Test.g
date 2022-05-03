var numLights = 43

M150 S{var.numLights} R0 U0 B0 P0 F0 ; Shut off lights if they are on.

var red = var.numLights
var blue = 0

M150 S{var.numLights} R255 U0 B0 P255 F0

G4 P500 ; Pause

while iterations < var.numLights
	set var.blue = var.blue + 1
	set var.red = var.red - 1
	
	; Blue
	M150 S{var.blue} R0 U0 B255 P255 F1
	
	; Red
	M150 S{var.red} R255 U0 B0 P255 F0
	
	G4 P250 ; Pause

;M150 S1 R0 U0 B0 P0 F0