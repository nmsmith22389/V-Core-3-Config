var NumSwipes = exists(param.S) && param.S > 0 ? param.S : 2
var EndPos = move.axes[0].min + 5
var StartPos = var.EndPos + 30

while iterations < var.NumSwipes
	G0 X{var.EndPos} F9000
	G0 X{var.StartPos}
