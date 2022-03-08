
library(ggplot2)

###galreg_others

MG <- read.csv("galreg_others.txt", sep=";")
str(MG)
77301/27
ggplot(data = MG) +
  geom_tile(mapping = aes(x = reorder(MG$GENE_SC, as.numeric(MG$ORDER)), y = MG$MAG_NR),  fill = as.character(MG$COL)) +
  labs(x  = "GalNAc PTS/CP gene", y = "MAG") +
  theme(axis.title = element_blank(),axis.ticks = element_blank(),axis.text.x = element_text(angle=90,hjust=1,vjust=0.5,size=20, color = "black", face = "bold"),axis.text.y = element_blank())
ggsave("MG_others.png", height = 25, width = 10, dpi=300)
MG_Sc1<-MG[MG$ORDER == "Z",]
MG_Sc2<-MG[MG$ORDER == "ZA",]
mean(MG_Sc1$ST_SC)
sd(MG_Sc1$ST_SC)
max(MG_Sc1$ST_SC)
min(MG_Sc1$ST_SC)
mean(MG_Sc2$ST_SC)
sd(MG_Sc2$ST_SC)
max(MG_Sc2$ST_SC)
min(MG_Sc2$ST_SC)
MG_agaS<-MG[MG$ORDER == "A",]
sum(MG_agaS == 1)
85/2863

###galreg_erysip

MG <- read.csv("galreg_erysip.txt", sep=";")
str(MG)
6696/27
ggplot(data = MG) +
  geom_tile(mapping = aes(x = reorder(MG$GENE_SC, as.numeric(MG$ORDER)), y = MG$MAG_NR), fill = as.character(MG$COL)) +
  labs(x  = "GalNAc PTS/CP gene", y = "MAG") +
  theme(axis.title = element_blank(),axis.ticks = element_blank(),axis.text.x = element_text(angle=90,hjust=1,vjust=0.5,size=20, color = "black", face ="bold"),axis.text.y = element_blank())
ggsave("MG_erysip.png", height = 25, width = 10, dpi=300)
MG_Sc1<-MG[MG$ORDER == "Z",]
MG_Sc2<-MG[MG$ORDER == "ZA",]
mean(MG_Sc1$ST_SC)
sd(MG_Sc1$ST_SC)
max(MG_Sc1$ST_SC)
min(MG_Sc1$ST_SC)
mean(MG_Sc2$ST_SC)
sd(MG_Sc2$ST_SC)
max(MG_Sc2$ST_SC)
min(MG_Sc2$ST_SC)
MG_agaS<-MG[MG$ORDER == "A",]
sum(MG_agaS == 1)
77/248

##galreg_476

MG <- read.csv("galreg_476.txt", sep=";")
str(MG)
ggplot(data = MG) +
  geom_tile(mapping = aes(x = reorder(MG$GENE_SC, as.numeric(MG$ORDER)), y = MG$MAG_NR),  color = "white",fill = as.character(MG$COL)) +
  labs(x  = "GalNAc PTS/CP gene", y = "MAG") +
  theme(axis.title = element_blank(),axis.ticks = element_blank(),axis.text.x = element_text(angle=90,hjust=1,vjust=0.5,size=20, color = "black", face ="bold"),axis.text.y = element_blank())
ggsave("MG_476.png", height = 25, width = 10, dpi=300)
MG_Sc1<-MG[MG$ORDER == "Z",]
MG_Sc2<-MG[MG$ORDER == "ZA",]
mean(MG_Sc1$ST_SC)
sd(MG_Sc1$ST_SC)
max(MG_Sc1$ST_SC)
min(MG_Sc1$ST_SC)
mean(MG_Sc2$ST_SC)
sd(MG_Sc2$ST_SC)
max(MG_Sc2$ST_SC)
min(MG_Sc2$ST_SC)
MG_agaS<-MG[MG$ORDER == "A",]
sum(MG_agaS == 1)