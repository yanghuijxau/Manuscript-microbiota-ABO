#PBS -l nodes=1:ppn=2,mem=6gb 
#PBS -e ./Transcriptome/jobs_out
#PBS -o ./Transcriptome/jobs_out 
#PBS -q fat
#PBS -t 0-299

#nprocs=`wc -l < $PBS_NODEFILE`

featureCounts=~/bin/featureCounts
sortedBAM=./Transcriptome/03.sortedbam
OUTPUT=./Transcriptome/07.featureCounts
gtf=./Transcriptome/06.modify_mergedGTF/Reformed_merged.gtf

cd $sortedBAM 
bam=(`ls *.sorted.bam`)

echo "ARRAY JOB: ${bam[$PBS_ARRAYID]}"
NAME=`echo ${bam[$PBS_ARRAYID]} | awk '{split($0,arra,".sorted.bam"); print arra[1]}'
`

$featureCounts -T 8 -F GTF -t exon -g gene_id -s 2 -Q 20 -C -p -D 1000 -a ${gtf} -o ${OUTPUT}/${NAME}.featureCounts ${sortedBAM}/${NAME}.sorted.bam
