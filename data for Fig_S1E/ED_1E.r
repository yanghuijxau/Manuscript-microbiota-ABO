

F6_Nr <- read.csv("F6_Number_ADDMAF_5Mb.txt", sep="")


str(F6_Nr)
nrow(F6_Nr)
mean(F6_Nr$numberRes)
median(F6_Nr$numberRes)
min(F6_Nr$numberRes)
max(F6_Nr$numberRes)
ggplot(F6_Nr,aes(x=F6_Nr$numberRes)) + 
  geom_line(stat="density", size = 2) + 
  xlim(0,250) +
  labs(x  = "Number of var with r^2 >= 0.9", y = "Density") +
  theme(axis.title = element_text(size = 28, face = "bold"),axis.text.x = element_text(size = 24, face = "bold"),axis.text.y = element_text(size = 24, face = "bold")) +
  geom_vline(xintercept = median(F6_Nr$numberRes), color = "red") +
  geom_vline(xintercept = 42, color = "green") 



 
