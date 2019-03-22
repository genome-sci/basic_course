#!/bin/bash
#$ -S /bin/bash
#$ -N stringtie
#$ -pe def_slot 4
#$ -cwd

module load singularity

files=("SRR453566" "SRR453567" "SRR453569" "SRR453570")

for f in ${files[@]}
do
	singularity exec /usr/local/biotools/s/stringtie\:1.3.3--py36_2.1 stringtie -e -B -p 4 \
	-G annotation/genes.gtf \
	-o ballgown/${f}/${f}.gtf ${f}.sort.bam
done
