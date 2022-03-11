
data <- read.csv("pig_human_mouse_microbiome_result.txt", header=T, sep="")
library(ggplot2)

data$group <- factor(data$group,levels = c("F6_D25","F7_D25","F6_D120","F7_D120","F6_D240","F7_D240","Human_Feces","Mouse_Feces","F6_IC","F7_IC","F7_IM","F6_CC","F7_CC","F7_CM"))

data$family <- factor(data$family,levels = c("Others","Anaeroplasmataceae","Thermaceae","Microbacteriaceae","Corynebacteriaceae","Verrucomicrobiaceae","RFP12","Fusobacteriaceae","Sphaerochaetaceae","Spirochaetaceae","Halomonadaceae","Pseudomonadaceae","Pasteurellaceae","Enterobacteriaceae","Alcaligenaceae","Desulfovibrionaceae","Helicobacteraceae","Campylobacteraceae","Barnesiellaceae","Odoribacteraceae","Rikenellaceae","p-2534-18B5","Bacteroidaceae","BS11","Porphyromonadaceae","RF16","S24-7","Paraprevotellaceae","Prevotellaceae","Bacillaceae","Turicibacteraceae","Erysipelotrichaceae","Leuconostocaceae","Streptococcaceae","Lactobacillaceae","Tissierellaceae","Dehalobacteriaceae","Peptostreptococcaceae","Mogibacteriaceae","Clostridiaceae","Christensenellaceae","Veillonellaceae","Lachnospiraceae","Ruminococcaceae"))

color <- c("#474747","#4876FF","#458B74","#AF5930","#7B3F22","#9A32CD","#68228B","#66CDAA","#F0E685","#E9D947","#EBCBD3","#E2B6C2","#D89AAB","#CE8498","#C56B84","#BA506D","#A6425E","#933952","#D3E1CA","#C2D6B6","#B3CAA4","#A7C195","#94B57D","#7CA561","#6D9454","#5E7D48","#4F693D","#445B35","#364929","#E7EDF1","#DAE3EB","#C2D2DE","#B3C8D7","#A4BCCE","#91AEC4","#84A5BD","#779CB7","#6992AF","#5783A4","#4F7693","#476A85","#416178","#375368","#2E4556")

ggplot(data,aes(x=group,y=relative_average,fill=family))+geom_bar(stat = "identity",width = 0.5)+theme_bw()+theme(axis.text.x = element_text(angle = 30,hjust=1,size = 10),panel.grid = element_blank(),axis.title.x = element_blank(),axis.text = element_text(size = 10),axis.title.y = element_text(size=14))+ylab("Relative_abundance")+scale_fill_manual(values = color)
