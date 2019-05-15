#!/bin/bash

#Only used for rerun the Human samples, 
#as the last run was timeout

PROJROOT=/fast/users/a1634284/GSE114374
SAMPLES=$(ls ${PROJROOT}/0_rawData/fastq)
echo -e "Found:\n${SAMPLES}"


for S in ${SAMPLES}
do
	# Check the species
	SP=$(echo ${S} | sed -r 's/(Human|Mouse).+/\1/g')
	echo "Detected that the species is ${SP}"
	if [ ${SP} == "Human" ]
	then
		REF=/fast/users/a1634284/Cell_ranger/GRCh38
	else
		echo "Only rerun the Human samples"
		exit
	fi
	sbatch ${PROJROOT}/bash/Run_Cellranger_count.sh ${S} ${REF}
done
