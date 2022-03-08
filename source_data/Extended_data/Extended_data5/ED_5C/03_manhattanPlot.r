####################################################################################
# This is a flexible function to draw plots for the Genome wide association results 
# it can plot: 
#(1) whole genome results for a single trait, the colors of signatures on each chromosome can be specified
####################################################################################

manhattanPlot = function(chrs = 1:19,trait="",dat = dat,main="",ylab=expression(-log[10](italic(P)~value)))
{				
    CHR = as.character(dat$chr)
    CHR[CHR=="X"]=19
    CHR[CHR==23] =19
    CHR = as.numeric(as.character(CHR))
    POS = as.numeric(dat$pos)
    if(max(POS) > 1000){
        POS = POS/1e6 # change the bp to Mb
    } 
    chrLen <- tapply(POS,CHR,max) # a vector to store the length of each chromosome
    chrmk <- numeric() # a vector to store the numbers that markers the positions where the chromsome labels should be put
    for(i in 1:length(chrLen)){
        chrmk[i] <- sum(as.numeric(chrLen[1:i]))
    }
    mkrPos = numeric(length(POS)) # a vector to store the position of each SNP across the entire genome

    for(i in as.numeric(unique(CHR))){
        if(i == 1)
            mkrPos[CHR == i] = POS[CHR == i]
        else 
            mkrPos[CHR == i] = POS[CHR == i] + chrmk[i-1]
    }

#============================ Start Plotting ===================================
  #  color <- rep(c("purple","black","blue","green","purple"),7)
  color <- c("darkred","darkgreen","cyan","red", "darkblue", "brown",
               "black","orange","darkred","darkgreen","cyan",
			   "red", "darkblue", "brown","black","orange","darkred",
			   "darkgreen","cyan","red","blue","brown","black","orange")   
 color2 <- color          
    idx = which(dat[,"chr"] %in% chrs)
    positions = mkrPos
    chridx = which(CHR %in% chrs[1])
    plot(positions[chridx], dat[chridx, trait],lwd = 1, col = color2[1], 
         type = "p", pch = 19,ylab = ylab,xlab ="Chromosomes",
         xlim = c(0,max(positions,na.rm=T)),main=main,xaxt="n",cex.lab=2,cex.axis = 2,
         ylim = range(1.2*min(dat[,trait],na.rm=T),1.2*max(dat[,trait],na.rm = T)),
		 xaxs = "i",yaxs = "i",cex=1,bty="n")             
    for(chrom in 2:length(chrs)){
	     chridx = which(CHR %in% chrs[chrom])
             points(positions[chridx],dat[chridx, trait],lwd = 1,cex=1,col=color2[chrom],pch = 19)                
        }
#    abline(h=-log10(0.05/nrow(dat)),lty=2,lwd=2)
    abline(h=-log10(1E-6),lty=2,lwd=2)
    abline(h=-log10(5E-8),lty=1,lwd=2)
    axis(side=1,at=(chrmk-(chrLen/2)),labels=unique(CHR),cex.axis = 2)     
}
#-------------------------------------------------------------------------------
