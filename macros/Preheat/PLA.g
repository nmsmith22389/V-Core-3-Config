var temps = {{225,112}, {55,55}}

M568 P0 S{var.temps[0][0]} R{var.temps[0][1]} A1
M140 S{var.temps[1][0]} R{var.temps[1][1]}
M144

echo "Heating Up..."
