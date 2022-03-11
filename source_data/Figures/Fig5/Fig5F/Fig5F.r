
library(ggplot2)

GF16S <- read.csv("GF_16S.txt", header=T)
str(GF16S)
a4_8 <- GF16S[GF16S$STRAIN == "4-8-110",]

dat_txt2 <- data.frame(
  label = c("p = 0.0079","p = 0.0097"),
  SAMPLE = c("CAECUM","FECES"),
  TREATMENT = c("GalNAc","PBS"),
  x = c(6,6),
  y = c(0.017,0.017)
)


ggplot(a4_8,aes(x=ID.MOUSE,y=RATIO,fill=TREATMENT)) + geom_bar(stat="identity") +
 facet_grid(. ~ SAMPLE) +
  xlab("MOUSE ID") +
  ylab("Ab_4-8-110/(Ab_4-8-110 + Ab_Ecoli)") +
  theme(axis.title=element_text(size=24)) +
  theme(axis.text.y=element_text(size=18)) +
  theme(axis.text.x=element_text(size=18,angle=90)) +
  theme(legend.text=element_text(size=18)) +
  theme(legend.title=element_text(size=18)) +
  theme(strip.text = element_text(size = 24)) +
  theme(
    panel.background = element_rect(fill = "#f0f0f0"),
    panel.grid.major = element_line(color="white",linetype="dotted",size=1)
  ) +
geom_text(data = dat_txt2, mapping = aes(x=x,y=y,label=label,hjust=0),size = 8)
