#!/bin/bash

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
		if [ ${SP} == "Mouse" ]
		then
			REF=/fast/users/a1634284/Cell_ranger/mm10
		else
			echo "Could not determine species"
			exit
		fi
	fi
	echo "sbatch ${PROJROOT}/bash/Run_Cellranger_count.sh ${S} ${REF}"
done
