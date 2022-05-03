M400    ; let moves finish
G90     ; absolute
G4 P200 ; wait a sec
G0 X{move.axes[0].max / 2} Y{move.axes[1].max / 2} F6000