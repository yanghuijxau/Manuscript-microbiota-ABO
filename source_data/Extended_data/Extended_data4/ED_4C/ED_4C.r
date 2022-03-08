rm(list=ls());options(stringsAsFactors=FALSE)
library(ggsignif)
library(ggplot2)
library(plyr) 
library(ggpubr)

df = read.table(file = "ED_4C_data.txt",header = T, sep = "\t")

pdf("peaks_h2.pdf")
ggplot(df, aes(x = F6F7_qtl, y = F6F7_h2))+geom_point(alpha = .3,size=2)+geom_smooth(method=lm,color="lightblue")+xlab("Average(F6-F7)nr of mQTL (<5e-8)")+ylab("Average(F6-F7) heritability")+theme_bw()+theme(axis.text = element_text(size=20),axis.title = element_text(size=20),axis.line = element_line(color="black"),panel.grid.major =element_blank(),panel.grid.minor = element_blank(),panel.grid = element_blank())+theme(plot.margin = unit(c(1,1,1,1),"cm")) 

dev.off()


