var count = exists(param.C) ? max(param.C, 0) : 5
var pauseOn = exists(param.O) ? max(param.O, 0) : 150; In MS
var pauseOff = exists(param.F) ? max(param.F, 0) : 50; In MS
var lights = 43
var debug = exists(param.D) || (exists(global.debug) && global.debug == true)

var lightsOn = global.LightsOn

var r = exists(param.R) ? param.R : 0
var g = exists(param.G) ? param.G : 0
var b = exists(param.B) ? param.B : 0
var w = exists(param.W) ? param.W : 0
var p = exists(param.P) ? param.P : 255
var paramExists = exists(param.R) || exists(param.G) || exists(param.B) || exists(param.W)

var hasColorName = exists(param.N)
var colorName = var.hasColorName ? param.N : null

if var.hasColorName
	; Check color names
	if var.colorName == "NONE"
	elif var.colorName == "red"
		set var.r = 255
		set var.g = 0
		set var.b = 0
		set var.w = 0
		;set var.p = exists(param.P) ? param.P : 255
	elif var.colorName == "green"
		set var.r = 0
		set var.g = 255
		set var.b = 0
		set var.w = 0
		;set var.p = exists(param.P) ? param.P : 255
	elif var.colorName == "blue"
		set var.r = 0
		set var.g = 0
		set var.b = 255
		set var.w = 0
		;set var.p = exists(param.P) ? param.P : 255
	elif var.colorName == "orange"
		set var.r = 255
		set var.g = 109
		set var.b = 0
		set var.w = 0
		;set var.p = exists(param.P) ? param.P : 255
	elif var.colorName == "purple"
		set var.r = 170
		set var.g = 0
		set var.b = 255
		set var.w = 0
		;set var.p = exists(param.P) ? param.P : 255
elif !var.paramExists
	set var.r = 0
	set var.g = 0
	set var.b = 0
	set var.w = 255

if var.debug
	echo "R: " ^ var.r, "G: " ^ var.g, "B: " ^ var.b, "W: " ^ var.w, "P: " ^ var.p, "N: " ^ """" ^ var.colorName ^ """"

while iterations < var.count
	M150 S{var.lights} R{var.r} U{var.g} B{var.b} W{var.w} P{var.p}
	G4 P{var.pauseOn}
	M150 S{var.lights} R0 U0 B0 W0 P0
	G4 P{var.pauseOff}

if var.lightsOn
	M98 P"0:/macros/Lights/Top Bar/Lights On.g"