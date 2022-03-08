
phe<-read.table("F6_data.txt",header=T,sep="\t")
library(ggplot2)

pdf("F6.pdf")
ggplot(phe, aes(x = zscore, y = logp,color=color))+ geom_point(size = 4, alpha = 0.7)+ylab("log10(1/p)")+xlab("Meta Z score(F6)")+theme_bw()+theme(axis.text = element_text(size=18),axis.title.x = element_text(size =18),axis.title.y = element_text(size =18),axis.line = element_line(color="black"),panel.grid.major =element_blank(),panel.grid.minor = element_blank(),panel.grid = element_blank())+scale_x_continuous(limits = c(-10,10))+scale_colour_manual(values=c("orange","#ff6666"))+annotate(geom="text",x=-5.6,y=20,label="Otu476",cex=5)+annotate(geom="text",x=-4.5,y=16,label="Otu476",cex=5)+annotate(geom="text",x=-2,y=7.5,label="Otu327",cex=5)+theme(plot.margin = unit(c(4,3.5,3.5,3.5),"cm")) 


dev.off()

    



