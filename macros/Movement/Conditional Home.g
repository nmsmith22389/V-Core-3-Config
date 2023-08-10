var HomedX = move.axes[0].homed
var HomedY = move.axes[1].homed
var HomedZ = move.axes[2].homed

if (!var.HomedX || !var.HomedY || !var.HomedZ)
	G28
