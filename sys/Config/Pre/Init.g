; General preferences
G90                                              ; send absolute coordinates...
M83                                              ; ...but relative extruder moves
M550 P"Duet 3"                                   ; set printer name
M669 K1                                          ; CoreXY
;M80 C"pson"                                     ; start 24v PSU
G4 S2                                            ; wait for expansion boards to start

; Set filament and nozzle diameter
M404 N{global.C_Pre_FilamentDiameter} D{global.C_Pre_NozzleDiameter}

M98 P"Config/Pre/Logging.g"
