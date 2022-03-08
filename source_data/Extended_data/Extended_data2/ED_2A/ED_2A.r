
data <- read.csv("core_OTUs_annotation_result.txt", header=T, sep="")

library(ggplot2)

data$level <- factor(data$level,levels = c("order","family","genus"))

data$taxa <- factor(data$taxa,levels = c("Bacteroidales","Clostridiales","Ruminococcaceae","Lachnospiraceae","RF16","Clostridiaceae","Mogibacteriaceae","S24-7","Parabacteroides","Oscillospira","Prevotella","Sphaerochaeta","Bacteroides","CF231","p-75-a5","Phascolarctobacterium","Roseburia","SMB53","Treponema","Turicibacter","YRC22"))

ggplot(data,aes(x=taxa,y=number,fill=level))+geom_bar(stat="identity",width = 0.6)+geom_text(aes(label=number),hjust=-0.2,size=4)+coord_flip()+theme_bw()+theme(axis.title = element_text(size=12),panel.grid = element_blank(),legend.position = c(1,1),legend.justification = c(1,1),legend.background = element_blank())+ylab("Number of share core otu")+xlab("Annotation of otu")+guides(fill=guide_legend(reverse = T))+scale_fill_manual(values = c("#F7931E","#0170BB","#019244"))
