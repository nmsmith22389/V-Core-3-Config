var Br = exists(param.B) ? param.B : 0.7
var P = floor(255 * var.Br)
;echo var.P

set global.LightsOn = true

M150 S43 W255 P{var.P} ; White
