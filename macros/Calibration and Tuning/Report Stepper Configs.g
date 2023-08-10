var axisIndex = 0

var axisLetter = move.axes[var.axisIndex].letter
; driver = move.axes[var.axisIndex].drivers

var axisOutput = ""
var driver = ""

while var.axisIndex < #move.axes
    ; set var.axisOutput = "Axis Index: " ^ var.axisIndex ^ "<br>"
    set var.axisOutput = ""

    ;& Set axis letter
    set var.axisLetter = move.axes[var.axisIndex].letter

    set var.axisOutput = var.axisOutput ^ "Axis letter: " ^ var.axisLetter ^ "<br>"

    set var.axisOutput = var.axisOutput ^ "<br>Drivers: " ^ "<br>"

    while iterations <= #move.axes[var.axisIndex].drivers
        if exists(move.axes[var.axisIndex].drivers[iterations])
            set var.axisOutput = var.axisOutput ^ "&Tab;- " ^ move.axes[var.axisIndex].drivers[iterations] ^ "<br>"
            ; echo "[" ^ move.axes[var.axisIndex].drivers[iterations] ^ "]"
        else
            contiue

    echo "--------------------<br>" ^ var.axisOutput ^ "--------------------"


    ;> Increment
    set var.axisIndex = var.axisIndex + 1
