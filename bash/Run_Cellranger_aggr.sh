#!/bin/bash
#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --time=12:00:00
#SBATCH --mem=32GB
#SBATCH -o /fast/users/a1634284/GSE114374/slurm/%x_%j.out
#SBATCH -e /fast/users/a1634284/GSE114374/slurm/%x_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1634284@student.adelaide.edu.au

# Load modules
module load SAMtools/1.3.1-foss-2016b

# Define ID, CSV and Paths
ID=$1
SOURCEDIR=/fast/users/a1634284/GSE114374/2_cellrangerAggr


# Ensure that the ID has been set
if [ -z "${ID}"]
then
	echo "You need to set the ID argument!"
	exit 1
fi

# Find the CSV files
CSV=$(find ${SOURCEDIR}/CSV_files/${ID})
echo "Found ${CSV}"

# CellRanger will write to the current directory , so
# let's change into this directory to set our ourput
OUTDIR=/fast/users/a1634284/GSE114374/2_cellrangerAggr
echo "Sample will be written to ${OUTDIR}/${ID}"
cd ${OUTDIR}

# cellranger aggr
cellranger aggr --id=${ID} \
	--csv=${CSV} \
	--normalize=mapped

