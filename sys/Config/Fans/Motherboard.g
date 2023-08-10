; M950 F3 C"out6"                  ; create fan 2 on pin out5
; M106 P3 C"Motherboard" S1 H-1    ; set fan 2 name and value. Thermostatic control is turned off

M950 F3 C"out6"                   ; create fan 3 on pin fan2 and set its frequency
M106 P3 L0.5 X1 S1 B0.5 H3:4 T30 ; set fan 3 value
