var PosX = 155
var PosY = 300
var PosZ = 75
var Speed = 4500

if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
	G28

G0 X{var.PosX} Y{var.PosY} Z{var.PosZ} F{var.Speed}