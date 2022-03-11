
library(scales)  ##设置透明度

dat = read.table(file="Fig3D_left_data.txt",header=T)  

x<--log10(dat[,2])
y<--log10(dat[,3])
colors = c()
colors[1:28] = "red"
colors[29:142] = "orange"
colors[143:7550] = "#0073C2FF"

Pch = c()
Pch[1:71]=16
Pch[72:3775]=16


pdf("F6_F7_corr.pdf")
par(mai=c(1.5,2,2,2))

plot(x,y,type="p",col=alpha(colors,0.6),pch=16, xlab="F6 log10(1/p)",ylab="F7 log10(1/p)",cex=3,cex.lab=2.5,cex.axis=2.2,family="Times")

dev.off()  

