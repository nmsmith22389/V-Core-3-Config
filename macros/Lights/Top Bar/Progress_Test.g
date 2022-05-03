M150 S43 R0 U0 B0 P0 F0 ; Shut off lights if they are on.

var leds = 43
var num = 0

while iterations < floor(var.leds / 2)
    ;M150 S50 R0 U0 B0 W0 P0
    set var.num = ((iterations + 1) * 3)
    ;echo var.leds - var.num
	M150 S{var.num} R255 U0 B0 W0 P255 F1
    M150 S{var.leds - var.num} R0 U255 B0 W0 F0
	G4 P200
