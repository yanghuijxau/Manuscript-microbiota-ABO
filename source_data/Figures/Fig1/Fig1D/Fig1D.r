
data1 <- read.csv("beta_result1.txt", header=T, sep="")
data2 <- read.csv("beta_result2.txt", header=T, sep="")

library(ggplot2)

data <- rbind(data1,data2)

data$group2 <- factor(data$group2,levels = c("Intra-F6-D25","Intra-F6-D120","Intra-F6-D240","Intra-F7-D25","Intra-F7-D120","Intra-F7-D240","Intra-F6-IC","Intra-F7-IC","Intra-F7-IM","Intra-F6-CC","Intra-F7-CC","Intra-F7-CM"))

ggplot(data ,aes(x=group2,y=dis,fill=group3))+geom_boxplot(width=.5)+theme_bw()+ylab("Beta diversity")+theme(axis.title.x = element_blank(),axis.text.x = element_text(size=11,angle = 30,hjust = 1),axis.text.y = element_text(size=12),axis.title.y = element_text(size = 14))+scale_fill_manual(values = c("#3B4992","#EE0000","#008B45","#631879","#BE703B","#FF00C4","#0099B4"))+guides(fill=F)


