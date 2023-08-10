var toolHeater = tools[0].heaters[0]
var toolTemp = heat.heaters[var.toolHeater].current

var minTemp = max(heat.coldExtrudeTemperature, 200)

if var.toolTemp < var.minTemp
    abort "Temp too low to extrude."

; G10 P0 S200 R160    ; set temperatures for PLA

T0                  ; select tool

M116                ; wait for temperatures to be reached

G1 E-0.3 F300       ; retract a little filament

M400                ; wait for move to finish before changing current

M915 E0 S3          ; set stall sensitivity

M913 E30            ; motor current to 30%

M83                 ; relative extrusion

G1 H1 E800 F6000    ; feed up to 800mm until stall

M913 E100           ; restore normal motor current

G1 E50 F120         ; extrude 50mm @ 2mm/sec
