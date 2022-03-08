#
rm(list=ls());options(stringsAsFactors=FALSE)
wd="/safedisk2/ZYFLAB/01_Micro_2020_3_27/MicroGWAS/Otu476/06_EQTL/Genes/GWAS_2020_5_19_FPKM"
setwd(wd)
system("cd //safedisk2/ZYFLAB/01_Micro_2020_3_27/MicroGWAS/Otu476/06_EQTL/Genes/GWAS_2020_5_19_FPKM")

traits = read.table(file="GenesNames",header=F)
traits=traits[,1]


dir.create("allGWASresults")
dir.create("manhattanplot")


plotGWAS = function(x){
    source("/safedisk2/ZYFLAB/cp_ZYFLAB_2021_3_9/scripts/03_manhattanPlot.r")
    dat = read.table(file=paste("./allGWASresults/",x,".sorted.assoc.txt",sep=""),header=FALSE)
    chr=dat[,1];pos=dat[,2];logp=-log10(dat[,8])
    plotdat = data.frame(chr,pos,logp)
    png(paste("./manhattanplot/",x,".png",sep=""),height=1800,width=6400,res=300)
    par(mai=c(1,1.2,0.5,0.5))
    manhattanPlot(dat=plotdat,trait="logp")
    dev.off()
}

library(snow)
cl=makeCluster(10)
parSapply(cl,traits,plotGWAS)
stopCluster(cl)
