library(dplyr)
library("ggpubr")
library(ggplot2)
library("pryr")
library(scales)

MF <- read.delim("MF_2.txt")
str(MF)
ggplot(MF,aes(x=X.axis,y=Fraction,fill=GalNAC)) +
  #geom_boxplot() + stat_summary(fun.y="mean") +
  geom_dotplot(binaxis="y",stackdir="center",alpha=0.7) +
  scale_fill_manual(values=c("light green", "red")) +
  theme(axis.title.y = element_text(size=30)) +
  theme(axis.title.x = element_text(size=30)) +
  theme(axis.text.y = element_text(size=26)) +
  theme(axis.text.x = element_text(size=26,hjust=-0.1)) +
  scale_x_discrete(labels=c("GAP","","DHAP","","3PG","","LACT","")) +
  theme(legend.position="top") +
  theme(legend.title=element_blank()) +
  theme(legend.text=element_text(size=26)) +
  ylab("13-C labelled proportion") +
  xlab("Metabolite") 
  
