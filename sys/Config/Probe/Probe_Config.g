;M558 P9 C"121.io0.in" H5 F900:400 T6000 R0.1
; NOTE: Switched to a single probe because the probe was erroring out

; OLD
;M558 P9 C"121.io0.in" H5 F240 T10800 R0.1
M558 P9 C"121.io0.in" H2 F180 T9000 R0

; NEW
;M558 P9 C"121.io0.in" H5 F900:300 T6000 R0.1 A2

; Set bed compensation taper
M376 H8

M98 P"Config/Probe/Probe_Offset.g"
M98 P"Config/Probe/Mesh_Grid.g"
