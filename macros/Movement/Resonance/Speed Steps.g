var SpeedStart = 20
var SpeedEnd = 150
var Step = 5

var Speed = var.SpeedStart

while var.Speed <= var.SpeedEnd
	if iterations > 40
		break
	M400
	echo "Speed: ", var.Speed
	G0 X150 Y150 F{var.Speed * 60}
	G0 X150 Y200
	set var.Speed = var.Speed + var.Step
