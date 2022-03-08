rm(list=ls());options(stringsAsFactors=FALSE)library(ggsignif)
library(ggplot2)
library(plyr) 

df = read.table(file="ED_5D_ecoli.txt",header=T)

compared_list <- list(c("AA", "AO"),c("AA","OO"),c("AO","OO"))
neworder <- c("F6_D25","F7_D25","F6_D120","F7_D120","F6_D240","F7_D240","F6_IC","F7_IC","F6_CC","F7_CC","F7_IM","F7_CM")

df2 <- arrange(transform(df,group=factor(group,levels=neworder)),group)

pdf("Ecoli_deletion.pdf")
ggplot(df2, aes(x = genotyping, y = Ecoli))+geom_boxplot(notch=T,outlier.alpha = 0.2,aes(colour=group,fill=group),alpha=0.6)+xlab("Deletion genotyping")+ylab("E.coli relative abundance (%)")+theme_bw()+geom_signif(comparisons = compared_list, test = wilcox.test, step_increase = 0.3,size=0.2,textsize=4.5,fontface = "plain",family="Times",tip_length=0.01,margin_top=0.3,vjust=1.2)+theme(axis.text.y = element_text(size=14),axis.text.x = element_text(size=12),axis.title = element_text(size=16),axis.line = element_line(color="black"),panel.grid.major =element_blank(),panel.grid.minor = element_blank(),panel.grid = element_blank())+facet_wrap(~group,nrow = 3,as.table=TRUE,scales="free")+scale_fill_manual(values=c("#660066","#660066","#ff3300","#ff3300","#009933","#009933","#0099cc","#0099cc","#333399","#333399","#ff33cc","#cc6633"))+scale_colour_manual(values=c("#660066","#660066","#ff3300","#ff3300","#009933","#009933","#0099cc","#0099cc","#333399","#333399","#ff33cc","#cc6633"))+theme(plot.margin = unit(c(3,0.3,1.5,0.3),"cm"),strip.text = element_text(size = 12)) 
dev.off()
    
