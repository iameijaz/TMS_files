#!/bin/bash

# Interactive user input (already fixed)
STUDENT_NAME="IjazAhmed"
MATRIKEL_NR="71805"

# Create correct main folder name
MAIN_FOLDER="${MATRIKEL_NR}_${STUDENT_NAME}_TMS2025_PVL"
mkdir -p "$MAIN_FOLDER/PotentialProperties"

# Enter main folder
cd "$MAIN_FOLDER" || exit

# Create ProgramSXgeneration folder
mkdir -p ProgramSXgeneration

# Copy PDF & comparison table (dummy files for now)
touch "Williams_2006_Modelling_Simul_Mater_Sci_Eng.pdf"
touch "PotentialProperties_ComparisonTable.txt"

# Create correct subfolders under PotentialProperties
cd PotentialProperties

mkdir -p LatticeConst_Ecoh
touch LatticeConst_Ecoh/LatticeConstant.txt
touch LatticeConst_Ecoh/CohesiveEnergy.txt

mkdir -p VacFormEnergy
touch VacFormEnergy/VacancyFormationEnergy.txt

mkdir -p SurfEnergy
touch SurfEnergy/SurfaceEnergy_100.txt
touch SurfEnergy/SurfaceEnergy_110.txt
touch SurfEnergy/SurfaceEnergy_112.txt
touch SurfEnergy/SurfaceEnergy_111.txt

mkdir -p SFE
touch SFE/USF.txt
touch SFE/SSF.txt
touch SFE/UTF.txt

mkdir -p ElasConst
touch ElasConst/ElasticConstants.txt

cd ../

echo
echo "✅ Correct folder structure for TMS2025_PVL created successfully!"
echo "✅ Main directory: ${PWD}"

