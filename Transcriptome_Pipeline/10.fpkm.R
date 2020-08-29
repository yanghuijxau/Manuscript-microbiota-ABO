rm(list = ls());options(stringsAsFactors=FALSE)
setwd("09.mergeCount")

library(DESeq2)
count_table <- read.table("RNA-seq.gene.table.txt",header = T,row.names=1, check.names = F)
dim(count_table)
head(count_table)[1:10]
countData <- as.matrix(count_table[,-1])

info_table <- read.table("condition.txt",header = T,row.names=1, check.names = F)
dim(info_table)
info_table <- info_table[colnames(countData),]
head(info_table)
condition <- factor(info_table$SampleID)
dds <- DESeqDataSetFromMatrix(countData, DataFrame(condition), ~ condition)
mcols(dds)$basepairs <- count_table$length
dim(dds)
dds <- DESeq(dds)
dds

#extract fpkm value
rpkm_table_normalized<- fpkm(dds, robust = TRUE)  #robust = TRUE: recommend(sizeFactors normalization)

#transform to dataframe
rpkm_table_normalized <- data.frame(rpkm_table_normalized)
head(rpkm_table_normalized)
write.table(rpkm_table_normalized,"rpkm.txt",quote=F,row.name=T,col.name=T,sep="\t")

#the frequency distribution of genes with fpkm expressionlarge than 0.01 in all samples
rowSums <- rowSums(rpkm_table_normalized >=0.1)
head(rowSums)
write.table(rowSums,"rpkm_rowSums.txt",quote=F,row.name=T,col.name=T,sep="\t")


F7_Cecum_rpkm_per20_0.1 <- rpkm_table_normalized[which(rowSums >=60),]
write.table(F7_Cecum_rpkm_per20_0.1,"rpkm_per20_0.1.txt",quote=F,row.name=T,col.name=T,sep="\t")

#result summary
res = results(dds, contrast=c("condition", "F", "M"))
res = res[order(res$pvalue),]
head(res)
summary(res)
write.csv(res,file="All_results.csv")
