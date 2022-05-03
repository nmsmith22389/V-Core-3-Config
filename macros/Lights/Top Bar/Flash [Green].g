var count = 5
var pauseOn = 80 * 2; In MS
var pauseOff = 20 * 2; In MS

while iterations < var.count
	M150 S43 R0 U255 B0 W0 P255
	G4 P{var.pauseOn}
	M150 S43 R0 U0 B0 W0 P0
	G4 P{var.pauseOff}