
; => C_Pre_FilamentDiameter
if exists(global.C_Pre_FilamentDiameter)
    set global.C_Pre_FilamentDiameter = 1.75
else
    global C_Pre_FilamentDiameter = 1.75

; => C_Pre_NozzleDiameter
if exists(global.C_Pre_NozzleDiameter)
    set global.C_Pre_NozzleDiameter = 0.4
else
    global C_Pre_NozzleDiameter = 0.4
