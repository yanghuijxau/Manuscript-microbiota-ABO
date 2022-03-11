
library(ggplot2)

MF_test_2000 <- read.csv("MF_test_2000.txt", sep="")
str(MF_test_2000)
 
ggplot(MF_test_2000, aes(x = MF_test_2000$ID, y = MF_test_2000$X1.MFbreed)) + geom_point(size = 0.5) + 
  labs(x  = "Chr 1 position", y = "1 / Fstat") +
  theme(axis.title = element_text(size = 28, face = "bold"),axis.text.x = element_text(size = 22),axis.text.y = element_text(size = 22)) +
  annotate("rect", xmin=272908137, xmax=272935316,ymin=0,ymax=0.15,alpha=0.25,fill="blue") +
  annotate("rect", xmin=272907137, xmax=272909487,ymin=0,ymax=0.15,alpha=0.5,fill="red")

