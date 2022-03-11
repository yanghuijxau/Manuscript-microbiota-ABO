
library(ggplot2)
library(dplyr)
library(forcats)

# 1. Expression levels
# 1.A. E coli
Expr <- read.delim("Ecoli_operon_expr.txt")
str(Expr)
Expr$Pos_1<-as.factor(Expr$Pos_1)
Expr$Pos_2<-as.factor(Expr$Pos_2)
#Expr$Gene<-factor(Expr$Gene,levels=c("agaR","gatZ","agaV","agaW","agaE","agaF","agaA","agaS","gatY","agaB","agaC","agaD","agaI","dist","pfkA"))
str(Expr)
#View(Expr)
ggplot(Expr,aes(x=Pos_2,y=FPKM,fill=Type))+geom_bar(position=position_dodge(),stat="summary")+theme_bw() +
    scale_fill_manual(values=c("#d9d9d9","#fcbba1","#969696","#ef3b2c","#78c679","#238443")) +
    theme(legend.position="non",panel.grid = element_blank()) +
    theme(axis.text.y = element_text(size=rel(2))) +
    theme(axis.text.x = element_blank()) +
    theme(axis.ticks.x = element_blank()) +
    theme(axis.title = element_text(size=24)) +
    xlab("Position") +
    ylab("Expression") +
    annotate("text",x=39,y=700,label="yhaV",size=7, angle=90,vjust=0.6,hjust=0) +
    annotate("text",x=41,y=600,label="agaR",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=43,y=2200,label="gatZ",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=45,y=2150,label="agaV",size=7, angle=90,vjust=0.8,hjust=0) + 
    annotate("text",x=47,y=900,label="agaW",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=49,y=2000,label="agaE",size=7, angle=90,vjust=0.8,hjust=0) + 
    annotate("text",x=51,y=300,label="agaF",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=53,y=300,label="agaA",size=7, angle=90,vjust=0.8,hjust=0) + 
    annotate("text",x=55,y=3700,label="agaS",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=57,y=2650,label="gatY",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=59,y=750,label="agaB",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=61,y=350,label="agaC",size=7, angle=90,vjust=0.8,hjust=0) + 
    annotate("text",x=63,y=300,label="agaD",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=65,y=200,label="agaI",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=87,y=450,label="pfkA",size=7, angle=90,vjust=0.6,hjust=0) +
    ylim(0,7500)+stat_summary(fun.data = 'mean_se', geom = "errorbar", colour = "black",width = 0.2,position = position_dodge(1))+geom_jitter(data = Expr, aes(y = FPKM),size = 2, shape = 21,stroke = 0.01, show.legend = FALSE,position = position_jitterdodge(jitter.height=1,dodge.width = 1))

# 1.B. 4_15_1
Expr <- read.delim("a4_15_1_operon_expr.txt")
str(Expr)
Expr$Pos_1<-as.factor(Expr$Pos_1)
Expr$Pos_2<-as.factor(Expr$Pos_2)
#Expr$Gene<-factor(Expr$Gene,levels=c("agaR","gatZ","agaV","agaW","agaE","agaF","agaA","agaS","gatY","agaB","agaC","agaD","agaI","dist","pfkA"))
str(Expr)
#View(Expr)
ggplot(Expr,aes(x=Pos_2,y=FPKM,fill=Type)) +geom_bar(position=position_dodge(),stat="summary")+scale_fill_manual(values=c("#d9d9d9","#fcbba1","#969696","#ef3b2c")) +theme_bw()+
    theme(legend.position="non",panel.grid = element_blank()) +
    theme(axis.text.y = element_text(size=rel(2))) +
    theme(axis.text.x = element_blank()) +
    theme(axis.ticks.x = element_blank()) +
    theme(axis.title = element_text(size=24)) +
    xlab("Position") +
    ylab("Expression") +
    annotate("text",x=7,y=2750,label="gatZ",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=17,y=1000,label="nirA",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=19,y=250,label="met8",size=7, angle=90,vjust=0.7,hjust=0) + 
    annotate("text",x=21,y=200,label="cobA-hemD",size=7, angle=90,vjust=0.7,hjust=0) +
    annotate("text",x=23,y=150,label="bioY",size=7, angle=90,vjust=0.7,hjust=0) +
    annotate("text",x=27,y=6000,label="nagA",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=39,y=150,label="gltD",size=7, angle=90,vjust=0.5,hjust=0) + 
    annotate("text",x=51,y=6500,label="agaS",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=53,y=12000,label="agaF",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=59,y=5500,label="agaV",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=61,y=6000,label="agaW",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=63,y=5700,label="agaE",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=65,y=2000,label="nagB",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=67,y=1500,label="dnaX",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=69,y=1000,label="recR",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=79,y=1000,label="ppaC",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=91,y=1000,label="fruA",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=93,y=1200,label="fruK",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=95,y=1500,label="fruR",size=7, angle=90,vjust=0.5,hjust=0) +ylim(0,17000)+stat_summary(fun.data = 'mean_se', geom = "errorbar", colour = "black",width = 0.2,position = position_dodge(1))+geom_jitter(data = Expr, aes(y = FPKM),size = 2, shape = 21,stroke = 0.01, show.legend = FALSE,position = position_jitterdodge(jitter.height=1,dodge.width = 1))

# 1.C. 4_8_110  
Expr <- read.delim("a4_8_110_operon_expr.txt")
str(Expr)
Expr$Pos_1<-as.factor(Expr$Pos_1)
Expr$Pos_2<-as.factor(Expr$Pos_2)
#Expr$Gene<-factor(Expr$Gene,levels=c("agaR","gatZ","agaV","agaW","agaE","agaF","agaA","agaS","gatY","agaB","agaC","agaD","agaI","dist","pfkA"))
str(Expr)
#View(Expr)
ggplot(Expr,aes(x=Pos_2,y=FPKM,fill=Type)) +geom_bar(position=position_dodge(),stat="summary")+scale_fill_manual(values=c("#d9d9d9","#fcbba1","#969696","#ef3b2c")) +theme_bw()+
    theme(legend.position="non",panel.grid = element_blank()) +
    theme(axis.text.y = element_text(size=rel(2))) +
    theme(axis.text.x = element_blank()) +
    theme(axis.ticks.x = element_blank()) +
    theme(axis.title = element_text(size=24)) +
    xlab("Position") +
    ylab("Expression") +
    annotate("text",x=7,y=450,label="gatZ",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=17,y=600,label="nirA",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=19,y=350,label="met8",size=7, angle=90,vjust=0.7,hjust=0) + 
    annotate("text",x=21,y=300,label="cobA-hemD",size=7, angle=90,vjust=0.7,hjust=0) +
    annotate("text",x=23,y=250,label="bioY",size=7, angle=90,vjust=0.7,hjust=0) +
    annotate("text",x=27,y=500,label="nagA",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=39,y=150,label="gltD",size=7, angle=90,vjust=0.5,hjust=0) + 
    annotate("text",x=51,y=700,label="agaS",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=53,y=750,label="agaF",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=59,y=4800,label="agaV",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=61,y=6000,label="agaW",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=63,y=5200,label="agaE",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=65,y=1200,label="nagB",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=67,y=700,label="dnaX",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=69,y=700,label="recR",size=7, angle=90,vjust=0.8,hjust=0) +
    annotate("text",x=79,y=800,label="ppaC",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=91,y=200,label="fruA",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=93,y=200,label="fruK",size=7, angle=90,vjust=0.5,hjust=0) +
    annotate("text",x=95,y=250,label="fruR",size=7, angle=90,vjust=0.5,hjust=0) +ylim(0,7500)+stat_summary(fun.data = 'mean_se', geom = "errorbar", colour = "black",width = 0.2,position = position_dodge(1))+geom_jitter(data = Expr, aes(y = FPKM),size = 2, shape = 21,stroke = 0.01, show.legend = FALSE,position = position_jitterdodge(jitter.height=1,dodge.width = 1))

  
 ##2. geno position
 
 Map <- read.csv("Limits.txt", header=T, sep="")

##2.A. Strains 4-8-110&4-15-1(OTU476-like)

Ct=-1481773

ggplot(dya = Map) + geom_point(mapping = aes(x = Map$X, y = Map$Y),color="white") +
  annotate("rect",xmin=1482111+Ct,xmax=1483427+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #gatZ-kbaZ
  annotate("text",x=1482811+Ct,y=-1.3,label="gatZ",size=2) +
  annotate("rect",xmin=1483814+Ct,xmax=1484275+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #paaH, hbd, fadB, mmgB
  annotate("text",x=1484014+Ct,y=0.3,label="paaH",size=2) +
  annotate("rect",xmin=1484359+Ct,xmax=1485558+Ct,ymin=-0.5,ymax=-1,alpha=.2,fill="black") + #K07133
  annotate("rect",xmin=1486301+Ct,xmax=1487263+Ct,ymin=0.5,ymax=1,alpha=.2,fill="black") + #?
  annotate("rect",xmin=1487285+Ct,xmax=1488796+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #nirA
  annotate("text",x=1488100+Ct,y=-0.3,label="nirA",size=2) +
  annotate("rect",xmin=1488854+Ct,xmax=1489408+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #MET8
  annotate("text",x=1489500+Ct,y=0.3,label="MET8",size=2) +
  annotate("rect",xmin=1489398+Ct,xmax=1491629+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #cobA-hemD
  annotate("text",x=1491000+Ct,y=1.2,label="cobA-hemD",size=2) +
  annotate("rect",xmin=1491619+Ct,xmax=1492128+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #bioY
  annotate("text",x=1491619+Ct,y=0.3,label="bioY",size=2) +
  annotate("rect",xmin=1492548+Ct,xmax=1493687+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #nagA
  annotate("text",x=1493050+Ct,y=2.3,label="nagA",size=2) +
  annotate("rect",xmin=1496810+Ct,xmax=1501297+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") + #?
  annotate("rect",xmin=1501297+Ct,xmax=1502736+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #gltD
  annotate("text",x=1502000+Ct,y=0.3,label="gltD",size=2) +
  annotate("rect",xmin=1502949+Ct,xmax=1504172+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") + #?
  annotate("rect",xmin=1506773+Ct,xmax=1507945+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaS
  annotate("text",x=1507400+Ct,y=1.3,label="agaS",size=2,fontface="bold") +
  annotate("rect",xmin=1507982+Ct,xmax=1508413+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaF
  annotate("text",x=1508200+Ct,y=2.3,label="agaF",size=2) +
  annotate("rect",xmin=1508628+Ct,xmax=1509740+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") + #K07496
  annotate("rect",xmin=1510380+Ct,xmax=1511540+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") + #
  annotate("rect",xmin=1511784+Ct,xmax=1512260+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaV
  annotate("text",x=1511784+Ct,y=1.3,label="agaV",size=2) +
  annotate("rect",xmin=1512295+Ct,xmax=1513080+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaW
  annotate("text",x=1513000+Ct,y=2.3,label="agaW",size=2) + 
  annotate("rect",xmin=1513070+Ct,xmax=1513933+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaE
  annotate("text",x=1513500+Ct,y=1.3,label="agaE",size=2) +
  annotate("rect",xmin=1514662+Ct,xmax=1515390+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="red") + #nagB
  annotate("text",x=1514900+Ct,y=0.3,label="nagB",size=2) +
  annotate("rect",xmin=1515460+Ct,xmax=1517061+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #dnaX
  annotate("text",x=1516000+Ct,y=1.2,label="dnaX",size=2) +
  annotate("rect",xmin=1517062+Ct,xmax=1517649+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #recR
  annotate("text",x=1517200+Ct,y=0.3,label="recR",size=2) +
  annotate("rect",xmin=1517649+Ct,xmax=1522022+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") +#?
  annotate("rect",xmin=1522032+Ct,xmax=1523633+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #ppaC
  annotate("text",x=1522800+Ct,y=0.3,label="ppaC",size=2) +
  annotate("rect",xmin=1523713+Ct,xmax=1525014+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") +#?
  annotate("rect",xmin=1525200+Ct,xmax=1527665+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") +#?
  annotate("rect",xmin=1527737+Ct,xmax=1529626+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="red") + #fruA
  annotate("text",x=1528500+Ct,y=-0.3,label="fruA",size=2) +
  annotate("rect",xmin=1529628+Ct,xmax=1530533+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #fruK
  annotate("text",x=1529999+Ct,y=-1.3,label="fruK",size=2) +
  annotate("rect",xmin=1530693+Ct,xmax=1531445+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="red") + #fruR
  annotate("text",x=1531000+Ct,y=0.3,label="fruR",size=2) +
  annotate("text",x=45000,y=2.3,label="NO REPRESSOR",size=2) +
  annotate("text",x=43000,y=-2.0,label="FINISHED GENOME",size=2) +
  geom_hline(yintercept=0,linetype="dashed",size=0.25) +
  ggtitle("Strains 4-8-110&4-15-1 (OTU476-like)") +theme_bw()+
  theme(axis.title=element_text(size=14),axis.text.x = element_text(size=10, color = "black"),axis.text.y = element_blank()) + xlab("Genome position") + ylab("Strand")

##2.B.E.coli(Enterobacteriaceae)
 
Ct=10252

ggplot(dya = Map) + geom_point(mapping = aes(x = Map$X, y = Map$Y),color="white") +
  annotate("rect",xmin=19096+Ct,xmax=19797+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agal
  annotate("text",x=19096+Ct,y=2.3,label="agal",size=2) +
  annotate("rect",xmin=18250+Ct,xmax=19041+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #agaD
  annotate("text",x=18250+Ct,y=0.3,label="agaD",size=2) +
  annotate("rect",xmin=17457+Ct,xmax=18260+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #agaC
  annotate("text",x=17457+Ct,y=1.2,label="agaC",size=2) +
  annotate("rect",xmin=16942+Ct,xmax=17418+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #agaB
  annotate("text",x=16942+Ct,y=0.3,label="agaB",size=2) +
  annotate("rect",xmin=15915+Ct,xmax=16775+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #gatY
  annotate("text",x=15915+Ct,y=2.3,label="gatY",size=2) +
  annotate("rect",xmin=14748+Ct,xmax=15902+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaS
  annotate("text",x=14748+Ct,y=1.3,label="agaS",size=2, fontface="bold") +
  annotate("rect",xmin=13264+Ct,xmax=14397+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #agaA
  annotate("text",x=13264+Ct,y=0.3,label="agaA",size=2) +
  annotate("rect",xmin=12833+Ct,xmax=13267+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaF
  annotate("text",x=12833+Ct,y=1.3,label="agaF",size=2) +
  annotate("rect",xmin=11937+Ct,xmax=12815+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaE
  annotate("text",x=11937+Ct,y=2.3,label="agaE",size=2) +
  annotate("rect",xmin=11168+Ct,xmax=11947+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaW
  annotate("text",x=11168+Ct,y=1.3,label="agaW",size=2) +
  annotate("rect",xmin=10684+Ct,xmax=11157+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaV
  annotate("text",x=10684+Ct,y=2.3,label="agaV",size=2) +
  annotate("rect",xmin=9381+Ct,xmax=10661+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #gatZ
  annotate("text",x=9381+Ct,y=1.3,label="gatZ",size=2) +
  annotate("rect",xmin=8324+Ct,xmax=9133+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaR
  annotate("text",x=8324+Ct,y=-1.3,label="agaR",size=2) +
  annotate("rect",xmin=7805+Ct,xmax=8269+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #yhaV
  annotate("text",x=7805+Ct,y=0.3,label="yhaV",size=2) +
  annotate("rect",xmin=45000,xmax=45700,ymin=2.5,ymax=3.0,alpha=.2,fill="green") + #pfkA
  annotate("text",x=45000,y=2.3,label="pfkA",size=2) +
  annotate("text",x=43000,y=-2.0,label="MULTIPLE MAGS",size=2) +
  geom_hline(yintercept=0,linetype="dashed",size=0.25) +
  ggtitle("E. Coli (Enterobacteriaceae)")  +theme_bw()+
  theme(axis.title=element_text(size=14),axis.text.x = element_text(size=10, color = "black"),axis.text.y = element_blank()) + xlab("Genome position") + ylab("Strand")

 
 


