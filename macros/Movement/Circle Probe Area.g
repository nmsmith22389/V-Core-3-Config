set global.SlicerMeshXMin = 121.671
set global.SlicerMeshXMax = 188.313
set global.SlicerMeshYMin = 75.6898
set global.SlicerMeshYMax = 142.31

var xm = global.SlicerMeshXMin
var xx = global.SlicerMeshXMax
var ym = global.SlicerMeshYMin
var yx = global.SlicerMeshYMax

var xd = var.xx - var.xm
var yd = var.yx - var.ym

var defaultCount = 1

M291 R"Loop Count" P"Enter the number of times to circle the area." S5 L1 H15 F{var.defaultCount} J1 T8

var count = input > 0 ? input : var.defaultCount

var speed = 100 ; in mm/s
var zHeight = 5 ; in mm


; Move to correct height as starting point.
G0 X{var.xm + floor(var.xd / 2)} Y{var.ym + floor(var.yd / 2)} Z{var.zHeight} F{45 * 60}

G0 X{var.xm} Y{var.ym}

G0 F{var.speed * 60}

while iterations < var.count
    G91 ; Relative

    G0 Y{var.yd}
    G0 X{var.xd}
    G0 Y{-var.yd}
    G0 X{-var.xd}

G90 ; Absolute

