;M106 S{param.S}
;if !exists(global.FanSpeedMax)
;	global FanSpeedMax = fans[1].max
;
;if !exists(global.FanSpeedMin)
;	global FanSpeedMin = fans[1].min
;	
if !exists(global.FanDisable)
	global FanDisable = false
	
;; Min
;if exists(param.L)
;	set global.FanSpeedMin = min(max(param.L, 0), 1)
;
;; Max
;if exists(param.X)
;	set global.FanSpeedMax = min(max(param.X, 0), 1)

if exists(param.E)
	set global.FanDisable = false

var SpeedInput = exists(param.S) ? param.S : 0
var SpeedNormal = var.SpeedInput > 1 ? (var.SpeedInput / 255) : var.SpeedInput;

;var SpeedOutput = var.SpeedNormal
;set var.SpeedOutput = min(var.SpeedOutput, global.FanSpeedMax)
;set var.SpeedOutput = max(var.SpeedOutput, global.FanSpeedMin)
;set var.SpeedOutput = floor(var.SpeedOutput * 1000) / 1000
;
;var IsBridging = var.SpeedInput == 255 ? true : false

if global.FanDisable
	; ...
elif exists(param.D)
	set global.FanDisable = true
	M107
else
	M106 S{var.SpeedNormal}
