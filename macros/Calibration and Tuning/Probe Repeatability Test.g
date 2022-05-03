var CenterX = move.axes[0].max / 2
var CenterY = move.axes[1].max / 2

var ProbeX = sensors.probes[0].offsets[0]
var ProbeY = sensors.probes[0].offsets[1]

var PosX = var.CenterX - var.ProbeX
var PosY = var.CenterY - var.ProbeY

var ProbeCount = 5

G28 Z

if result != 0
	abort "Not homed!"
	
M401
M402

set global.Tramming = true

while iterations < var.ProbeCount
	if iterations == var.ProbeCount - 1
		G30 P{iterations} X{move.axes[0].machinePosition} Y{move.axes[1].machinePosition} Z-99999 S-1
	else
		G30 P{iterations} X{move.axes[0].machinePosition} Y{move.axes[1].machinePosition} Z-99999
		; Jerk to loosen probe
		G91
		G0 X5
		G0 X-5
		G90
		
set global.Tramming = false
M402