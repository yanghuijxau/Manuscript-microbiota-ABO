
dat = read.table(file="test2.txt",header=T)
w1 = (1/(dat$se1)^2)
w2 = (1/(dat$se2)^2)
z = (dat$Z1*w1+dat$Z2*w2)/(w1+w2)
logp = -log10(2*(1-pnorm(abs(z)))) # double tail test
Colors = c("blue","darkgreen","orange","red","brown","gray")
names(Colors) = c("MeatQuality","Growth","Carcass","Hematology","Health","Others")
legends = c("MeatQuality (N=70)","Growth (N=26)","Carcass (N=23)","Hematology (N=13)","Health (N=4)","Others (N=14)")
metaCol = Colors[dat$class]
dat = data.frame(dat,logp,col=metaCol)
dat = dat[order(dat$logp),]
N = nrow(dat)
expP = seq(0,1,1/N)
expP = expP[2:length(expP)]
expLogP = sort(-log10(expP))
maxV = max(dat$logp)
tiff("qqplot_meta.tif",width=4500,height=4000,res=600,compression="lzw")
par(mai=c(1,1.2,0.2,0.2))
plot(expLogP,dat$logp,bty="l",pch=19,xlab="Expected log10(1/P)",ylab="Observed log10(1/P)",col=dat$col,
     cex.lab=1.5,cex.axis=1.5,cex=1.2,ylim=c(0,maxV),xlim=c(0,max(expLogP)))
lines(expLogP,expLogP,lwd=1,col="black")
legend("topleft",legend=legends,col=Colors,pch=19,bty="n",cex=1.2)
dev.off()