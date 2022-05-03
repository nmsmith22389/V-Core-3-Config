var CurrentStart = 1000
var CurrentEnd = 1700
var Step = 100

var Current = var.CurrentStart

while var.Current <= var.CurrentEnd
    if iterations > 50
        break
    M400
	M906 X{var.Current} Y{var.Current}
    echo "Current: <b>", var.Current ^ " mA</b>"
    G0 X150 Y50 F{75 * 60}
    G0 X150 Y100
    set var.Current = var.Current + var.Step

echo "Current set to normal"
M906 X1600 Y1600
