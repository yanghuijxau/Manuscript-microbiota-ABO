
library(ggplot2)
library(dplyr)
library(forcats)

nd <- read.csv("results.txt", sep="")

nd$P1<-substring(as.character(nd[,3]),1,1)
nd$P2<-substring(as.character(nd[,3]),3,3)


ft<-data.frame(P1=1:64,P2=0,cr=0,pie=0,dist=0,col1=0,col2=0)
ft
for (i in 1:8){
  for (j in 1:8){
    ft[(i-1)*8+j,1] = i
    ft[(i-1)*8+j,2] = j
    if (i <= j){ft[(i-1)*8+j,3] = paste(i,j,sep = "X")}
    else {ft[(i-1)*8+j,3] = paste(j,i,sep = "X")}
    ft[(i-1)*8+j,4] = mean(nd$Pie[nd$X == ft[(i-1)*8+j,3]])
    ft[(i-1)*8+j,5] = 1 - ft[(i-1)*8+j,4]
  }
}
ft
min(ft$dist)
max(ft$dist)
ft$col1 = as.character(as.hexmode(round(16+239*((ft$dist-min(ft$dist))/(max(ft$dist)-min(ft$dist))),digits=0)))
ft$col2 = as.character(paste0("#",ft$col1,"0000"))

ggplot(data = ft) + geom_tile(mapping = aes(x = as.character(ft$P1), y = as.character(ft$P2)),fill=ft$col2) +       
theme(axis.title = element_blank(), axis.ticks = element_blank(), axis.text.x = element_text(angle=0,hjust=0.5,vjust=0.5,size=28,face ="bold"), axis.text.y = element_text(hjust=0.5,vjust=0.5,size=28,face ="bold", color = "Black")) +
  scale_x_discrete(labels = c("BX","EH","LA","TB","LW","LR","PT","WD")) + scale_y_discrete(labels = c("BX","EH","LA","TB","LW","LR","PT","WD")) 


