; This is mainly for working in grease that's on the rails

var numLoop = 5
var speed = 100 * 60

while iterations < var.numLoop
	G0 X{move.axes[0].min} F{var.speed}
	G0 X302 F{var.speed}
	
;echo "Centering..."
	
G4 P250

G0 X{floor(move.axes[0].max / 2)} F{35 * 60}

echo "Done"
