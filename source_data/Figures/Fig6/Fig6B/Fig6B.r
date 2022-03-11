
library(ggplot2)
library(dplyr)
library(forcats)

# 1. Whole genome expression analysis

# 1.A. E. Coli
Gen <- read.csv("Ecoli_Gam_genome_with_position.txt")
str(Gen)
ggplot(Gen,aes(x=Start,y=Log2fold,size=log2(M_minus),color=GalNAc_gene,shape=YmN,fill=GalNAc_gene)) +
  geom_point(alpha=0.5) +
  scale_color_manual(values=c("#3182bd","#de2d26")) +
  scale_shape_manual(values=c(25,24)) +
  scale_fill_manual(values=c("#3182bd","#de2d26")) + 
  ylim(-5,10) +
  xlim(0,5000000) +
  theme(legend.position="non") +
  theme(axis.text = element_text(size=rel(1.5))) +
  theme(axis.title = element_text(size=24)) +
  xlab("Map position") +
  ylab("Log2-fold expression change")
  
  
# 1.B. a4-15-1
Gen <- read.csv("a4_15_1_Gam_genome_with_position.txt")
str(Gen)
ggplot(Gen,aes(x=Start,y=Log2fold,size=log2(M_minus),color=GalNAc_gene,shape=YmN,fill=GalNAc_gene)) +
  geom_point(alpha=0.5) +
  scale_color_manual(values=c("#3182bd","#de2d26")) +
  scale_shape_manual(values=c(25,24)) +
  scale_fill_manual(values=c("#3182bd","#de2d26")) + 
  ylim(-5,10) +
  xlim(0,5000000) +
  theme(legend.position="non") +
  theme(axis.text = element_text(size=rel(1.5))) +
  theme(axis.title = element_text(size=24)) +
  xlab("Gene position") +
  ylab("Log2-fold expression change")
  
# 1.C. a4-8-110
Gen <- read.csv("a4_8_110_Gam_genome_with_position.txt")
str(Gen)
ggplot(Gen,aes(x=Start,y=Log2fold,size=log2(M_minus),color=GalNAc_gene,shape=YmN,fill=GalNAc_gene)) +
  geom_point(alpha=0.5) +
  scale_color_manual(values=c("#3182bd","#de2d26")) +
  scale_shape_manual(values=c(25,24)) +
  scale_fill_manual(values=c("#3182bd","#de2d26")) + 
  ylim(-5,10) +
  xlim(0,5000000) +
  theme(legend.position="non") +
  theme(axis.text = element_text(size=rel(1.5))) +
  theme(axis.title = element_text(size=24)) +
  xlab("Gene position") +
  ylab("Log2-fold expression change")
  
  
# 2. QQ plots
# 2.A. Ecoli
Ecoli <- read.csv("Ecoli_QQ_with_position.txt")
str(Ecoli)
ggplot(Ecoli, aes(x = Exp_log.1.p., y = Obs_log.1.p., shape = YmN, color = GalNAc_gene, fill= GalNAc_gene, size = abs(Log2fold))) + 
  geom_abline(intercept = 0,slope = 1,color="grey") +
  geom_point(alpha=0.75) +
  scale_color_manual(values=c("#3182bd","#de2d26")) +
  scale_shape_manual(values=c(25,24)) +
  scale_fill_manual(values=c("#3182bd","#de2d26")) +
  ylim(0,5) +
  xlim(0,4) +
  theme(legend.position="non") +
  theme(axis.text = element_text(size=rel(2))) +
  theme(axis.title = element_text(size=36)) +
  xlab("Expected -log(p)") +
  ylab("Observed -log(p)")

# 2.B. a4_8_110
a4_8 <- read.csv("a4_8_110_QQ_with_pos.txt")
str(a4_8)
ggplot(a4_8, aes(x = Exp_log.1.p., y = Obs_log.1.p., shape = YmN, color = GalNAc_gene, fill= GalNAc_gene, size = abs(Log2fold))) + 
  geom_point(alpha=0.75) +
  geom_abline(intercept = 0,slope = 1) +
  scale_color_manual(values=c("#3182bd","#de2d26")) +
  scale_shape_manual(values=c(25,24)) +
  scale_fill_manual(values=c("#3182bd","#de2d26")) +
  ylim(0,5) +
  xlim(0,4) +
  theme(legend.position="non") +
  theme(axis.text = element_text(size=rel(2))) +
  theme(axis.title = element_text(size=36)) +
  xlab("Expected -log(p)") +
  ylab("Observed -log(p)")

# 2.C. a4__15_1
a4_15 <- read.delim("a4_15_1_QQ_with_pos.txt")
str(a4_15)
ggplot(a4_15, aes(x = Exp_log.1.p., y = Obs_log.1.p., shape = YmN, color = GalNAc_gene, fill= GalNAc_gene, size = abs(Log2fold))) + 
  geom_point(alpha=0.75) +
  geom_abline(intercept = 0,slope = 1) +
  scale_color_manual(values=c("#3182bd","#de2d26")) +
  scale_shape_manual(values=c(25,24)) +
  scale_fill_manual(values=c("#3182bd","#de2d26")) +
  ylim(0,5) +
  xlim(0,4) +
  theme(legend.position="non") +
  theme(axis.text = element_text(size=rel(2))) +
  theme(axis.title = element_text(size=36)) +
  xlab("Expected -log(p)") +
  ylab("Observed -log(p)")


  
  
  
  
  
  
  
  
  
  
  
  