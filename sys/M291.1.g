var msg = exists(param.P) ? param.P : "Yes or No?"
var title = exists(param.R) ? param.R : "Confirm"
var timeout = exists(param.T) ? param.T : 0
var showCancel = exists(param.J) && (param.J > 0 || param.J == true) ? 1 : 0
var choices = exists(param.K) ? param.K : {"No", "Yes"}
var default = exists(param.F) ? param.F : 0

M291 P{var.msg} R{var.title} S4 T{var.timeout} J{var.showCancel} K{var.choices} F{var.default}
