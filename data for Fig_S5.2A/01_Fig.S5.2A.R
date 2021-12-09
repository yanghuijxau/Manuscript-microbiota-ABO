###ABO Gene
rm(list=ls());options(stringsAsFactors=FALSE)
setwd("/Users/billzhang/Desktop/")
dat=read.table(file="ABO_chr1.assoc.txt",head=T)
Orderdat=dat[order(dat[,11]),]
#Plotdat=subset(dat,dat[,3]>=272646133 & dat[,3]<=273046133)
Plotdat=subset(dat,dat[,3]>=272800000 & dat[,3]<=273000000)
Plotdat[,3]=Plotdat[,3]/1e6
Plotdat[,11]=-log10(Plotdat[,11])
Plotdat[,12]="gray"
Plotdat[which(Plotdat[,2]=="1_272907960"),12]="red"
Plotdat[which(Plotdat[,2]=="1_272907239"),12]="green"
tmp1=subset(Plotdat,Plotdat[,12]=="red")
tmp2=subset(Plotdat,Plotdat[,12]=="green")

#Plotdat=subset(Plotdat,Plotdat[,11]>1.3)
color=Plotdat[,12]
png(paste("ABO_Plot.png",sep=""),width=2600,height=2600,res=500)
plot(Plotdat[,3],Plotdat[,11],xlab="Chr1 (Mb)",ylab="-log10(pvalue)",col=color,pch=20,cex=1.2,font=1.2)
points(tmp2[,3],tmp2[,11],col="blue",pch=17)
points(tmp1[,3],tmp1[,11],col="red",pch=17)
dev.off()

###GBGT1
rm(list=ls());options(stringsAsFactors=FALSE)
setwd("/Users/billzhang/Desktop/")
dat=read.table(file="GBGT1_chr1.assoc.txt",head=T)
Orderdat=dat[order(dat[,11]),]
#Plotdat=subset(dat,dat[,3]>=272646133 & dat[,3]<=273046133)
Plotdat=subset(dat,dat[,3]>=272800000 & dat[,3]<=273000000)
Plotdat[,3]=Plotdat[,3]/1e6
Plotdat[,11]=-log10(Plotdat[,11])
Plotdat[,12]="gray"
Plotdat[which(Plotdat[,2]=="1_272846133"),12]="red"
Plotdat[which(Plotdat[,2]=="1_272907239"),12]="green"
tmp1=subset(Plotdat,Plotdat[,12]=="red")
tmp2=subset(Plotdat,Plotdat[,12]=="green")

#Plotdat=subset(Plotdat,Plotdat[,11]>1.3)
color=Plotdat[,12]
png(paste("GBGT1_Plot.png",sep=""),width=2600,height=2600,res=500)
plot(Plotdat[,3],Plotdat[,11],xlab="Chr1 (Mb)",ylab="-log10(pvalue)",col=color,pch=20,cex=1.2,font=1.2)
points(tmp2[,3],tmp2[,11],col="blue",pch=17)
points(tmp1[,3],tmp1[,11],col="red",pch=17)
dev.off()


###LCN1
rm(list=ls());options(stringsAsFactors=FALSE)
setwd("/Users/billzhang/Desktop/")
dat=read.table(file="LCN1_chr1.assoc.txt",head=T)
Orderdat=dat[order(dat[,11]),]
#Plotdat=subset(dat,dat[,3]>=272646133 & dat[,3]<=273046133)
Plotdat=subset(dat,dat[,3]>=272800000 & dat[,3]<=273000000)
Plotdat[,3]=Plotdat[,3]/1e6
Plotdat[,11]=-log10(Plotdat[,11])
Plotdat[,12]="gray"
Plotdat[which(Plotdat[,2]=="1_272885302"),12]="red"
Plotdat[which(Plotdat[,2]=="1_272907239"),12]="green"
tmp1=subset(Plotdat,Plotdat[,12]=="red")
tmp2=subset(Plotdat,Plotdat[,12]=="green")

#Plotdat=subset(Plotdat,Plotdat[,11]>1.3)
color=Plotdat[,12]
png(paste("LCN1_Plot.png",sep=""),width=2600,height=2600,res=500)
plot(Plotdat[,3],Plotdat[,11],xlab="Chr1 (Mb)",ylab="-log10(pvalue)",col=color,pch=20,cex=1.2,font=1.2)
points(tmp2[,3],tmp2[,11],col="blue",pch=17)
points(tmp1[,3],tmp1[,11],col="red",pch=17)
dev.off()

###MED22
rm(list=ls());options(stringsAsFactors=FALSE)
setwd("/Users/billzhang/Desktop/")
dat=read.table(file="MED22_chr1.assoc.txt",head=T)
Orderdat=dat[order(dat[,11]),]
#Plotdat=subset(dat,dat[,3]>=272646133 & dat[,3]<=273046133)
Plotdat=subset(dat,dat[,3]>=272800000 & dat[,3]<=273000000)
Plotdat[,3]=Plotdat[,3]/1e6
Plotdat[,11]=-log10(Plotdat[,11])
Plotdat[,12]="gray"
Plotdat[which(Plotdat[,2]=="1_272961064"),12]="red"
Plotdat[which(Plotdat[,2]=="1_272907239"),12]="green"
tmp1=subset(Plotdat,Plotdat[,12]=="red")
tmp2=subset(Plotdat,Plotdat[,12]=="green")

#Plotdat=subset(Plotdat,Plotdat[,11]>1.3)
color=Plotdat[,12]
png(paste("MED22_Plot.png",sep=""),width=2600,height=2600,res=500)
plot(Plotdat[,3],Plotdat[,11],xlab="Chr1 (Mb)",ylab="-log10(pvalue)",col=color,pch=20,cex=1.2,font=1.2)
points(tmp2[,3],tmp2[,11],col="blue",pch=17)
points(tmp1[,3],tmp1[,11],col="red",pch=17)
dev.off()

###SURF6
rm(list=ls());options(stringsAsFactors=FALSE)
setwd("/Users/billzhang/Desktop/")
dat=read.table(file="SURF6_chr1.assoc.txt",head=T)
Orderdat=dat[order(dat[,11]),]
#Plotdat=subset(dat,dat[,3]>=272646133 & dat[,3]<=273046133)
Plotdat=subset(dat,dat[,3]>=272800000 & dat[,3]<=273043015)
Plotdat[,3]=Plotdat[,3]/1e6
Plotdat[,11]=-log10(Plotdat[,11])
Plotdat[,12]="gray"
Plotdat[which(Plotdat[,2]=="1_273043015"),12]="red"
Plotdat[which(Plotdat[,2]=="1_272907239"),12]="green"
tmp1=subset(Plotdat,Plotdat[,12]=="red")
tmp2=subset(Plotdat,Plotdat[,12]=="green")

#Plotdat=subset(Plotdat,Plotdat[,11]>1.3)
color=Plotdat[,12]
png(paste("SURF6_Plot.png",sep=""),width=2600,height=2600,res=500)
plot(Plotdat[,3],Plotdat[,11],xlab="Chr1 (Mb)",ylab="-log10(pvalue)",col=color,pch=20,cex=1.2,font=1.2)
points(tmp2[,3],tmp2[,11],col="blue",pch=17)
points(tmp1[,3],tmp1[,11],col="red",pch=17)
dev.off()







