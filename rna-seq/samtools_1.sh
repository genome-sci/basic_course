#!/bin/bash
#$ -S /bin/bash
#$ -N samtools
#$ -pe def_slot 4
#$ -cwd

module load singularity

f=("SRR453566")

singularity exec /usr/local/biotools/s/samtools\:1.6--0.1 samtools sort \
-@ 4 -o ${f}.sort.bam ${f}.sam
