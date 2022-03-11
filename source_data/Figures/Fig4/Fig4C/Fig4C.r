library(dplyr)
library(plyr)

dist <- read.csv("kinship_dissimilarity_within_litter.txt", header=T, sep=";")

for_dist <- as.matrix(dist)
str(for_dist)
dist_m<-as.dist(for_dist)
dist_m
phyl_o<-hclust(dist_m, method="average")
plot(phyl_o,main="",ylab = "Nucleotide diversity",xlab="")

