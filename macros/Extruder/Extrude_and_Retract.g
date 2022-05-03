var Amount = exists(param.E) ? param.E : 15

M83
G1 E{var.Amount} F180
M82
M98 P"0:/macros/Extruder/Retract.g"