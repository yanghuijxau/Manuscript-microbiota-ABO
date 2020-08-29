#!/bin/bash
#PBS -N STAR
#PBS -l nodes=1:ppn=3,mem=10gb
#PBS -e ./Transcriptome/jobs_out/
#PBS -o ./Transcriptome/jobs_out/
#PBS -q fat
#PBS -t 0-299


# Kill script if any commands fail
set -e

echo "job started at:"
date

REF=./Transcriptome/01.susScr11_STAR
INPUT=./CleanData
OUTPUT=./Transcriptome/02.STAR_mapping
STAR=~/bin/STAR-2.5.3a/STAR/bin/Linux_x86_64_static/STAR
Samplefile=./Transcriptome/Samplefile.list
thread=10
#nprocs=`wc -l < $PBS_NODEFILE`

Fastq=(`cat $Samplefile`)

echo "ARRAY JOB: ${Fastq[$PBS_ARRAYID]}"
NAME=`echo ${Fastq[$PBS_ARRAYID]} | awk '{split($0,arra,"_1.clean.fq.gz"); print arra[1]}'`

${STAR} --runMode alignReads \
        --runThreadN $thread \
        --genomeDir ${REF} \
        --readFilesIn ${INPUT}/${NAME}/${NAME}_1.clean.fq.gz ${INPUT}/${NAME}/${NAME}_2.clean.fq.gz \
        --readFilesCommand zcat \
        --clip3pNbases 0 20 \
        --outSJfilterOverhangMin 30 16 16 16 \
        --outSJfilterCountUniqueMin 4 2 2 2 \
        --alignSJoverhangMin 6 \
        --outFilterType BySJout \
        --outSAMstrandField intronMotif \
        --outFilterIntronMotifs RemoveNoncanonical \
        --alignIntronMax 500000 \
        --alignMatesGapMax 500000 \
        --outFilterMismatchNoverReadLmax 0.07 \
        --outFileNamePrefix ${OUTPUT}/${NAME} \
        --outStd SAM --outSAMmode Full | $samtools view -bS - > ${OUTPUT}/${NAME}.bam

####for trimmed fastq, don't use "--clip3pNbases 0 20" parameter again

echo "job finished at:"
date 

##--outFilterMismatchNoverReadLmax 0.07 allows 10 mismatches in a 150bp read


