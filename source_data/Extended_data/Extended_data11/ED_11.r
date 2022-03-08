library(ggplot2)
library(dplyr)
library(forcats)

Map <- read.csv("Limits.txt", header=T, sep="")

##4-8-110

Ct=-1481773

CairoPDF("4-8-110.pdf",width = 13.5,height = 3.3)

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
  ggtitle("Strain 4-8-110 (OTU476-like)") +theme_bw()+
  theme(axis.title=element_text(size=14),axis.text.x = element_text(size=10, color = "black"),axis.text.y = element_blank()) + xlab("Genome position") + ylab("Strand")
dev.off()	

# E. Coli (S114106A_bin_11)
Ct=10252
CairoPDF("Ecoli-Regulon.pdf",width = 13.5,height = 3.3)
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
  dev.off()
  
  # Colinsella (LW2-s126610_bin_38)
Ct=-76112
CairoPDF("Collinsella-Regulon.pdf",width = 13.5,height = 3.3)
ggplot(dya = Map) + geom_point(mapping = aes(x = Map$X, y = Map$Y),color="white") +
  annotate("rect",xmin=90153+Ct,xmax=91928+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #LacE
  annotate("text",x=90153+Ct,y=0.3,label="lacE",size=2) +
  annotate("rect",xmin=92004+Ct,xmax=93425+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #K01220
  annotate("text",x=92004+Ct,y=1.3,label="K01220",size=2) +
  annotate("rect",xmin=93939+Ct,xmax=94703+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #lacR
  annotate("text",x=93939+Ct,y=-0.3,label="lacR",size=2) +
  annotate("rect",xmin=94703+Ct,xmax=95962+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #galM
  annotate("text",x=94703+Ct,y=0.3,label="galM",size=2) +
  annotate("rect",xmin=96455+Ct,xmax=96928+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") + 
  annotate("rect",xmin=96961+Ct,xmax=97062+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") + 
  annotate("rect",xmin=97133+Ct,xmax=98068+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #lacC
  annotate("text",x=97133+Ct,y=-1.3,label="lacC",size=2) +
  annotate("rect",xmin=98128+Ct,xmax=99009+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") +
  annotate("rect",xmin=99165+Ct,xmax=99749+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") + 
  annotate("rect",xmin=99825+Ct,xmax=100994+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #nagA
  annotate("text",x=99825+Ct,y=-2.3,label="nagA",size=2) +
  annotate("rect",xmin=101112+Ct,xmax=102278+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaS
  annotate("text",x=101112+Ct,y=-1.2,label="agaS",size=2,fontface="bold") +
  annotate("rect",xmin=102393+Ct,xmax=103124+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #gntR
  annotate("text",x=102393+Ct,y=-2.3,label="gntR",size=2) +
  annotate("rect",xmin=103309+Ct,xmax=104391+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaE
  annotate("text",x=103309+Ct,y=-1.2,label="agaE",size=2) +
  annotate("rect",xmin=104381+Ct,xmax=105181+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaW
  annotate("text",x=104381+Ct,y=-2.3,label="agaW",size=2) +
  annotate("rect",xmin=105272+Ct,xmax=105754+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaV
  annotate("text",x=105272+Ct,y=-1.2,label="agaV",size=2) +
  annotate("rect",xmin=105791+Ct,xmax=106072+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #yajC
  annotate("text",x=105791+Ct,y=-0.3,label="yajC",size=2) +
  annotate("rect",xmin=106072+Ct,xmax=106515+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaF
  annotate("text",x=106350+Ct,y=-2.3,label="agaF",size=2) +
  annotate("rect",xmin=107218+Ct,xmax=107856+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") + #
  annotate("rect",xmin=107867+Ct,xmax=108106+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #K07727
  annotate("text",x=107867+Ct,y=0.3,label="K07727",size=2) +
  annotate("rect",xmin=108221+Ct,xmax=109306+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") + #
  annotate("rect",xmin=109434+Ct,xmax=110519+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #IDH3
  annotate("text",x=109434+Ct,y=-0.3,label="IDH3",size=2) +
  annotate("rect",xmin=45000,xmax=45700,ymin=2.5,ymax=3.0,alpha=.2,fill="green") + 
  annotate("text",x=45000,y=2.3,label="gatY",size=2) +
  annotate("text",x=43000,y=-2.0,label="MULTIPLE MAGS",size=2)+
  geom_hline(yintercept=0,linetype="dashed",size=0.25) +
  ggtitle("Collinsella (Coriobacteriaceae)") +theme_bw()+
  theme(axis.title=element_text(size=14),axis.text.x = element_text(size=10, color = "black"),axis.text.y = element_blank()) + xlab("Genome position") + ylab("Strand")
  dev.off()
  
  # Fusobacteriaceae (LW2-s127575_bin_8)
Ct=-16605
CairoPDF("Fusobacteriaceae-Regulon.pdf",width = 13.5,height = 3.3)
ggplot(dya = Map) + geom_point(mapping = aes(x = Map$X, y = Map$Y),color="white") +
  annotate("rect",xmin=36017+Ct,xmax=37549+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #lplA
  annotate("text",x=36017+Ct,y=0.3,label="lplA",size=2) +
  annotate("rect",xmin=37571+Ct,xmax=39673+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") + #
  annotate("rect",xmin=39771+Ct,xmax=40703+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #lacC
  annotate("text",x=39771+Ct,y=-1.3,label="lacC",size=2) +
  annotate("rect",xmin=40703+Ct,xmax=41554+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #gatY
  annotate("text",x=40703+Ct,y=-2.3,label="gatY",size=2) +
  annotate("rect",xmin=41605+Ct,xmax=42747+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaS
  annotate("text",x=41605+Ct,y=-1.3,label="agaS",size=2,fontface="bold") +
  annotate("rect",xmin=42777+Ct,xmax=43730+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #glk
  annotate("text",x=42777+Ct,y=-0.3,label="glk",size=2) +
  annotate("rect",xmin=43794+Ct,xmax=44534+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #gntR
  annotate("text",x=43794+Ct,y=-1.3,label="gntR",size=2) +
  annotate("rect",xmin=44661+Ct,xmax=46112+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") + #
  annotate("rect",xmin=46127+Ct,xmax=47803+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #K03307
  annotate("text",x=46127+Ct,y=-0.3,label="K03307",size=2) +
  annotate("rect",xmin=47847+Ct,xmax=48569+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #gntR
  annotate("text",x=47847+Ct,y=-1.3,label="gntR",size=2) +
  annotate("rect",xmin=49022+Ct,xmax=49498+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaV
  annotate("text",x=48900+Ct,y=1.3,label="agaV",size=2) +
  annotate("rect",xmin=49519+Ct,xmax=50301+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaW
  annotate("text",x=49200+Ct,y=2.3,label="agaW",size=2) +
  annotate("rect",xmin=50291+Ct,xmax=51097+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaE
  annotate("text",x=50750+Ct,y=1.3,label="agaE",size=2) +
  annotate("rect",xmin=51112+Ct,xmax=51537+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #agaF
  annotate("text",x=51250+Ct,y=2.3,label="agaF",size=2) +
  annotate("rect",xmin=51641+Ct,xmax=54568+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #K08961
  annotate("text",x=51641+Ct,y=-0.3,label="K08961",size=2) +
  annotate("rect",xmin=54784+Ct,xmax=57201+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #K01727
  annotate("text",x=54784+Ct,y=-0.3,label="K01727",size=2) +
  annotate("rect",xmin=45000,xmax=45700,ymin=2.5,ymax=3.0,alpha=.2,fill="green") + 
  annotate("text",x=45000,y=2.3,label="nagA",size=2) +
  annotate("text",x=43000,y=-2.0,label="MULTIPLE MAGS",size=2)+
  geom_hline(yintercept=0,linetype="dashed",size=0.25) +
  ggtitle("?(Fusobacteriaceae)") +theme_bw()+
  theme(axis.title=element_text(size=14),axis.text.x = element_text(size=10, color = "black"),axis.text.y = element_blank()) + xlab("Genome position") + ylab("Strand")
dev.off()

#Erysipelotyrichaceae
Ct=-116019
CairoPDF("Erysipelotrichaceae-Regulon.pdf",width = 13.5,height = 3.3)
ggplot(dya = Map) + geom_point(mapping = aes(x = Map$X, y = Map$Y),color="white") +
  annotate("rect",xmin=119145+Ct,xmax=120074+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #rihB
  annotate("text",x=119145+Ct,y=0.3,label="rihB",size=2) +
  annotate("rect",xmin=120157+Ct,xmax=121506+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #gatZ
  annotate("text",x=120157+Ct,y=1.3,label="gatZ",size=2) +
  annotate("rect",xmin=121635+Ct,xmax=121937+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") + 
  annotate("rect",xmin=122835+Ct,xmax=122086+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") + 
  annotate("rect",xmin=124900+Ct,xmax=125598+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") + 
  annotate("rect",xmin=125627+Ct,xmax=126370+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") + 
  annotate("rect",xmin=126412+Ct,xmax=126663+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") + 
  annotate("rect",xmin=126750+Ct,xmax=127613+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaE
  annotate("text",x=126650+Ct,y=-1.3,label="agaE",size=2) +
  annotate("rect",xmin=127603+Ct,xmax=128397+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaW
  annotate("text",x=127603+Ct,y=-2.3,label="agaW",size=2) +
  annotate("rect",xmin=128450+Ct,xmax=128926+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaV
  annotate("text",x=128550+Ct,y=-1.3,label="agaV",size=2) +
  annotate("rect",xmin=129169+Ct,xmax=130341+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") +
  annotate("rect",xmin=130367+Ct,xmax=132925+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") +
  annotate("rect",xmin=132967+Ct,xmax=133638+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") +
  annotate("rect",xmin=133644+Ct,xmax=134693+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") +
  annotate("rect",xmin=134782+Ct,xmax=135945+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #mtlD
  annotate("text",x=134782+Ct,y=-0.3,label="mtlD",size=2) +
  annotate("rect",xmin=135955+Ct,xmax=136611+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #eda
  annotate("text",x=135955+Ct,y=-1.3,label="eda",size=2) +
  annotate("rect",xmin=136628+Ct,xmax=137101+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") +
  annotate("rect",xmin=137115+Ct,xmax=138044+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #serA
  annotate("text",x=137115+Ct,y=-0.3,label="serA",size=2) +
  annotate("rect",xmin=138063+Ct,xmax=138914+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") +
  annotate("rect",xmin=138916+Ct,xmax=139677+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #manY
  annotate("text",x=138916+Ct,y=-1.3,label="manY",size=2) +
  annotate("rect",xmin=139683+Ct,xmax=140102+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #manXa
  annotate("text",x=139683+Ct,y=-0.3,label="manXa",size=2) +
  annotate("rect",xmin=140131+Ct,xmax=140445+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") +
  annotate("rect",xmin=140559+Ct,xmax=141005+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaF
  annotate("text",x=140559+Ct,y=-2.3,label="agaF",size=2) +
  annotate("rect",xmin=141019+Ct,xmax=142194+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaS
  annotate("text",x=141719+Ct,y=-1.3,label="agaS",size=2, fontface="bold") +
  annotate("rect",xmin=142388+Ct,xmax=143536+Ct,ymin=1.5,ymax=2.0,alpha=.2,fill="red") + #nagA
  annotate("text",x=142388+Ct,y=1.3,label="nagA",size=2) +
  annotate("rect",xmin=143571+Ct,xmax=144101+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") +
  annotate("rect",xmin=144178+Ct,xmax=144528+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") +
  annotate("rect",xmin=144535+Ct,xmax=144996+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #buk
  annotate("text",x=144535+Ct,y=1.3,label="buk",size=2) +
  annotate("rect",xmin=45000,xmax=45700,ymin=2.0,ymax=2.5,alpha=.2,fill="green") + #pfkA
  annotate("text",x=45000,y=1.7,label="fruK",size=2) +
  annotate("text",x=45000,y=3.2,label="NO REPRESSOR",size=2) +
  annotate("text",x=45000,y=-2.3,label="ONE CONTIG",size=2) +
  geom_hline(yintercept=0,linetype="dashed",size=0.25) +
  ggtitle("? (Erysipelotrichaceae)") +theme_bw()+
  theme(axis.title=element_text(size=14),axis.text.x = element_text(size=10, color = "black"),axis.text.y = element_blank()) + xlab("Genome position") + ylab("Strand")
  dev.off()
  
 # Firmicutes (Boar-s19_bin_31)
Ct=12976
CairoPDF("Firmicutes-Regulon.pdf",width = 13.5,height = 3.3)
ggplot(dya = Map) + geom_point(mapping = aes(x = Map$X, y = Map$Y),color="white") +
  annotate("rect",xmin=5054+Ct,xmax=6007+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="blue") + #corA
  annotate("text",x=5054+Ct,y=0.3,label="corA",size=2) +
  annotate("rect",xmin=6045+Ct,xmax=6224+Ct,ymin=0.5,ymax=1.0,alpha=.2,fill="black") + 
  annotate("rect",xmin=6334+Ct,xmax=7182+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #gatY
  annotate("text",x=6334+Ct,y=-1.3,label="gatY",size=2) +
  annotate("rect",xmin=7253+Ct,xmax=8185+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #lacC
  annotate("text",x=7253+Ct,y=-2.3,label="lacC",size=2) +
  annotate("rect",xmin=8190+Ct,xmax=9353+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") + 
  annotate("rect",xmin=9353+Ct,xmax=9772+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaF
  annotate("text",x=9353+Ct,y=-1.3,label="agaF",size=2) +
  annotate("rect",xmin=9801+Ct,xmax=10649+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaE
  annotate("text",x=9801+Ct,y=-2.3,label="agaE",size=2) +
  annotate("rect",xmin=10636+Ct,xmax=11418+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaW
  annotate("text",x=10636+Ct,y=-1.3,label="agaW",size=2) +
  annotate("rect",xmin=11515+Ct,xmax=11991+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaV
  annotate("text",x=11515+Ct,y=-2.3,label="agaV",size=2) +
  annotate("rect",xmin=12024+Ct,xmax=13211+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #agaS
  annotate("text",x=12024+Ct,y=-1.3,label="agaS",size=2, fontface="bold") +
  annotate("rect",xmin=13341+Ct,xmax=14069+Ct,ymin=-1.5,ymax=-2.0,alpha=.2,fill="red") + #Gntr
  annotate("text",x=13341+Ct,y=-2.3,label="Gntr",size=2) +
  annotate("rect",xmin=14250+Ct,xmax=14834+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") + 
  annotate("rect",xmin=14980+Ct,xmax=15756+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="black") +
  annotate("rect",xmin=15860+Ct,xmax=17611+Ct,ymin=-0.5,ymax=-1.0,alpha=.2,fill="blue") + #hndD
  annotate("text",x=15860+Ct,y=-0.3,label="hndD",size=2) +
  annotate("rect",xmin=45000,xmax=45700,ymin=2.5,ymax=3.0,alpha=.2,fill="green") + 
  annotate("text",x=45000,y=2.3,label="nagA",size=2) +
  annotate("text",x=45000,y=-2.3,label="ONE CONTIG",size=2) +
  geom_hline(yintercept=0,linetype="dashed",size=0.25) +
  ggtitle("? (Firmicutes)")+theme_bw() +
  theme(axis.title=element_text(size=14),axis.text.x = element_text(size=10, color = "black"),axis.text.y = element_blank()) + xlab("Genome position") + ylab("Strand")
dev.off()