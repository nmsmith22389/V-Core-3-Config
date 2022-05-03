
; Log file
var logFile = "Logs/" ^ state.time 

; Default log level (1..3)
var defaultLogLvl = 3

var logLvl = exists(param.S) ? param.S : var.defaultLogLvl

; Clamp log level
set var.logLvl = min(max(var.logLvl, 1), 3)

; Set log level
M929 S{var.logLvl}