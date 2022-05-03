var IsToolBlocking = move.axes[0].machinePosition < move.axes[0].machinePosition + 30

if !var.IsToolBlocking && !global.HomingX
	if global.LightsOn
		M98 P"0:/macros/Lights/Top Bar/Lights Off.g"
	else
		M98 P"0:/macros/Lights/Top Bar/Lights On.g"