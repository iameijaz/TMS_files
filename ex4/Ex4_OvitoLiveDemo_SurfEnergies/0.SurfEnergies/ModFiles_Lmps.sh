for file in *.lmpin; do
  cat >> "$file" << EOF

# Bulk cohesive energy per atom (from bulk calculation)
variable Ecoh_bulk equal -2.84999997472111

# Calculate surface area (lx * ly)
variable area equal lx*ly

# Calculate surface energy
variable surface_energy equal (etotal - v_Ecoh_bulk*v_natoms)/(2*v_area)

# Print results
print "Surface area (A^2) = \${area};"
print "Surface energy (eV/A^2) = \${surface_energy};"

EOF
done

