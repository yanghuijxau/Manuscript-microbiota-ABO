
data <- read.csv("kinship_dissimilarity_across generations.txt", header=T, sep="")


library(ggplot2)

data$group <- factor(data$group,levels = c("F6F7_D25","F6F7_D120","F6F7_D240","F6F7_IC","F6F7_CC"))


ggplot(data,aes(x=kinship,y=microbiome,color=group2))+geom_point(shape=1,fill=NA,size=1.2)+stat_smooth(method = lm,se=F,color="#696969",size=0.5)+theme_bw()+xlab("Genetic kinship")+ylab("Microbiome dissimilarity")+theme(axis.text = element_text(size=9),axis.title = element_text(size=12),axis.line = element_line(color="black"),panel.grid = element_blank())+scale_color_manual(values = c("#3B4992","#EE0000","#008B45","#631879","#0099B4"))+facet_wrap(~group,nrow = 1)

