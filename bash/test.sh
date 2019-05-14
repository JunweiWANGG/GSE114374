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

# cell ranger count 
cellranger count --id=/fast/users/a1634284/GSE114374/0_rawData/fastq/Mouse_HC_1  \
--transcriptome=/fast/users/a1634284/Cell_ranger/mm10  \
--sample=bamtofastq \
--fastqs=/fast/users/a1634284/GSE114374/0_rawData/fastq/Mouse_HC_1/HC1_3L_MissingLibrary_1_HKJCWBBXX,/fast/users/a1634284/GSE114374/0_rawData/fastq/Mouse_HC_1/HC1_3L_MissingLibrary_1_HKJNNBBXX \
--chemistry=SC3Pv2 \
--localcores=8
