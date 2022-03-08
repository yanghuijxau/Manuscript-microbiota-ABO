rm(list=ls());options(stringsAsFactors=FALSE)
setwd("C:/Users/Bill/Desktop/")
dat=read.table(file="ABO_topSNPExp_new.txt",head=T)

dat=na.omit(dat)

L1<-length(which((dat[,1]=="OO")))
L2<-length(which((dat[,1]=="AO")))
L3<-length(which((dat[,1]=="AA")))

library(ggplot2)

dat$Genotype=factor(dat$Genotype,level=c("OO","AO","AA"))
png(paste("TopSNPs_ABODel8_genes_Uncorrelated_New",".png",sep=""),height=1400,width=1800,res=500)
p=ggplot(dat,aes(x=Genotype,y=GeneExp_UNC,fill=Genotype))+  #facet_grid(.~Genetype)+ geom_abline(intercept =0,slope = 1)
 #  scale_shape_manual(values=c(18,11))+
 stat_boxplot(geom = "errorbar",position = position_dodge(0.9),width=0.3)+
 geom_boxplot(position = position_dodge(0.9),outlier.colour="black", outlier.shape=1)+
   scale_fill_manual(values=c("#9ECAE1","#4292C6","#08519C"))+   #  #4292C6
   geom_text(x = 1,y=max(dat[,2])*1.08,label =paste("n= ",L1,sep="") ,colour="black")+
  geom_text(x = 2,y=max(dat[,2])*1.08,label =paste("n= ",L2,sep=""),colour="black")+
  geom_text(x = 3,y=max(dat[,2])*1.08,label =paste("n= ",L3,sep=""),colour="black")+ 
 # geom_dotplot(binaxis="y",stackdir="center",fill=NA)+
 # geom_boxplot(position = position_dodge(0.8)) + 
  theme_bw()+
 # geom_hline(aes(yintercept=0), colour="#990000", linetype="dashed")+
  theme(panel.border = element_blank())+
  theme(axis.line=element_line(colour="black"))+
  theme(axis.text.x= element_text(size=10, family="myFont", color="black", face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.text.y= element_text(size=10, family="myFont", color="black",face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.title.x = element_text(size=10, family="myFont", color="black",face= "bold", vjust=0.5, hjust=0.5))+
  theme(axis.title.y = element_text(size=10, family="myFont", color="black",face= "bold", vjust=0.5, hjust=0.5))+
  xlab("Genotype")+
  ylab("The expression of ABO gene (FPKM)")+
  ylim(0,28)+
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