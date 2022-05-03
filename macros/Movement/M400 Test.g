var Speed = 50 * 60
var XStart = 50
var XEnd = 250

echo "1"
G0 X{var.XStart} F6000
M400
echo "2"
G0 X{var.XEnd} F{var.Speed}
M400
echo "3"
G0 X{var.XStart}
M400
echo "4"
G0 X{var.XEnd}
M400
echo "5"
G0 X{var.XStart}
M400
echo "End"
