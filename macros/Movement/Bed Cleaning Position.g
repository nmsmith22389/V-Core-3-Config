var PosX = 155
var PosY = 200
var PosZ = 200
var Speed = 4500

M98 P"0:/macros/Movement/Conditional Home.g"

G4 P500

G0 X{var.PosX} Y{var.PosY} Z{var.PosZ} F{var.Speed}