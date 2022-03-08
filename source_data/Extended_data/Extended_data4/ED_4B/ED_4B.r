####画qqplot图
dat<-read.table("permutation_data.txt",header=F,sep="\t")
expP = sort(-log10((1:nrow(dat))/nrow(dat))) 
obsP= sort(-log10(dat$pvalue))
lmLine <- lm(obsP~expP)
lamb <- as.numeric(coefficients(lmLine)[2])

#tiff(file="q_maf10-20_permu_1.tiff",width=1100,height=1100,res=300)
pdf("permutation.pdf",)
par(mai=c(1.5,1.5,1.5,1.5))
plot(expP,obsP,cex=2.5,cex.axis=4.5,family="Times",xlab="",ylab="",mgp=c(1,2.5,0),
lines(expP,expP,type="l",col="red"))
dev.off()  




