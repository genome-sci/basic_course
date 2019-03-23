#!/bin/bash
#$ -S /bin/bash
#$ -N samtools
#$ -pe def_slot 4
#$ -cwd

module load singularity

f=("SRR453566" "SRR453567" "SRR453568" "SRR453569" "SRR453570" "SRR453571")

for file in ${f[@]}
do
	singularity exec /usr/local/biotools/s/samtools\:1.6--0.1 samtools sort \
	-@ 4 -o ${file}.sort.bam ${file}.sam
done
