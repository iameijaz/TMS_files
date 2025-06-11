#!/bin/bash

nx=30  # Number of displacements along x (⟨112⟩)
ny=30  # Number of displacements along y (⟨110⟩)

input="SFE_Gamma"
output="SFE_Gamma_surface.dat"

echo "# x_index  y_index  Avg_PE" > "$output"

i=0
tail -n +2 "$input" | while read -r fname energy; do
    x_index=$((i % nx))
    y_index=$((i / nx))
    printf "%d %d %f\n" "$x_index" "$y_index" "$energy" >> "$output"
    ((i++))
done

echo "Formatted gamma surface data saved to: $output"

