rm(list=ls());options(stringsAsFactors=FALSE)

library(psych)

dat <- read.table(file = "table.txt",header = T, sep = "\t")

phe1 <- dat[,3]
dat1 <- dat[,5]
data <- corr.test(dat1,phe1,method="spearman")
R <- data$r
P <- data$p
R2 <- cbind(expand.grid(rownames(R), colnames(R)),as.vector(R))
Pvalue <- cbind(expand.grid(rownames(P), colnames(P)),as.vector(P))
result <- cbind(R2,Pvalue)
write.csv(result,file = "result.csv")








