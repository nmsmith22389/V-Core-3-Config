if !exists(global.ExtrusionRole)
	global ExtrusionRole = "Mixed"

if exists(param.R)
	set global.ExtrusionRole = param.R
else
	set global.ExtrusionRole = "Mixed"
