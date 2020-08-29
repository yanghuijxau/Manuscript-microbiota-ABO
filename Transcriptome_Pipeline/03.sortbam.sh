#!/bin/bash
#PBS -N sortbam
#PBS -l nodes=1:ppn=2,mem=10gb
#PBS -e ./Transcriptome/jobs_out
#PBS -o ./Transcriptome/jobs_out
#PBS -q fat
#PBS -t 0-299

# Kill script if any commands fail
set -e

echo "job started at:"
date


bamfile=./Transcriptome/02.STAR_mapping
output=./Transcriptome/03.sortedbam
samtools=~/bin/samtools
TMP=./Transcriptome/03.sortedbam/TMP

cd $bamfile
bam=(`ls *.bam`)

echo "ARRAY JOB: ${sam[$PBS_ARRAYID]}"
NAME=`echo ${bam[$PBS_ARRAYID]} | awk '{split($0,arra,"."); print arra[1]}'`

echo "sort bam file"
${samtools} sort -T ${TMP}/${NAME}.sorted -o ${output}/${NAME}.sorted.bam ${bamfile}/${NAME}.bam -@ 2  

echo "create indexed bam file:" 
${samtools} index ${output}/${NAME}.sorted.bam -@ 2

echo "job finished at:"
date
