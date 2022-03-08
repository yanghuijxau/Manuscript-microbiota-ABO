library(dplyr)
library(plyr)

for_dist <- as.matrix(dist <- read.csv("dist.txt", header = TRUE, sep=";"))
str(for_dist)
dist_m<-as.dist(for_dist)
dist_m
phyl_o<-hclust(dist_m, method="average")
plot(phyl_o,main="",ylab = "Nucleotide diversity",xlab="")

