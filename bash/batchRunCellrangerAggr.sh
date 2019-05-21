#!/bin/bash

PROJROOT=/fast/users/a1634284/GSE114374
SAMPLES=$(ls ${PROJROOT}/2_cellrangerAggr/CSV_files)
echo -e "Found:\n${SAMPLES}"

for S in ${SAMPLES}
do 
	sbatch ${PROJROOT}/bash/Run_Cellranger_aggr.sh ${S}
done
