
rm(list=ls()) 

dat = read.table(file="ED_4E_data.txt",header=T)  
dat$group1=as.factor(dat$group1)
h1=dat[which(dat$group=="Binary_random"),]
expP1 = sort(-log10((1:nrow(h1))/nrow(h1))) 
obsP1= sort(-log10(h1$p))

h2=dat[which(dat$group=="Quantitative_random"),]
expP2 = sort(-log10((1:nrow(h2))/nrow(h2))) 
obsP2= sort(-log10(h2$p))

h3=dat[which(dat$group=="Binary_real"),]
expP3 = sort(-log10((1:nrow(h3))/nrow(h3))) 
obsP3= sort(-log10(h3$p))

h4=dat[which(dat$group=="Quantitative_real"),]
expP4 = sort(-log10((1:nrow(h4))/nrow(h4))) 
obsP4= sort(-log10(h4$p))

#tiff(file="qqplot.tiff",width=1500,height=1500,res=300)
pdf("qqplot.pdf",)
par(mai=c(1.7,1.7,1.7,1.7))
plot(expP4,obsP4,cex.lab=1.8,cex.axis=1.8, xlab=expression(Expected~~log[10](1/p)), ylab=expression(Observed~~log[10](1/p)),col="#0073C2FF", pch=16)
#lines(expP4,expP4,type="l",col="#0073C2FF")

points(expP3,obsP3,col="limegreen",pch=16)
#lines(expP3,expP3,type="l",col="limegreen")

points(expP2,obsP2,col="tomato4",pch=16)
#lines(expP2,expP2,type="l",col="tomato4")


points(expP1,obsP1,col="#E7B800",pch=16)
lines(expP1,0.92*expP1,type="l",col="#E7B800")

legend(-0.2,3.9,c("Real_quantitative","Real_binary","Random_quantitative","Random_binary"),col=c("#0073C2FF","limegreen","tomato4","#E7B800"),text.col=c("#0073C2FF","limegreen","tomato4","#E7B800"),pch=16,cex=1.2)

dev.off()  
    



