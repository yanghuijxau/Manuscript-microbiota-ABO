library(ggplot2)
library(dplyr)
library(forcats)
library(ggpubr)
library(ggridges)

# FIGURE 2C
###########

AGHER <- read.csv("across_gen_h2_prep.txt", header=T, sep="")
str(AGHER)
AGHER$LEVEL <- ordered(AGHER$LEVEL, levels=c("Phylum","Class","Order","Family","Genus","Species","OTUs"))
AGHER$DS <- ordered(AGHER$DS, levels=c("D25","D120","D240","CC","IC"))

ggplot(data=AGHER,aes(x=HER2,y=DS,fill=DS,color=DS)) + geom_density_ridges(alpha=0.5,size=0.5) +
  xlab("Heritability") +
  ylab("Density") +
  scale_fill_manual(values=c("#333399","#0099cc","#009933","#ff3300","#660066")) +
  scale_color_manual(values=c("#333399","#0099cc","#009933","#ff3300","#660066")) +
  xlim(0,0.4) +
  theme(axis.title=element_text(size=24)) +
  theme(axis.text=element_text(size=20)) +
  theme(legend.text=element_text(size=20)) +
  theme(legend.title=element_blank()) +
  theme(legend.position=c(.6,0.9))
   

ggplot(data=AGHER,aes(x=HER2,y=LEVEL,fill=LEVEL,color=LEVEL)) + geom_density_ridges(alpha=0.5,size=0.25) +
  xlab("Heritability") +
  ylab("Density") +
  scale_fill_manual(values=c("#08519c","#3182bd","#6baed6","#9ecae1","#c6dbef","#eff3ff","#de2d26")) +
  scale_color_manual(values=c("#08519c","#3182bd","#6baed6","#9ecae1","#c6dbef","#eff3ff","#de2d26")) +
  xlim(0,0.4) +
  theme(axis.title=element_text(size=24)) +
  theme(axis.text=element_text(size=20)) +
  theme(legend.text=element_text(size=20)) +
  theme(legend.title=element_blank()) +
  theme(legend.position=c(.6,0.9))
