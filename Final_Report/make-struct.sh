#!/bin/bash

# Interactive user input
STUDENT_NAME="IjazAhmed"
MATRIKEL_NR="71805"

# Static paper info based on the given paper
MATERIAL="CuAg"
FIRST_AUTHOR="Williams"
JOURNAL="MSMSE"
YEAR="2006"

# Create main folder
MAIN_FOLDER="${STUDENT_NAME}_${MATRIKEL_NR}_${MATERIAL}_${FIRST_AUTHOR}_${JOURNAL}_${YEAR}"
mkdir -p "$MAIN_FOLDER"

# Enter main folder
cd "$MAIN_FOLDER" || exit

# Create dummy PDF file for the paper
touch "Williams_2006_Modelling_Simul_Mater_Sci_Eng.pdf"

# Create dummy table file for potential properties comparison
touch "PotentialProperties_ComparisonTable.txt"

# Create subfolders and dummy files
mkdir -p 0.LatticeConst_Ecoh
touch 0.LatticeConst_Ecoh/LatticeConstant.txt
touch 0.LatticeConst_Ecoh/CohesiveEnergy.txt

mkdir -p 1.VacFormEner
touch 1.VacFormEner/VacancyFormationEnergy.txt

mkdir -p 2.SurfEner
touch 2.SurfEner/SurfaceEnergy_100.txt
touch 2.SurfEner/SurfaceEnergy_110.txt
touch 2.SurfEner/SurfaceEnergy_112.txt
touch 2.SurfEner/SurfaceEnergy_111.txt

mkdir -p 3.SFE
touch 3.SFE/USF.txt
touch 3.SFE/SSF.txt
touch 3.SFE/UTF.txt

mkdir -p 4.ElasConsts
touch 4.ElasConsts/ElasticConstants.txt

echo
echo "✅ Folder structure with dummy files created successfully."
echo "✅ You can find it here: ${PWD}"

