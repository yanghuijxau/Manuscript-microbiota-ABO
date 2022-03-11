##plot PCoA
data <- read.csv("F6_F7_PCoA_result.txt", header=T, sep="")
library(ggplot2)

##plot I
ggplot(data,aes(x=PCOA1,y=PCOA2,color=group1,shape=group2))+geom_point(size=2)+theme_bw()+theme(panel.grid = element_blank())+xlab("PCoA1 24.9%")+ylab("PCoA2 7.4%")+scale_color_manual(values = c("#3B4992","#EE0000","#008B45","#631879","#0099B4",NA,NA,NA,NA,NA,NA,NA))

##plot II
ggplot(data,aes(x=PCOA1,y=PCOA2,color=group1,shape=group2))+geom_point()+theme_bw()+theme(panel.grid = element_blank())+xlab("PCoA1 21.0%")+ylab("PCoA2 8.8%")+scale_color_manual(values = c(NA,NA,NA,NA,NA,"#3B4992",NA,"#EE0000","#008B45","#631879","#0099B4",NA))

##plot III
ggplot(data,aes(x=PCOA1,y=PCOA2,color=group1,shape=group2))+geom_point()+theme_bw()+theme(panel.grid = element_blank())+xlab("PCoA1 32.4%")+ylab("PCoA2 7.1%")+scale_color_manual(values = c(NA,NA,NA,NA,NA,"#3B4992","#BE703B",NA,NA,NA,"#0099B4","#F200B6"))