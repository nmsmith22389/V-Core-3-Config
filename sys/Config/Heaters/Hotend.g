M308 S1 P"121.temp0" Y"thermistor" T100000 B4138 ; configure sensor 1 as thermistor on pin 121.temp0
M950 H1 C"121.out0" T1                           ; create nozzle heater output on 121.out0 and map it to sensor 1
M307 H1 B0 S1.00                                 ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S285                                     ; set temperature limit for heater 1 to 280C
