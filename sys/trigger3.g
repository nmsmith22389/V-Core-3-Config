if move.axes[2].machinePosition < 100
	echo "Moving Z axes up..."
    G0 Z100 F900
else
	echo "Moving Z axes down..."
    G0 Z15 F900