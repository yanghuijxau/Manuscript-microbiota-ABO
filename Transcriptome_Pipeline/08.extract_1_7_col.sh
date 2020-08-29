cd ./Transcriptome/07.featureCounts
OUTDIR=./Transcriptome/08.extract_1_7_col

fcounts=`ls *.featureCounts | awk '{split($0,arra,".featureCounts"); print arra[1]}'`
for i in ${fcounts}
do
	less ${i}.featureCounts | awk '{print $1,$7}' > ${OUTDIR}/${i}_counts.txt
done
