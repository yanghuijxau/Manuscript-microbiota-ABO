setwd('/Users/tongxinkai/000.ÆäËü/×ÀÃæ/ABO/Fig.S6.1B')
rm(list=ls());options(stringsAsFactors = F)
library(tidyverse)
library(dendextend)
dat=read.table('ABO_TPM_abundance.txt',header=T)

dat1=dat[,-1]
rownames(dat1)=dat$Tissue
rownames(dat1)[13]="spinal cord"
d=dist(dat1)
hcl=hclust(d)
dend=as.dendrogram(hcl)
lab_or=labels(dend)

rgb_f=function(x,y,z){return(rgb(x/255,y/255,z/255))}
my_colors=colorRampPalette(col=c(rgb_f(255, 255, 217),rgb_f(8, 29, 87)))(500)

adult=as.numeric(as.character(dat1$Adult))
embryo=as.numeric(as.character(dat1$Embryo))
adult_col=my_colors[round(adult/diff(range(c(adult,embryo)))*499+1,0)]
embryo_col=my_colors[round(embryo/diff(range(c(adult,embryo)))*499+1,0)]

png('ABO_TPM_cluster.png',height = 2000,width=2000,res=300)
par(mar=c(13,4,1,1))
a=numeric(15)
digest=grep('cecum|stomach|duodenum|kidney',lab_or)
nodigest=grep('cecum|stomach|duodenum|kidney',lab_or,invert=T)
a[digest]=rgb_f(1, 100, 255);a[nodigest]=rgb_f(255, 1, 187)
dend %>%
  set("labels_col", a) %>%
  set("labels_cex", 1.2) %>%
  set("branches_col", "black") %>%
  set("branches_lwd",1) %>%
  set("leaves_pch", 19)  %>% 
  set("leaves_col", "black")  %>%
  set("nodes_cex", 0.5) %>% 
  plot(axes=FALSE)
colored_bars(colors = adult_col, dend = dend, rowLabels = "Adult",
             cex.rowLabels = 1.2,y_shift = -43)
colored_bars(colors = embryo_col, dend = dend, rowLabels = "Embryo",
             cex.rowLabels = 1.2,y_shift = -50)
dev.off()


