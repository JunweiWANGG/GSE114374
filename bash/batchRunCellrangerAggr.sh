#!/bin/bash

PROJROOT=/fast/users/a163284/GSE114374
SAMPLES=$(ls ${PROJROOT}/2_cellrangerAggr/CSV_files)
echo -e "Found:\n${SAMPLES}"

for S in ${SAMPLES}
do 
	echo "sbatch ${PROJROOT}/bash/Run_Cellranger_aggr.sh ${S}"
done
