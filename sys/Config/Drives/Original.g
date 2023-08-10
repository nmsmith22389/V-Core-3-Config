M569 P0.5 S1 V45                                 ; physical drive 0.0 goes forwards
M569 P0.1 S0 V45                                 ; physical drive 0.1 goes forwards
M569 P0.2 S0 V50                                 ; physical drive 0.2 goes forwards
M569 P0.3 S0 V50                                 ; physical drive 0.3 goes forwards
M569 P121.0 D3 S0 V40                            ; physical drive 121.0 goes forwards
M584 X0.0 Y0.1 Z0.3:0.2 E121.0                   ; set drive mapping

M350 X16 Y16 Z16 E16 I1                          ; configure microstepping with interpolation

M92 X80.00 Y80.00 Z400.00 E400.00                ; set steps per mm

M566 X600.00 Y600.00 Z120.00 E300.00 P1          ; set maximum instantaneous speed changes (mm/min)

M203 X12000.00 Y12000.00 Z1200.00 E3000.00       ; set maximum speeds (mm/min)

M201 X500.00 Y500.00 Z30.00 E250.00              ; set accelerations (mm/s^2)

M906 X800 Y800 Z450 E500 I30                     ; set motor currents (mA) and motor idle factor in per cent

M84 S30                                          ; Set idle timeout
