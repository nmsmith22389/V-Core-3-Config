var MoveX = move.axes[0].max / 2
var MoveY = move.axes[1].max / 2
var MoveSpeed = exists(param.F) ? param.F : 6000

G90

if exists(param.Z)
	G0 X{var.MoveX} Y{var.MoveY} Z{param.Z} F{var.MoveSpeed}
else
    G0 X{var.MoveX} Y{var.MoveY} F{var.MoveSpeed}