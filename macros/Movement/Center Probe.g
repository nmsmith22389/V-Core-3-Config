var CenterX = move.axes[0].max / 2
var CenterY = move.axes[1].max / 2
var ProbeX = sensors.probes[0].offsets[0]
var ProbeY = sensors.probes[0].offsets[1]

var MoveSpeed = exists(param.F) ? param.F : 6000

;M400    ; let moves finish
G90     ; absolute

if exists(param.Z)
	G0 X{var.CenterX - var.ProbeX} Y{var.CenterY - var.ProbeY} Z{param.Z} F{var.MoveSpeed}
else
	G0 X{var.CenterX - var.ProbeX} Y{var.CenterY - var.ProbeY} F{var.MoveSpeed}