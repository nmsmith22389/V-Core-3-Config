M557 X40:260 Y40:270 P2  ; Set to probe corners
G29 S2					 ; Clear old heightmap
G29                      ; Probe corners
G29 S3 P"corners.csv"    ; Save results to file

M117 "To run Mesh Leveling (G29) again to restore the original heightmap."