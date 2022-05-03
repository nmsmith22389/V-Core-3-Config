; Sliced On: {date} {day} {time}

; ===== Vars =====

; Set global var
set global.SlicerETemp = {material_print_temperature_layer_0}

; Set global var
set global.SlicerBTemp = {material_bed_temperature_layer_0}

; Set global var
set global.SlicerRetractDistance = {retraction_amount}

; Set global var
set global.SlicerRetractSpeed = {retraction_speed}

;MESH_VARS

M98 P"Slicer/Start.g"