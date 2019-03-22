#!/bin/bash
#$ -S /bin/bash
#$ -N hisat2
#$ -pe def_slot 4
#$ -cwd

module load singularity

f=("SRR453566")

singularity exec /usr/local/biotools/h/hisat2\:2.1.0--py36pl5.22.0_0.1 hisat2 \
-p 4 -x r64_tran/genome_tran --dta \
-1 fastq/${f}_1.fq \
-2 fastq/${f}_2.fq \
-S ${f}.sam
