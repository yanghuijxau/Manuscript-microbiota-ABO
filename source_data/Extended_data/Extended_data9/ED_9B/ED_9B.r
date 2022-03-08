library(ggplot2)

GalNAc_conc <- read.delim("GalNAc_conc.txt")
str (GalNAc_conc)
ggplot(GalNAc_conc,aes(x=X.axis,y=GalNAC..umol.g.)) + geom_boxplot() +
  ylab("GalNAc conc. (micromol/g)") +
  xlab("Animal group") +
  scale_x_discrete(labels=c("OO pigs","AO pigs","AA pigs", "GalNAc+ mice")) +
  theme(axis.title = element_text(size=30)) +
  theme(axis.text = element_text(size=26))
  