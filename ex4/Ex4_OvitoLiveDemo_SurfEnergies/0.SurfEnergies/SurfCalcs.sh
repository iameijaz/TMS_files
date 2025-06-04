#!/bin/bash

# Your cohesive energy from bulk calculation
E_bulk_per_atom=-2.84999997472111

# Loop over all your log files
for file in log_Surface_energy_*.lammps
do
    # Extract surface type (100, 110, 111, 112)
    surf=$(echo $file | grep -oP 'Surface_energy_\K[0-9]+')

    # Extract total energy of the slab
    etot=$(grep "Total energy of the slab" $file | tail -1 | grep -oP '[-]?[0-9]+\.[0-9]+')

    # Extract number of atoms
    natoms=$(grep "Number of atoms" $file | tail -1 | grep -oP '[0-9]+')

    # Extract lx and ly from latest thermo block
    lx=$(grep -A1 "Step" $file | tail -1 | awk '{print $11}')
    ly=$(grep -A1 "Step" $file | tail -1 | awk '{print $12}')

    # Compute surface area (convert Å² to m²)
    A=$(echo "$lx * $ly * 1e-20" | bc -l)

    # Compute surface energy
    gamma=$(echo "scale=8; ($etot - $natoms * $E_bulk_per_atom) / (2 * $A)" | bc -l)

    # Output nicely
    printf "Surface (%s): Energy = %s eV, Atoms = %s, Area = %.5e m², Surface Energy = %.5f J/m²\n" \
      "$surf" "$etot" "$natoms" "$A" "$gamma"
done

