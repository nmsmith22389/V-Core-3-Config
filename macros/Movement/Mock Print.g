var PrintSpeed = 60 * 60
var TravelSpeed = 150 * 60
var InitialTravelSpeed = 10 * 60
var LayerCount = 2
var ZHeight = 25

; ==== Initial Move ====
G0 F{var.InitialTravelSpeed} X130 Y162.5 Z{var.ZHeight}

while iterations < var.LayerCount
	;M400
	;echo {"Layer: " ^ (iterations + 1)}

	G1 F{var.PrintSpeed} X146.708 Y130.549
	G3 X175.000 Y137.500 I13.292 J6.951 F{var.PrintSpeed}
	G1 X175 Y157.5
	G1 X160 Y172.5
	G1 X125 Y172.5
	G1 X125 Y122.5
	G1 X130 Y122.5
	G1 X130 Y142
	G1 X130.5 Y142
	G1 X130.5 Y143
	G1 X130 Y143
	G1 X130 Y162.5
	; G0 F{var.TravelSpeed} X130.222 Y162.075
	; G0 F480 X130.222 Y162.075 Z0.4 ; Z Hop
	; G0 F{var.TravelSpeed} X130 Y162.5
