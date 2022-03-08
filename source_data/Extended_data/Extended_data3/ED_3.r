library(MASS)
library(quantmod)
library(dplyr)
library("ggpubr")
library("corpcor")
library("lme4qtl")
library(ggplot2)
library("pryr")
library(scales)


# Load result.txt
her_out <- read.delim("result.txt")
str(her_out)
her_out$Sample_type <- factor(her_out$Sample_type,levels=c("D25","D120","D240","CC","IC"))
her_out$Level <- factor(her_out$Level,levels=c("Phylum","Class","Order","Family","Genus","Species","OTUs"))
her_out$mean_abund <- (her_out$F6_abund+her_out$F7_abund)/2
her_out$mean_her <- (her_out$F6_her+her_out$F7_her)/2
  
# OVERVIEW OF CORRE LATION BETWEEN F6 AND F7 HER ESTIMATES BY ST ONLY
summ <- data.frame(Nr=1:5,Lev="ALL",ST="B",r=0,p=0,r_x=0.27,r_y=0.45,p_x=0.27,p_y=0.4,MH=0,mh_x=0.25,mh_y=7)
summ
summ$Lev <- as.character(summ$Lev)
summ$ST <- as.character(summ$ST)
lev <- levels(her_out$Level)
st <- levels(her_out$Sample_type)
st
counter = 0
#for (i in lev){
  for (j in st){
    counter = counter + 1
    sel <- her_out[her_out$Sample_type == j,]
    cor <- cor.test(sel$F6_her,sel$F7_her,method="spearman")
    summ[counter,2] <- "ALL"
    summ[counter,3] <- j
    summ[counter,4] = round(cor$estimate,2)
    summ[counter,5] = scientific(cor$p.value,digit=2)
    summ[counter,10] = round(mean(sel$mean_her,na.rm=TRUE),3)
  }
#}
summ[1,4] = "r = 0.03"
summ[2,4] = "r = 0.08"
summ[3,4] = "r = 0.28"
summ[4,4] = "r = 0.07"
summ[5,4] = "r = 0.01"
summ[1,5] = "p = 0.32"
summ[2,5] = "p = 4.2e-05"
summ[3,5] = "p = 2.2e-16"
summ[4,5] = "p = 2.3e-03"
summ[5,5] = "p = 0.75"

sel <- her_out[her_out$Sample_type == "D240",]
str(sel)
cor <- cor.test(sel$F6_her,sel$F7_her,method="spearman")
cor
str(cor)
cor$p.value
cor$estimate

dat_txt1 <- data.frame(
  label = c(summ$r,summ$p),
  Sample_type = c(summ$ST,summ$ST),
  Level = c(summ$Lev,summ$Lev),
  x = c(summ$r_x,summ$p_x),
  y = c(summ$r_y,summ$p_y)
)

CairoPDF("FigS3-1.pdf",width = 10,height = 3)

ggplot(her_out,aes(x=F6_her,y=F7_her)) + geom_point(alpha = 0.3) +
  stat_smooth(method=lm) +
  facet_grid(. ~ Sample_type) +
  ylab("Heritability in F7 generation") +
  xlab("Heritability in F6 generation") +
  ylim(0,0.5) +
  xlim(0,0.5) +
  theme(axis.title=element_text(size=12)) +
  theme(axis.text.y=element_text(size=10)) +
  theme(axis.text.x=element_text(size=10,angle=90,vjust = 0.5)) +
  theme(
    panel.background = element_rect(fill = "#f0f0f0"),
    panel.grid.major = element_line(color="white",linetype="dotted",size=1)
  ) +
  geom_text(data = dat_txt1, mapping = aes(x=x,y=y,label=label,hjust=0))


  


