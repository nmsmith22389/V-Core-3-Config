var Tc = boards[0].mcuTemp.current
var Bt = heat.heaters[0].current
var ExtTemp = heat.heaters[1].current
var Tr = (var.Bt + var.ExtTemp) / 2
var TitleStr = "MCU Calibration"
var TempsStr = "<h4>Params</h4><ul><li>Tc: " ^ var.Tc ^ "° C</li><li>H1: " ^ var.ExtTemp ^ "° C</li><li>H0: " ^ var.Bt ^ "° C</li><li>Tr: " ^ var.Tr ^ "° C</li></ul>"
var MsgStr = "<h4>Code</h4><code>M912 P0 S" ^ (var.Tr - var.Tc) ^ "</code><br/><p>Press <b>OK</b> to run code.</p>"

M291 R{var.TitleStr} P{var.TempsStr} S3
M291 R{var.TitleStr} P{var.MsgStr} S3

M912 P0 S{var.Tr - var.Tc}

M291 R{var.TitleStr} P"<h2 style=""color: #00FF00"">Calibration Complete!</h2>" S1