
library(ggplot2)
library(dplyr)
library(forcats)
library(ggpubr)

table <- read.delim("Genotype_GalNAC_OTU476_table.txt")

# Convert to scaled (0 to 1) ranks within badge
table$GalNac_rank_in_batch[table$batch == "DLY_batch1"]<-(0+rank(table$GalNAC_raw[table$batch == "DLY_batch1"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "DLY_batch1")-1)
mean(table$GalNac_rank_in_batch[table$batch == "DLY_batch1"])
var(table$GalNac_rank_in_batch[table$batch == "DLY_batch1"])
table$GalNac_rank_in_batch[table$batch == "DLY_batch3"]<-(0+rank(table$GalNAC_raw[table$batch == "DLY_batch3"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "DLY_batch3")-1)
mean(table$GalNac_rank_in_batch[table$batch == "DLY_batch3"])
var(table$GalNac_rank_in_batch[table$batch == "DLY_batch3"])
table$GalNac_rank_in_batch[table$batch == "DLY_batch4"]<-(0+rank(table$GalNAC_raw[table$batch == "DLY_batch4"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "DLY_batch4")-1)
mean(table$GalNac_rank_in_batch[table$batch == "DLY_batch4"])
var(table$GalNac_rank_in_batch[table$batch == "DLY_batch4"])
table$GalNac_rank_in_batch[table$batch == "F7_batch2"]<-(0+rank(table$GalNAC_raw[table$batch == "F7_batch2"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "F7_batch2")-1)
mean(table$GalNac_rank_in_batch[table$batch == "F7_batch2"])
var(table$GalNac_rank_in_batch[table$batch == "F7_batch2"])


# FIG 5A
#Check effect of AO genotype on GalNAc concentration across batches
compare_means(GalNac_rank_in_batch~genotyping,table,method="wilcox.test")
my_comparisons<-list(c("AA","AO"),c("AA","OO"),c("AO","OO"))
p<-ggboxplot (table, x="genotyping", y = "GalNac_rank_in_batch") +
  stat_compare_means(comparisons = my_comparisons) +
  #stat_compare_means(label.y=50000) +
  xlab("AO genotype") +
  ylab("Scaled GalNAc concentrations") +
  theme(axis.title=element_text(size=26)) +
  theme(axis.text=element_text(size=22)) +
  theme(
    panel.background = element_rect(fill = "#f8f8f8"),
    panel.grid.major = element_line(color="white",linetype="dotted",size=1.25)
  )
p$layers[[2]]$aes_params$textsize <- 8
p

### Fig5B & Fig5C

# Convert to scaled (0 to 1) ranks within badge
table$Otu476_rank_in_batch[table$batch == "DLY_batch1"]<-(0+rank(table$Otu476_raw[table$batch == "DLY_batch1"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "DLY_batch1")-1)
mean(table$Otu476_rank_in_batch[table$batch == "DLY_batch1"])
table$Otu476_rank_in_batch[table$batch == "DLY_batch3"]<-(0+rank(table$Otu476_raw[table$batch == "DLY_batch3"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "DLY_batch3")-1)
mean(table$Otu476_rank_in_batch[table$batch == "DLY_batch3"])
table$Otu476_rank_in_batch[table$batch == "DLY_batch4"]<-(0+rank(table$Otu476_raw[table$batch == "DLY_batch4"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "DLY_batch4")-1)
mean(table$Otu476_rank_in_batch[table$batch == "DLY_batch4"])
table$Otu476_rank_in_batch[table$batch == "F7_batch2"]<-(0+rank(table$Otu476_raw[table$batch == "F7_batch2"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "F7_batch2")-1)
mean(table$Otu476_rank_in_batch[table$batch == "F7_batch2"])


# USE ties.method="random" if you want to have exactly the same scaled distribution as for OTU467 and p.75.a5
table$Otu327_rank_in_batch[table$batch == "DLY_batch1"]<-(0+rank(table$Otu327_raw[table$batch == "DLY_batch1"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "DLY_batch1")-1)
mean(table$Otu327_rank_in_batch[table$batch == "DLY_batch1"])
table$Otu327_rank_in_batch[table$batch == "DLY_batch3"]<-(0+rank(table$Otu327_raw[table$batch == "DLY_batch3"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "DLY_batch3")-1)
mean(table$Otu327_rank_in_batch[table$batch == "DLY_batch3"])
table$Otu327_rank_in_batch[table$batch == "DLY_batch4"]<-(0+rank(table$Otu327_raw[table$batch == "DLY_batch4"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "DLY_batch4")-1)
mean(table$Otu327_rank_in_batch[table$batch == "DLY_batch4"])
table$Otu327_rank_in_batch[table$batch == "F7_batch2"]<-(0+rank(table$Otu327_raw[table$batch == "F7_batch2"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "F7_batch2")-1)
mean(table$Otu327_rank_in_batch[table$batch == "F7_batch2"])


table$p.75.a5_rank_in_batch[table$batch == "DLY_batch1"]<-(0+rank(table$p.75.a5_raw[table$batch == "DLY_batch1"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "DLY_batch1")-1)
mean(table$p.75.a5_rank_in_batch[table$batch == "DLY_batch1"])
table$p.75.a5_rank_in_batch[table$batch == "DLY_batch3"]<-(0+rank(table$p.75.a5_raw[table$batch == "DLY_batch3"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "DLY_batch3")-1)
mean(table$p.75.a5_rank_in_batch[table$batch == "DLY_batch3"])
table$p.75.a5_rank_in_batch[table$batch == "DLY_batch4"]<-(0+rank(table$p.75.a5_raw[table$batch == "DLY_batch4"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "DLY_batch4")-1)
mean(table$p.75.a5_rank_in_batch[table$batch == "DLY_batch4"])
table$p.75.a5_rank_in_batch[table$batch == "F7_batch2"]<-(0+rank(table$p.75.a5_raw[table$batch == "F7_batch2"],na.last="keep",ties.method="average")-1)/(sum(table$batch == "F7_batch2")-1)
mean(table$p.75.a5_rank_in_batch[table$batch == "F7_batch2"])

# => significant albeit weak correlation (could be due to heterozygotes /dominant for one trait; recessive for the other)

# Correlation between GalNac concentration and OTU476 abundance within AO genotype 
# Rank and scale GalNac concentrations within genotype
table$GalNac_rank_in_genotype[table$genotyping == "AA"]<-(0+rank(table$GalNac_rank_in_batch[table$genotyping == "AA"],na.last="keep",ties.method="average")-1)/(sum(table$genotyping == "AA")-1)
mean(table$GalNac_rank_in_genotype[table$genotyping == "AA"])
table$GalNac_rank_in_genotype[table$genotyping == "AO"]<-(0+rank(table$GalNac_rank_in_batch[table$genotyping == "AO"],na.last="keep",ties.method="average")-1)/(sum(table$genotyping == "AO")-1)
mean(table$GalNac_rank_in_genotype[table$genotyping == "AO"])
table$GalNac_rank_in_genotype[table$genotyping == "OO"]<-(0+rank(table$GalNac_rank_in_batch[table$genotyping == "OO"],na.last="keep",ties.method="average")-1)/(sum(table$genotyping == "OO")-1)
mean(table$GalNac_rank_in_genotype[table$genotyping == "OO"])


# Rank and scale OTU476 abundance within genotype
table$Otu476_rank_in_genotype[table$genotyping == "AA"]<-(0+rank(table$Otu476_rank_in_batch[table$genotyping == "AA"],na.last="keep",ties.method="average")-1)/(sum(table$genotyping == "AA")-1)
mean(table$Otu476_rank_in_genotype[table$genotyping == "AA"])
table$Otu476_rank_in_genotype[table$genotyping == "AO"]<-(0+rank(table$Otu476_rank_in_batch[table$genotyping == "AO"],na.last="keep",ties.method="average")-1)/(sum(table$genotyping == "AO")-1)
mean(table$Otu476_rank_in_genotype[table$genotyping == "AO"])
table$Otu476_rank_in_genotype[table$genotyping == "OO"]<-(0+rank(table$Otu476_rank_in_batch[table$genotyping == "OO"],na.last="keep",ties.method="average")-1)/(sum(table$genotyping == "OO")-1)
mean(table$Otu476_rank_in_genotype[table$genotyping == "OO"])


table$p.75.a5_rank_in_genotype[table$genotyping == "AA"]<-(0+rank(table$p.75.a5_rank_in_batch[table$genotyping == "AA"],na.last="keep",ties.method="average")-1)/(sum(table$genotyping == "AA")-1)
mean(table$p.75.a5_rank_in_genotype[table$genotyping == "AA"])
table$p.75.a5_rank_in_genotype[table$genotyping == "AO"]<-(0+rank(table$p.75.a5_rank_in_batch[table$genotyping == "AO"],na.last="keep",ties.method="average")-1)/(sum(table$genotyping == "AO")-1)
mean(table$p.75.a5_rank_in_genotype[table$genotyping == "AO"])
table$p.75.a5_rank_in_genotype[table$genotyping == "OO"]<-(0+rank(table$p.75.a5_rank_in_batch[table$genotyping == "OO"],na.last="keep",ties.method="average")-1)/(sum(table$genotyping == "OO")-1)
mean(table$p.75.a5_rank_in_genotype[table$genotyping == "OO"])


# As above use "random" if you want to have better scaled distribution
table$Otu327_rank_in_genotype[table$genotyping == "AA"]<-(0+rank(table$Otu327_rank_in_batch[table$genotyping == "AA"],na.last="keep",ties.method="average")-1)/(sum(table$genotyping == "AA")-1)
mean(table$Otu327_rank_in_genotype[table$genotyping == "AA"])
table$Otu327_rank_in_genotype[table$genotyping == "AO"]<-(0+rank(table$Otu327_rank_in_batch[table$genotyping == "AO"],na.last="keep",ties.method="average")-1)/(sum(table$genotyping == "AO")-1)
mean(table$Otu327_rank_in_genotype[table$genotyping == "AO"])
table$Otu327_rank_in_genotype[table$genotyping == "OO"]<-(0+rank(table$Otu327_rank_in_batch[table$genotyping == "OO"],na.last="keep",ties.method="average")-1)/(sum(table$genotyping == "OO")-1)
mean(table$Otu327_rank_in_genotype[table$genotyping == "OO"])


# FIG 5B
CairoPDF("Fig5B-V10.pdf",width = 8,height = 7)
cor.test(table$GalNac_rank_in_genotype,table$Otu476_rank_in_genotype,method="spearman")
ggplot(table,aes(x=GalNac_rank_in_genotype,y=Otu476_rank_in_genotype)) + geom_point(color="blue",size=5,alpha=0.5) +
  stat_smooth(method=lm,se=TRUE) +
  geom_hline(yintercept=0.5,linetype="dashed",size=0.3,alpha=0.3) +
  xlab("Scaled GalNAc concentration") +
  ylab("Scaled Otu476 abundance") +
  annotate("text",x=0.87,y=0.02,label = "p = 0.012",size = 10) +
  theme(axis.title=element_text(size=24)) +
  theme(axis.text=element_text(size=20)) +
  theme(axis.line=element_line(color="black")) +
  theme(
    panel.background = element_rect(fill = "#f8f8f8"),
    panel.grid.major = element_line(color="white",linetype="dotted",size=1.25))

# FIG 5C
CairoPDF("Fig5C-V10.pdf",width = 8,height = 7)
ggplot(table,aes(x=GalNac_rank_in_genotype,y=Otu476_rank_in_genotype,color=genotyping)) + geom_point(size=5,alpha=0.75) +
  stat_smooth(method=lm,se=FALSE) +
  geom_hline(yintercept=0.5,linetype="dashed",size=0.3,alpha=0.3) +
  xlab("Scaled GalNAc concentration") +
  ylab("Scaled Otu476 abundance") +
  #annotate("text",x=0.87,y=0.02,label = "p = 0.012",size = 10) +
  theme(axis.title=element_text(size=24)) +
  theme(axis.text=element_text(size=20)) +
  theme(axis.line=element_line(color="black")) +
  theme(
    panel.background = element_rect(fill = "#f8f8f8"),
    panel.grid.major = element_line(color="white",linetype="dotted",size=1.25)) +
  theme(legend.title = element_blank()) +
  theme(legend.text=element_text(size=20))+scale_color_manual(values = c("#A70501","#6B9CF8","#36BE44"))+guides(color=F)






