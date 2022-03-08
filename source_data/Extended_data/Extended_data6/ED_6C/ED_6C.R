####ABO
rm(list=ls());options(stringsAsFactors=FALSE)
setwd("/Users/billzhang/Desktop/")

dat=read.table(file="OTU476_TopSNPs.txt",head=T)
dat=subset(dat,dat[,4]=="F7_CC")

#dat=read.table(file="ABO_topSNPExp_new.txt",head=T)
dat=na.omit(dat)


L1<-length(which((dat[,7]=="OO")))
L2<-length(which((dat[,7]=="AO")))
L3<-length(which((dat[,7]=="AA")))

library(ggplot2)

dat$deletion=factor(dat$deletion,level=c("OO","AO","AA"))
png(paste("ABO_OTU476_genes",".png",sep=""),height=1400,width=1800,res=500)
p=ggplot(dat,aes(x=deletion,y=Otu476,fill=deletion))+  #facet_grid(.~Genetype)+ geom_abline(intercept =0,slope = 1)
 #  scale_shape_manual(values=c(18,11))+
 stat_boxplot(geom = "errorbar",position = position_dodge(0.9),width=0.3)+
 geom_boxplot(position = position_dodge(0.9),outlier.colour="black", outlier.shape=1)+
   scale_fill_manual(values=c("#9ECAE1","#4292C6","#08519C"))+   #  #4292C6
   geom_text(x = 1,y=max(dat[,2])*1.09,label =paste("n= ",L1,sep="") ,colour="black")+
  geom_text(x = 2,y=max(dat[,2])*1.09,label =paste("n= ",L2,sep=""),colour="black")+
  geom_text(x = 3,y=max(dat[,2])*1.09,label =paste("n= ",L3,sep=""),colour="black")+ 
 # geom_dotplot(binaxis="y",stackdir="center",fill=NA)+
 # geom_boxplot(position = position_dodge(0.8)) + 
  theme_bw()+
  geom_hline(aes(yintercept=0), colour="#990000", linetype="dashed")+
  theme(panel.border = element_blank())+
  theme(axis.line=element_line(colour="black"))+
  theme(axis.text.x= element_text(size=10, color="black", face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.text.y= element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.title.x = element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.title.y = element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  xlab("Genotype")+
  ylab("Otu476 (abundance)")+
 # ylim(-12,20)+
 # theme(axis.ticks.x = element_blank())+
 # theme(axis.line.x = element_blank())+
 # theme(axis.text.x = element_blank())+
 # theme(axis.title.x = element_blank())+
  theme(panel.grid =element_blank())+
  guides(fill=FALSE)+
  guides(shape=FALSE)
 # theme(legend.position=c(0.05,0.9))+
 # theme(panel.border = element_blank())+
 # ylim(-10,10)
 # theme(axis.line.y= element_line(size=10, family="myFont", color="black", face= "bold", vjust=0.5, hjust=0.5))
p
dev.off()



####GBGT1
rm(list=ls());options(stringsAsFactors=FALSE)
setwd("/Users/billzhang/Desktop/")

dat=read.table(file="OTU476_TopSNPs.txt",head=T)
dat=subset(dat,dat[,4]=="F7_CC")

#dat=read.table(file="ABO_topSNPExp_new.txt",head=T)
dat=na.omit(dat)


L1<-length(which((dat[,7]=="CC")))
L2<-length(which((dat[,7]=="CT")))
L3<-length(which((dat[,7]=="TT")))

library(ggplot2)

dat$G_1_272846133=factor(dat$G_1_272846133,level=c("CC","CT","TT"))
png(paste("GBGT1_OTU476_genes",".png",sep=""),height=1400,width=1800,res=500)
p=ggplot(dat,aes(x=G_1_272846133,y=Otu476,fill=G_1_272846133))+  #facet_grid(.~Genetype)+ geom_abline(intercept =0,slope = 1)
 #  scale_shape_manual(values=c(18,11))+
 stat_boxplot(geom = "errorbar",position = position_dodge(0.9),width=0.3)+
 geom_boxplot(position = position_dodge(0.9),outlier.colour="black", outlier.shape=1)+
   scale_fill_manual(values=c("#9ECAE1","#4292C6","#08519C"))+   #  #4292C6
   geom_text(x = 1,y=max(dat[,2])*1.09,label =paste("n= ",L1,sep="") ,colour="black")+
  geom_text(x = 2,y=max(dat[,2])*1.09,label =paste("n= ",L2,sep=""),colour="black")+
  geom_text(x = 3,y=max(dat[,2])*1.09,label =paste("n= ",L3,sep=""),colour="black")+ 
 # geom_dotplot(binaxis="y",stackdir="center",fill=NA)+
 # geom_boxplot(position = position_dodge(0.8)) + 
  theme_bw()+
  geom_hline(aes(yintercept=0), colour="#990000", linetype="dashed")+
  theme(panel.border = element_blank())+
  theme(axis.line=element_line(colour="black"))+
  theme(axis.text.x= element_text(size=10, color="black", face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.text.y= element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.title.x = element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.title.y = element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  xlab("Genotype")+
  ylab("Otu476 (abundance)")+
 # ylim(-12,20)+
 # theme(axis.ticks.x = element_blank())+
 # theme(axis.line.x = element_blank())+
 # theme(axis.text.x = element_blank())+
 # theme(axis.title.x = element_blank())+
  theme(panel.grid =element_blank())+
  guides(fill=FALSE)+
  guides(shape=FALSE)
 # theme(legend.position=c(0.05,0.9))+
 # theme(panel.border = element_blank())+
 # ylim(-10,10)
 # theme(axis.line.y= element_line(size=10, family="myFont", color="black", face= "bold", vjust=0.5, hjust=0.5))
p
dev.off()


###LCN1
rm(list=ls());options(stringsAsFactors=FALSE)
setwd("/Users/billzhang/Desktop/")

dat=read.table(file="OTU476_TopSNPs.txt",head=T)
dat=subset(dat,dat[,4]=="F7_CC")

#dat=read.table(file="ABO_topSNPExp_new.txt",head=T)
dat=na.omit(dat)


L1<-length(which((dat[,7]=="TT")))
L2<-length(which((dat[,7]=="GT")))
L3<-length(which((dat[,7]=="GG")))

library(ggplot2)

dat$G_1_272885302=factor(dat$G_1_272885302,level=c("TT","GT","GG"))
png(paste("LCN1_OTU476_genes",".png",sep=""),height=1400,width=1800,res=500)
p=ggplot(dat,aes(x=G_1_272885302,y=Otu476,fill=G_1_272885302))+  #facet_grid(.~Genetype)+ geom_abline(intercept =0,slope = 1)
 #  scale_shape_manual(values=c(18,11))+
 stat_boxplot(geom = "errorbar",position = position_dodge(0.9),width=0.3)+
 geom_boxplot(position = position_dodge(0.9),outlier.colour="black", outlier.shape=1)+
   scale_fill_manual(values=c("#9ECAE1","#4292C6","#08519C"))+   #  #4292C6
   geom_text(x = 1,y=max(dat[,2])*1.09,label =paste("n= ",L1,sep="") ,colour="black")+
  geom_text(x = 2,y=max(dat[,2])*1.09,label =paste("n= ",L2,sep=""),colour="black")+
  geom_text(x = 3,y=max(dat[,2])*1.09,label =paste("n= ",L3,sep=""),colour="black")+ 
 # geom_dotplot(binaxis="y",stackdir="center",fill=NA)+
 # geom_boxplot(position = position_dodge(0.8)) + 
  theme_bw()+
  geom_hline(aes(yintercept=0), colour="#990000", linetype="dashed")+
  theme(panel.border = element_blank())+
  theme(axis.line=element_line(colour="black"))+
  theme(axis.text.x= element_text(size=10, color="black", face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.text.y= element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.title.x = element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.title.y = element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  xlab("Genotype")+
  ylab("Otu476 (abundance)")+
 # ylim(-12,20)+
 # theme(axis.ticks.x = element_blank())+
 # theme(axis.line.x = element_blank())+
 # theme(axis.text.x = element_blank())+
 # theme(axis.title.x = element_blank())+
  theme(panel.grid =element_blank())+
  guides(fill=FALSE)+
  guides(shape=FALSE)
 # theme(legend.position=c(0.05,0.9))+
 # theme(panel.border = element_blank())+
 # ylim(-10,10)
 # theme(axis.line.y= element_line(size=10, family="myFont", color="black", face= "bold", vjust=0.5, hjust=0.5))
p
dev.off()


###MED22
rm(list=ls());options(stringsAsFactors=FALSE)
setwd("/Users/billzhang/Desktop/")

dat=read.table(file="OTU476_TopSNPs.txt",head=T)
dat=subset(dat,dat[,4]=="F7_CC")

#dat=read.table(file="ABO_topSNPExp_new.txt",head=T)
dat=na.omit(dat)


L1<-length(which((dat[,7]=="CCCT/CCCT")))
L2<-length(which((dat[,7]=="C/CCCT")))
L3<-length(which((dat[,7]=="C/C")))

library(ggplot2)

dat$G_1_272961064=factor(dat$G_1_272961064,level=c("CCCT/CCCT","C/CCCT","C/C"))
png(paste("MED22_OTU476_genes",".png",sep=""),height=1400,width=1800,res=500)
p=ggplot(dat,aes(x=G_1_272961064,y=Otu476,fill=G_1_272961064))+  #facet_grid(.~Genetype)+ geom_abline(intercept =0,slope = 1)
 #  scale_shape_manual(values=c(18,11))+
 stat_boxplot(geom = "errorbar",position = position_dodge(0.9),width=0.3)+
 geom_boxplot(position = position_dodge(0.9),outlier.colour="black", outlier.shape=1)+
   scale_fill_manual(values=c("#9ECAE1","#4292C6","#08519C"))+   #  #4292C6
   geom_text(x = 1,y=max(dat[,2])*1.09,label =paste("n= ",L1,sep="") ,colour="black")+
  geom_text(x = 2,y=max(dat[,2])*1.09,label =paste("n= ",L2,sep=""),colour="black")+
  geom_text(x = 3,y=max(dat[,2])*1.09,label =paste("n= ",L3,sep=""),colour="black")+ 
 # geom_dotplot(binaxis="y",stackdir="center",fill=NA)+
 # geom_boxplot(position = position_dodge(0.8)) + 
  theme_bw()+
  geom_hline(aes(yintercept=0), colour="#990000", linetype="dashed")+
  theme(panel.border = element_blank())+
  theme(axis.line=element_line(colour="black"))+
  theme(axis.text.x= element_text(size=10, color="black", face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.text.y= element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.title.x = element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.title.y = element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  xlab("Genotype")+
  ylab("Otu476 (abundance)")+
 # ylim(-12,20)+
 # theme(axis.ticks.x = element_blank())+
 # theme(axis.line.x = element_blank())+
 # theme(axis.text.x = element_blank())+
 # theme(axis.title.x = element_blank())+
  theme(panel.grid =element_blank())+
  guides(fill=FALSE)+
  guides(shape=FALSE)
 # theme(legend.position=c(0.05,0.9))+
 # theme(panel.border = element_blank())+
 # ylim(-10,10)
 # theme(axis.line.y= element_line(size=10, family="myFont", color="black", face= "bold", vjust=0.5, hjust=0.5))
p
dev.off()


###SURF6
rm(list=ls());options(stringsAsFactors=FALSE)
setwd("/Users/billzhang/Desktop/")

dat=read.table(file="OTU476_TopSNPs.txt",head=T)
dat=subset(dat,dat[,4]=="F7_CC")
dat=na.omit(dat)
rownames(dat)=paste("s",dat[,1],sep="")
SURF6_Top=read.table(file="SURF6_TOP.txt",head=F)
rownames(SURF6_Top)=SURF6_Top[,1]
CommonID=intersect(rownames(SURF6_Top),rownames(dat))

#dat=read.table(file="ABO_topSNPExp_new.txt",head=T)
dat=dat[CommonID,]
SURF6_Top=SURF6_Top[CommonID,]
FinalDat=data.frame(dat[,2],SURF6_Top[,2])
colnames(FinalDat)=c("Otu476","Genotype")
dat=FinalDat

L1<-length(which((dat[,2]=="TC/TC")))
L2<-length(which((dat[,2]=="T/TC")))
L3<-length(which((dat[,2]=="T/T")))

library(ggplot2)

dat$Genotype=factor(dat$Genotype,level=c("TC/TC","T/TC","T/T"))
png(paste("SURF6_OTU476_genes",".png",sep=""),height=1400,width=1800,res=500)
p=ggplot(dat,aes(x=Genotype,y=Otu476,fill=Genotype))+  #facet_grid(.~Genetype)+ geom_abline(intercept =0,slope = 1)
 #  scale_shape_manual(values=c(18,11))+
 stat_boxplot(geom = "errorbar",position = position_dodge(0.9),width=0.3)+
 geom_boxplot(position = position_dodge(0.9),outlier.colour="black", outlier.shape=1)+
   scale_fill_manual(values=c("#9ECAE1","#4292C6","#08519C"))+   #  #4292C6
   geom_text(x = 1,y=max(dat[,1])*1.09,label =paste("n= ",L1,sep="") ,colour="black")+
  geom_text(x = 2,y=max(dat[,1])*1.09,label =paste("n= ",L2,sep=""),colour="black")+
  geom_text(x = 3,y=max(dat[,1])*1.09,label =paste("n= ",L3,sep=""),colour="black")+ 
 # geom_dotplot(binaxis="y",stackdir="center",fill=NA)+
 # geom_boxplot(position = position_dodge(0.8)) + 
  theme_bw()+
  geom_hline(aes(yintercept=0), colour="#990000", linetype="dashed")+
  theme(panel.border = element_blank())+
  theme(axis.line=element_line(colour="black"))+
  theme(axis.text.x= element_text(size=10, color="black", face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.text.y= element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.title.x = element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.title.y = element_text(size=10, color="black",face= "bold", vjust=0.5, hjust=0.5))+
  xlab("Genotype")+
  ylab("Otu476 (abundance)")+
 # ylim(-12,20)+
 # theme(axis.ticks.x = element_blank())+
 # theme(axis.line.x = element_blank())+
 # theme(axis.text.x = element_blank())+
 # theme(axis.title.x = element_blank())+
  theme(panel.grid =element_blank())+
  guides(fill=FALSE)+
  guides(shape=FALSE)
 # theme(legend.position=c(0.05,0.9))+
 # theme(panel.border = element_blank())+
 # ylim(-10,10)
 # theme(axis.line.y= element_line(size=10, family="myFont", color="black", face= "bold", vjust=0.5, hjust=0.5))
p
dev.off()





