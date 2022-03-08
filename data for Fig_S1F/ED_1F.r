
library(ggplot2)

F6_Dist <- read.csv("F6_Distance_ADDMAF_5Mb.txt", sep="")

F6_Dist$Dist_Kb<-F6_Dist$distRes/1000
str(F6_Dist)
median(F6_Dist$Dist_Kb)
ggplot(F6_Dist,aes(x=F6_Dist$Dist_Kb)) + 
  geom_line(stat="density", size = 2) +
  xlim(0,100) +
  labs(x  = "Max dist (Kb) from var with r^2 >= 0.9", y = "Density") +
  theme(axis.title = element_text(size = 22, face = "bold"),axis.text.x = element_text(size = 24, face = "bold"),axis.text.y = element_text(size = 24, face = "bold")) +
  geom_vline(xintercept = median(F6_Dist$Dist_Kb), color = "red") +
  geom_vline(xintercept = 2.285, color = "green")


 
