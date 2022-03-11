data = read.table("F6-chr1.txt",header=T)
pos1<- (data[,3])/1e6
dat<-subset(data,pos1<=273 &pos1>=272.8)

peakSNP = dat[which.max(dat$logp),]

trait="logp";d=10;main="";from=NULL;to=NULL
SNP = dat[,"SNP"]
    POS = as.numeric(dat[,"pos"])
    if(max(POS) > 1000) POS = POS/1e6 # change the bp to Mb
    topPos = POS[which.max(dat$logp)[1]]   
    chr = unique(as.character(dat$chr))
    if(!is.null(from)){
       idx = which(SNP == from):which(SNP == to)
    } else {
       from = SNP[which.min(abs(topPos-d-POS))]
       to   = SNP[which.min(abs(topPos+d-POS))]
       idx = which(SNP == from):which(SNP == to)
    }
   
    positions = POS[idx]
    pvals = dat[idx,trait]
    SNP2plot = SNP[idx]
    r2=dat[,"R2"]
    color = character(length(SNP2plot))
    peakIdx = which(positions==topPos)

        
    color[r2 >= 0.8] = "orange"
        color[peakIdx] = "red"
    color[r2 < 0.8 & r2 >= 0.5] = "yellow"
    color[r2 < 0.5 & r2 >= 0.2] = "green"
    color[r2 < 0.2] = "#0073C2FF"


pdf("F6-otu476.pdf")
#tiff("F6-metal-chr1-region.tiff",width=1600,height=1200,res=300)
par(mai=c(1.2,1.5,1.5,1.5))
cex = numeric(length(SNP2plot))
    cex = rep(1,length(cex))
              

plot(positions,pvals,col=color,pch=19,cex = cex,ylab = expression(-log[10](italic(P)~value)),xlab = paste(paste("Chromosome",chr,sep = ""), "(Mb)",sep = " "),main = main, ylim = range(2,1.1*max(pvals,na.rm=TRUE)),cex.lab=2.5,cex.axis=2.2,family="Times")

dev.off()





