var MaxSpeed = floor(move.axes[0].speed / 60)
var Step = 20
var StartSpeed = 50
var DelayMs = 500
var MaxLoop = 20

var XMin = 50
var XMax = 250
var YPos = 150

var Speed = var.StartSpeed

;> Move to start pos
G0 X{var.XMin} Y{var.YPos} F3000

echo "Max Speed: " ^ var.MaxSpeed

while var.Speed < var.MaxSpeed && iterations <= var.MaxLoop
	M400
	echo "Speed: <b>" ^ var.Speed ^ " mm/s</b>"
	G0 X{var.XMax} Y{var.YPos} F{var.Speed * 60}
	G4 P{var.DelayMs}
	G0 X{var.XMin} Y{var.YPos} F{var.Speed * 60}
	G4 P{var.DelayMs * 2}
	set var.Speed = min(var.Speed + var.Step, var.MaxSpeed)
	
echo "Done!"
