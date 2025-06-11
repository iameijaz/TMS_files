import os
import re
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Define the directory where dump files are located
dump_dir = '.'

# Prepare list to collect (ix, iy, energy) data
data = []

# Regex patterns to extract per-atom energy
pattern_energy = re.compile(r'ITEM: ATOMS.*c_peratom')

# Read all dump files
for filename in sorted(os.listdir(dump_dir)):
    if filename.startswith('dump.relax.1.') and filename.split('.')[-1].isdigit():
        with open(os.path.join(dump_dir, filename), 'r') as file:
            lines = file.readlines()
        
        # Find the index of the "ITEM: ATOMS" line
        atom_start_idx = next(i for i, line in enumerate(lines) if line.startswith("ITEM: ATOMS"))
        atom_lines = lines[atom_start_idx + 1:]

        # Extract per-atom energy (6th column assumed)
        energies = [float(line.split()[5]) for line in atom_lines]
        total_energy = sum(energies)

        # Extract displacement step from filename
        step = int(filename.split('.')[-1])
        data.append((step, total_energy))

# Convert to DataFrame
df = pd.DataFrame(data, columns=['Step', 'TotalEnergy'])

# Normalize and reshape if needed
df['NormalizedEnergy'] = df['TotalEnergy'] - df['TotalEnergy'].min()

# Plot
plt.figure(figsize=(10, 6))
plt.plot(df['Step'], df['NormalizedEnergy'], marker='o')
plt.title('Generalized Stacking Fault Energy Profile')
plt.xlabel('Displacement Step Index')
plt.ylabel('Normalized Energy (eV)')
plt.grid(True)
plt.tight_layout()
plt.show()

