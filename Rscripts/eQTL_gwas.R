rm(list=ls());options(stringsAsFactors=FALSE)

pheno<-read.table("phe.txt",header=T,sep="\t",row.names=1)
fam<-read.table("clean.fam",header=F,sep="")
names<-colnames(pheno)
sex <- as.factor(pheno$sex)
batch<-pheno$batch
for(i in 4:ncol(pheno)){
	fit<- lm(pheno[,i]~sex+batch,na.action=na.exclude)
    fam[,6]<- residuals(fit)

    write.table(fam,"clean.fam",quote = F,col.names = F,row.names = F)
 
    system(paste("gemma -bfile clean -k kinship.txt -lmm 1 -n 1"," -o ",names[i],sep=""))
}
