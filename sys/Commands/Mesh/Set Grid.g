var XMin = floor(global.SlicerMeshXMin)
var XMax = floor(global.SlicerMeshXMax)
var YMin = floor(global.SlicerMeshYMin)
var YMax = floor(global.SlicerMeshYMax)

var FootX = var.XMax - var.XMin
var FootY = var.YMax - var.YMin
var ProbesMinX = max(floor(var.FootX / global.SlicerMeshSpacingMin), 2)
var ProbesMinY = max(floor(var.FootY / global.SlicerMeshSpacingMin), 2)
var ProbeCountX = min(var.ProbesMinX, global.SlicerMeshProbesMax)
var ProbeCountY = min(var.ProbesMinY, global.SlicerMeshProbesMax)


M557 X{var.XMin, var.XMax} Y{var.YMin, var.YMax} P{var.ProbeCountX, var.ProbeCountY}

echo "Set mesh to: X" ^var.XMin ^ ":" ^ var.XMax ^ " Y" ^ var.YMin ^ ":" ^ var.YMax ^ " P" ^ var.ProbeCountX ^ ":" ^ var.ProbeCountY