var Speed = exists(param.S) ? param.S : 45 ; mm/s

G90

G0 X100 Y100 F{var.Speed * 60} ; X: 100 - Y: 100

G91

G0 X100 ; X: 200 - Y: 100

G0 Y100 ; X: 200 - Y: 200

G0 X-100 ; X: 100 - Y: 200

G0 Y-100 ; X: 100 - Y: 100
