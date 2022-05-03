M150 S43 R0 U0 B0 P0 F0 ; Shut off lights if they are on.

while iterations < 21
	M150 S{(iterations + 1) * 3} R0 U255 B0 W0 P255
	G4 P100
