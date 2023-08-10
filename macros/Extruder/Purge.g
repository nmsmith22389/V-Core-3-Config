var Amount = exists(param.E) ? param.E : 10
var Speed = exists(param.F) ? param.F : (3 * 60)

M83
G1 E{var.Amount} F{var.Speed}
M98 P"0:/macros/Extruder/Retract.g"
