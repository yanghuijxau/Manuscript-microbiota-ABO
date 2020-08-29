#!/bin/bash
#PBS -N RNASeq_stringtie
#PBS -l nodes=1:ppn=2,mem=6gb 
#PBS -e ./Transcriptome/jobs_out
#PBS -o ./Transcriptome/jobs_out 
#PBS -q fat
#PBS -t 0-299


#nprocs=`wc -l < $PBS_NODEFILE`

stringtie=~/bin/stringtie
gtf=./Transcriptome/01.susScr11_STAR/Sus_scrofa.Sscrofa11.1.90.gtf
REF=./Transcriptome/01.susScr11_STAR/Sscrofa11.1.fa
INPUT=./Transcriptome/03.sortedbam
OUTPUT=./Transcriptome/04.stringtie

cd $INPUT
Fastq=(`ls *.sorted.bam`)

echo "ARRAY JOB: ${Fastq[$PBS_ARRAYID]}"
NAME=`echo ${Fastq[$PBS_ARRAYID]} | awk '{split($0,arra,".sorted.bam"); print arra[1]}'`

$stringtie ${INPUT}/${NAME}.sorted.bam -b ${OUTPUT} -e -G $gtf -C ${OUTPUT}/${NAME}_cov_ref.gtf -p 2 -o ${OUTPUT}/${NAME}.gtf
