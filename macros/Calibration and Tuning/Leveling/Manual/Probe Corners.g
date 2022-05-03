var BedPadding = 30
var XMin = 0 + var.BedPadding
var YMin = 0 + var.BedPadding
var XMax = 310 - var.BedPadding
var YMax = 305 - var.BedPadding

G28 Z

G30 P0 X{var.XMin} Y{var.YMin} Z-99999 S-1
G30 P0 X{var.XMax} Y{var.YMin} Z-99999 S-1
G30 P0 X{var.XMax} Y{var.YMax} Z-99999 S-1
G30 P0 X{var.XMin} Y{var.YMax} Z-99999 S-1