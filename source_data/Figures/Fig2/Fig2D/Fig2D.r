##家系间差异
rm(list=ls())
library(pheatmap)
 taxa<-read.table("data.txt",sep="\t",header=T,row.names=1)

pheatmap(taxa,scale="none",cluster_rows=F,cluster_cols=F,clustering_method="average")