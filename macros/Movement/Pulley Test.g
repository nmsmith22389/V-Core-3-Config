var CenterX = 150
var CenterY = 150
var Amount = 50
var Speed = 60
var Count = exists(param.C) ? param.C : 5

G0 F{var.Speed * 60}

while iterations < var.Count
    G0 X{var.CenterX - var.Amount} Y{var.CenterY - var.Amount}
    G0 X{var.CenterX + var.Amount} Y{var.CenterY + var.Amount}
