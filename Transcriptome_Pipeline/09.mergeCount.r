
name <- list.files()
n <- length(name)
mergedata <- read.table(name[1], header=TRUE, quote="\t")
for (i in 2:n){
	data <- read.table(name[i], header=TRUE, quote="\t")
	mergedata <- merge(mergedata,data,all=TRUE,sort=FALSE)
}
write.table(mergedata,file = "merge_counts.txt",sep = "\t",col.names = NA,quote = FALSE)
