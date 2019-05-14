#!/bin/bash
#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --time=06:00:00
#SBATCH --mem=32GB
#SBATCH -o /fast/users/a1634284/GSE114374/slurm/%x_%j.out
#SBATCH -e /fast/users/a1634284/GSE114374/slurm/%x_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1634284@student.adelaide.edu.au

# Load modules
module load SAMtools/1.3.1-foss-2016b

# Define ID and Paths
ID=$1
SOURCEDIR=/fast/users/a1634284/GSE114374/0_rawData/fastq

# Ensure that the ID has been set
if [ -z "${ID}"]
then
	echo "You need to set the ID argument!"
	exit 1
fi

# Setup to manually specify the reference 
REF=$2
# Ensure that the ID has been set
if [ -z "${REF}"]
then
	echo "You need to set the Reference as well as the ID!"
	exit 2
fi

# CellRanger will write to the current directory, so 
# let's change into this directory to set our output
OUTDIR=/fast/users/a1634284/GSE114374/1_cellrangerCount
echo "Sample will be written to ${OUTDIR}/${ID}"
cd ${OUTDIR}


# Find FASTQ directories 
FQ=$(find ${SOURCEDIR}/${ID} -maxdepth 1 -mindepth 1 | tr '\n' ',' | sed -r 's/,$/\n/g') 
echo "Found ${FQ}"

# cell ranger count
cellranger count --id=${ID}  \
 	--transcriptome=${REF}  \
 	--sample=bamtofastq \
	--fastqs=${FQ} \
	--chemistry=SC3Pv2 \
 	--localcores=8 \
 	--localmem=32


