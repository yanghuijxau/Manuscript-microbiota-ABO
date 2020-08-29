#!/bin/bash
#PBS -N RNASeq_stringtie
#PBS -l nodes=1:ppn=2,mem=6gb 
#PBS -e ./Transcriptome/jobs_out
#PBS -o ./Transcriptome/jobs_out 
#PBS -q fat


#nprocs=`wc -l < $PBS_NODEFILE`

stringtie=~/bin/stringtie
gtf=./Transcriptome/01.susScr11_STAR/Sus_scrofa.Sscrofa11.1.90.gtf
INPUT=./Transcriptome/04.stringtie
OUTPUT=./Transcriptome/05.stringtie_merge

cd $INPUT
ls *1a.gtf >stringtie_mergelist.txt

#stringTie --merge
$stringtie --merge -p 8 -G $gtf -o ${OUTPUT}/stringtie_merged.gtf ${INPUT}/stringtie_mergelist.txt
