var RetractDistanceDefault = 1.5
var RetractSpeedDefault = 35

var RetractDistance = exists(global.SlicerRetractDistance) ? global.SlicerRetractDistance : var.RetractDistanceDefault
var RetractSpeed = exists(global.SlicerRetractSpeed) ? global.SlicerRetractSpeed : var.RetractSpeedDefault

var RealRetractDistance = abs(var.RetractDistance) * -1
var RealRetractSpeed = var.RetractSpeed * 60

M83
G1 E{var.RealRetractDistance} F{var.RealRetractSpeed}
