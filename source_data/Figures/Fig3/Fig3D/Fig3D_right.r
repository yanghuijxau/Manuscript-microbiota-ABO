# This script perform Meta analysis rm(list=ls());options(stringsAsFactors=FALSE)library(ggsignif)
library(ggplot2)
library(plyr) 
df = read.table(file="Fig3D_right_data.txt",header=T)

compared_list <- list(c("Erysipelotrichaceae_F6", "Other-bacteria_F6"),c("p-75-a5_F6","Other-bacteria_F6"),c("Erysipelotrichaceae_F7", "Other-bacteria_F7"),c("p-75-a5_F7","Other-bacteria_F7"))
neworder <- c("p-75-a5_F6","Erysipelotrichaceae_F6","Other-bacteria_F6","p-75-a5_F7","Erysipelotrichaceae_F7","Other-bacteria_F7")

df2 <- arrange(transform(df,group=factor(group,levels=neworder)),group)


pdf("1.pdf")
ggplot(df2, aes(x = group, y = logp))+geom_boxplot(notch=T,outlier.alpha = 0.2,aes(colour=group,fill=group))+ylab("log10(1/p)")+theme_bw()+theme(axis.text = element_text(size=20,family="Times",colour="black"),axis.title = element_text(size=22,family="Times"),axis.line = element_line(color="black"),panel.grid.major =element_blank(),panel.grid.minor = element_blank(),panel.grid = element_blank(),axis.text.x = element_text(angle = 45,hjust=1,size=20,family="Times",colour="black"),plot.margin = unit(c(1,1,1.5,1.2),"cm"))+scale_fill_manual(values=c("#ff6666","orange","#0073C2FF","#ff6666","orange","#0073C2FF"))+scale_colour_manual(values=c("#ff6666","orange","#0073C2FF","#ff6666","orange","#0073C2FF"))+geom_signif(comparisons = compared_list, test = wilcox.test, step_increase = 0.13,size=0.5,textsize=4.5,fontface = "plain",family="Times",tip_length=0.005,vjust=0.1)

 dev.off()


