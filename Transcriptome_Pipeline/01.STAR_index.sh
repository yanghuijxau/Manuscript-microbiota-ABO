#!/bin/bash
#PBS -N STAR
#PBS -l nodes=1:ppn=3,mem=10gb
#PBS -e ./Transcriptome/jobs_out/
#PBS -o ./Transcriptome/jobs_out/
#PBS -q fat

STAR=~/bin/STAR-2.5.3a/STAR/bin/Linux_x86_64_static/STAR
DIR=./Transcriptome/01.susScr11_STAR
Reference=./Transcriptome/01.susScr11_STAR/Sscrofa11.1.fa
gtf=./Transcriptome/01.susScr11_STAR/Sus_scrofa.Sscrofa11.1.90.gtf
thread=10

${STAR} --runThreadN $thread --runMode genomeGenerate --genomeDir $DIR \
--genomeFastaFiles $Reference \
--sjdbGTFfile $gtf \
--sjdbOverhang 149 #read length -1



