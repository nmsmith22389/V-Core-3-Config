var FootX = global.SlicerMeshXMax - global.SlicerMeshXMin
var FootY = global.SlicerMeshYMax - global.SlicerMeshYMin
var ProbesMinX = max(floor(var.FootX / global.SlicerMeshSpacingMin), 2)
var ProbesMinY = max(floor(var.FootY / global.SlicerMeshSpacingMin), 2)
var ProbeCountX = min(var.ProbesMinX, global.SlicerMeshProbesMax)
var ProbeCountY = min(var.ProbesMinY, global.SlicerMeshProbesMax)



M557 X{global.SlicerMeshXMin, global.SlicerMeshXMax} Y{global.SlicerMeshYMin, global.SlicerMeshYMax} P{var.ProbeCountX, var.ProbeCountY}

echo "Set mesh to: X" ^ global.SlicerMeshXMin ^ ":" ^ global.SlicerMeshXMax ^ " Y" ^ global.SlicerMeshYMin ^ ":" ^ global.SlicerMeshYMax ^ " P" ^ var.ProbeCountX ^ ":" ^ var.ProbeCountY