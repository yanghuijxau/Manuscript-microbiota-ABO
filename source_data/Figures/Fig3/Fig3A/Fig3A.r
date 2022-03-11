# This script perform Meta analysis     rm(list=ls());options(stringsAsFactors=FALSE)
    source("plotGWAS.r")
  
    data = read.table(file="F6-metal.txt",header=T)
    Chr = as.numeric(as.character(data$Otu.chr))
    keepIdx = Chr %in% c(1:18,19)
    dat = subset(data,keepIdx)
    plotdat =data.frame(SNP=dat$Otu.MarkerName,chr=dat$Otu.chr,pos=dat$Otu.pos,P1df=dat$Otu.logp)
    plotGWAS(chrs=c(1:19), traitIdx=1,alldat=plotdat,main=filenames[i])
    abline(h=thrsuggest,lty=2)
    