#!/bin/bash
#$ -S /bin/bash
#$ -N hisat2
#$ -pe def_slot 4
#$ -cwd

module load singularity

files=("SRR453567" "SRR453569" "SRR453570")

for f in ${files[@]}
do
## HISAT2
singularity exec /usr/local/biotools/h/hisat2\:2.1.0--py36pl5.22.0_0.1 hisat2 \
-p 4 -x r64_tran/genome_tran --dta \
-1 fastq/${f}_1.fq \
-2 fastq/${f}_2.fq \
-S ${f}.sam

## samtools
singularity exec /usr/local/biotools/s/samtools\:1.6--0.1 samtools sort \
-@ 4 -o ${f}.sort.bam ${f}.sam

done
