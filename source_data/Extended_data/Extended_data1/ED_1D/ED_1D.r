
data <- read.csv("genomic contributions_result.txt", header=T, sep="")

library(ggplot2)

data$chr <- factor(data$chr,levels = c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"))

data$group1 <- factor(data$group1,levels = c("WD","PT","LD","LW","TB","LA","EH","BX"))

ggplot(data,aes(x=chr,y=ratio,fill=group1))+geom_bar(stat = "identity",width = 0.5)+theme_bw()+theme(axis.title = element_text(size = 24),axis.text = element_text(size = 18),panel.grid = element_blank())+xlab("Chromosome number")+ylab("Proportion")+scale_fill_manual(values = c("#000000","#00B050","#7F3504","#7030A0","#FFC000","#0070C0","#9D8623","#FF0000"))+facet_grid(.~group2)+theme(strip.text = element_text(size = rel(2.5)))
