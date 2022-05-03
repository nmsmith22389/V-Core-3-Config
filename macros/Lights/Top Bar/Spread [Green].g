M150 S43 R0 U0 B0 P0 F0 ; Shut off lights if they are on.

while iterations < 14
	while iterations < 3
		if iterations == 0
			M150 S1 R255 P255 F1
		elif iterations == 1
			M150 S1 U255 P255 F1
		else
			M150 S1 B255 P255 F1

M150 S1 R0 U0 B0 P0 F0