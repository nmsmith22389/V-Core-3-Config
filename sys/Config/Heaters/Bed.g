M308 S0 P"temp0" Y"thermistor" T100000 B3950 A"Bed" ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out0" T0 Q10                              ; create bed heater output on out0 and map it to sensor 0 PWM 10Hz SSR
M307 H0 B0 S1.00                                    ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                             ; map heated bed to heater 0
M143 H0 S120                                        ; set temperature limit for heater 0 to 120C
