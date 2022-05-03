var BedPadding = 30
var PosX = move.axes[0].max - var.BedPadding
var PosY = move.axes[1].max - var.BedPadding

G28 Z

G30 P0 X{var.PosX} Y{var.PosY} Z-99999 S-1