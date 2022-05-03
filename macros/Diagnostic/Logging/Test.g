var s = +state.time

var z = floor(var.s / 86400 + 719468)

var era = floor((var.z >= 0 ? var.z : var.z - 146096) / 146097)

var doe = floor(var.z - var.era * 146097)

var yoe = floor((var.doe - var.doe / 1460 + var.doe / 36524 - var.doe / 146096) / 365)

var y = floor(var.yoe + var.era * 400)

var doy = floor(var.doe - (365 * var.yoe + var.yoe / 4 - var.yoe / 100))

var mp = floor((5 * var.doy + 2) / 153)

var d = floor(var.doy - (153 * var.mp + 2) / 5 + 1)

var m = var.mp < 10 ? var.mp + 3 : var.mp - 9

var year = var.y + (var.m <= 2 ? 1 : 0)

var month = var.m

var day = var.d

echo "s => " ^ var.s

echo "z => " ^ var.z

echo "era => " ^ var.era

echo "doe => " ^ var.doe

echo "yoe => " ^ var.yoe

echo "y => " ^ var.y

echo "doy => " ^ var.doy

echo "mp => " ^ var.mp

echo "d => " ^ var.d

echo "m => " ^ var.m

echo "Year: " ^ var.year ^ "<br>Month: " ^ var.month ^ "<br>Day: " ^ var.day