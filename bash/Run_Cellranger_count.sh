#!/bin/bash
#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --time=04:00:00
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
OUTDIR=/fast/users/a1634284/GSE114374/1_cellrangerCount
NEWID=$(echo ${ID} | sed -r 's/_//g')

# Find FASTQ directories 
FQ=$(find ${SOURCEDIR}/${ID} -maxdepth 1 -mindepth 1 | tr '\n' ',' | sed -r 's/,$/\n/g') 
echo "Found ${FQ}"

echo "Sample will be written as ${NEWID}"

# cell ranger count 
cellranger count --id=${NEWID}  \
--transcriptome=/fast/users/a1634284/Cell_ranger/mm10  \
--sample=bamtofastq \
--fastqs=${FQ} \
--chemistry=SC3Pv2 \
--localcores=8


