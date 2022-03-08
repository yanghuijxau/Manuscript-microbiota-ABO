rm(list=ls());options(stringsAsFactors=FALSE)
library(ggsignif)
library(ggplot2)
library(plyr) 
library(data.table)
setwd("/Users/zhangwanchang/Desktop/")

df = read.table(file="ED_5E_data.txt",header=T)

#Summarize the data
neworder <- c("F6_D25","F7_D25","F6_D120","F7_D120","F6_D240","F7_D240","F6_IC","F7_IC","F6_CC","F7_CC","F7_IM","F7_CM")

df2 <- arrange(transform(df,group=factor(group,levels=neworder)),group)

pdf("Otu476-1.pdf")
ggplot(df2, aes(x = group, y =Otu476,fill=group,colour=group))+geom_violin(scale="width",alpha=0.4)+geom_point(data=df2,aes(x=group,y=Otu476,colour=group),alpha=0.1,size=1) +stat_summary(fun.y=median, geom="point", shape=23, size=2,color="white")+ylab("Otu476 abundance(%)")+theme_bw()+theme(axis.text = element_text(size=18,color="black",family="sans"),axis.title = element_text(size=18,family="sans"),axis.text.x = element_text(angle = 45,hjust=1,size=17,family="sans"),axis.line = element_line(color="black"),panel.grid.major =element_blank(),panel.grid.minor = element_blank(),panel.grid = element_blank())+scale_fill_manual(values=c("#660066","#660066","#ff3300","#ff3300","#009933","#009933","#0099cc","#0099cc","#333399","#333399","#ff33cc","#cc6633"))+scale_colour_manual(values=c("#660066","#660066","#ff3300","#ff3300","#009933","#009933","#0099cc","#0099cc","#333399","#333399","#ff33cc","#cc6633"))+theme(plot.margin = unit(c(3,3,3,1),"cm"))

    dev.off()
 
