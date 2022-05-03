var BedPadding = 30
var XMin = move.axes[0].min + var.BedPadding
var YMin = move.axes[1].min + var.BedPadding
var XMax = move.axes[0].max - var.BedPadding
var YMax = move.axes[1].max - var.BedPadding

G30 P0 X{var.XMin} Y{var.YMin} Z-99999
G30 P1 X{var.XMax} Y{var.YMin} Z-99999
G30 P2 X{var.XMax} Y{var.YMax} Z-99999
G30 P3 X{var.XMin} Y{var.YMax} Z-99999 S-1