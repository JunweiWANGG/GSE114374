#!/bin/bash

PROJROOT=/fast/users/a1634284/GSE114374
SAMPLES=$(ls ${PROJROOT}/0_rawData/fastq)
echo -e "Found:\n${SAMPLES}"

for S in ${SAMPLES}
do
  echo "sbatch ${PROJROOT}/bash/Run_Cellranger_count.sh ${S}"
done
