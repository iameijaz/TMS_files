#!/bin/bash

# Output file
echo "# Filename    Avg_PerAtom_PE" > SFE_Gamma

# Loop over all dump files
for file in dump.relax.1.*; do
    # Extract the lines with atom data and compute average of the last column (c_peratom)
    avg_pe=$(awk '/^ITEM: ATOMS/ {found=1; next} found {sum += $(NF); count++} END {if (count>0) print sum/count}' "$file")
    echo "$file    $avg_pe" >> SFE_Gamma
done

echo "Extraction complete. Results saved in SFE_Gamma."

