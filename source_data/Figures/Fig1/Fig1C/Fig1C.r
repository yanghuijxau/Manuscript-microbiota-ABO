
data <- read.csv("pig_human_mouse_microbiome_result.txt", header=T, sep="")
library(ggplot2)

data$class2 <- factor(data$class2,levels = c("F6_D25","F6_D120","F6_D240","F7_D25","F7_D120","F7_D240","F6_IC","F7_IC","F7_IM","F6_CC","F7_CC","F7_CM"))

ggplot(data ,aes(x=class2,y=shannon,fill=group))+geom_boxplot(width=.5)+theme_bw()+ylab("shannon_index")+theme(axis.title.x = element_blank(),axis.text.x = element_text(size=11,angle = 30,hjust = 1),axis.text.y = element_text(size=12),axis.title.y = element_text(size = 14),panel.grid = element_blank())+scale_fill_manual(values = c("#3B4992","#EE0000","#008B45","#631879","#BE703B","#FF00C4","#0099B4"))+guides(fill=F)

