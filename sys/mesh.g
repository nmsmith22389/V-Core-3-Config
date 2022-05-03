;;; ;M401
;;; ;M280 P0 S60 ; Touch SW
;;; ;set global.LevelingZ = true
;;; set global.ProbingMesh = 1
;;; G29 S0
;;; set global.ProbingMesh = 0
;;; ;set global.LevelingZ = false
;;; M402


;;;================================

var MeshFirstX = move.compensation.probeGrid.mins[0]
var MeshFirstY = move.compensation.probeGrid.mins[1]
var ProbeOffsetX = sensors.probes[0].offsets[0]
var ProbeOffsetY = sensors.probes[0].offsets[1]

var FirstPointX = var.MeshFirstX - var.ProbeOffsetX
var FirstPointY = var.MeshFirstY - var.ProbeOffsetY

var ZUp = sensors.probes[0].diveHeight
var ZDown = sensors.probes[0].diveHeight * -1

var RaiseLowerSpeed = 1500
var MoveSpeed = 9000

var Debug = false

if var.Debug
	echo {"<b>MeshFirstX:</b> " ^ var.MeshFirstX}
	echo {"<b>MeshFirstY:</b> " ^ var.MeshFirstY}
	echo {"<b>ProbeOffsetX:</b> " ^ var.ProbeOffsetX}
	echo {"<b>ProbeOffsetY:</b> " ^ var.ProbeOffsetY}
	echo {"<b>FirstPointX:</b> " ^ var.FirstPointX}
	echo {"<b>FirstPointY:</b> " ^ var.FirstPointY}
	echo {"<b>ZUp:</b> " ^ var.ZUp}
	echo {"<b>ZDown:</b> " ^ var.ZDown}
	echo {"<b>RaiseLowerSpeed:</b> " ^ var.RaiseLowerSpeed}
	echo {"<b>MoveSpeed:</b> " ^ var.MoveSpeed}

	M99
	
G28 Z

G91                                                          ;Relative positioning

G0 Z{var.ZUp} F{var.RaiseLowerSpeed}                         ;Raise Z 5mm

G90                                                          ;Absolute positioning

G0 X{var.FirstPointX} Y{var.FirstPointY} F{var.MoveSpeed}    ;Here goes First_Point_X and First_Point_Y positions you calculated above

G91                                                          ;Relative positioning

G0 Z{var.ZDown} F{var.RaiseLowerSpeed}                       ;Return Z 5mm

G90                                                          ;Absolute positioning

;M98 P"Config/Probe/Probe_Config_Fast.g"                      ;Call probe_config_fast.g module (Switch to Fast Probe Mode)
M401                                                         ;Deploy the probe

set global.ProbingMesh = true
set global.Probing = true

G29 S0                                                       ;Probe the heatbed and generate heightmap

set global.ProbingMesh = false
set global.Probing = false

M402                                                         ;Retract the probe
;M98 P"Config/Probe/Probe_Config.g"                           ;Call probe_config.g module (Switch to Default Probe Mode)

;G91                                                          ;Relative positioning
;
;G1 Z{var.ZUp} F{var.RaiseLowerSpeed}                         ;Raise Z 5mm
;
;G90                                                          ;Absolute positioning
;
;G0.1                                                         ; Center Nozzle or Park
;
;G91                                                          ;Relative positioning
;
;G1 Z{var.ZDown} F{var.RaiseLowerSpeed}                       ;Return Z 5mm
;
;G90                                                          ;Absolute positioning