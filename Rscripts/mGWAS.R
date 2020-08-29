
library(parallel)

library(GenABEL)

#library(plyr)

library(nlme)



#########################################111111


dat=a


GWAS=function(name,covar,g){

#cat(dat[,name])

temp=data.frame(dat[,name],covar)

phe1<-as.numeric(dat[,name]>0)

seat<-which(dat[,name]>0)

phe2 = temp[c(seat),]

#print(colnames(phe2))

fit=lm(log(dat...name.)~as.factor(sex)+as.factor(batch)+cov1+cov2+cov3,data=phe2)

res=residuals(fit)

data2=g[c(seat)]

h1<-qtscore(phe1~as.factor(temp$sex)+as.factor(temp$batch)+temp$cov1+temp$cov2+temp$cov3,data=g,trait.type="binomial")

h2<-qtscore(res,data=data2,trait.type="gaussian")

topa1=descriptives.scan(h1,top=nsnps(raw))

topa2=descriptives.scan(h2,top=nsnps(data2))


result1<-cbind(name,topa1,"h1")
result2<-cbind(name,topa2,"h2")

write.table(result1,append=T,"binary.xls",quote=F)

write.table(result1,append=T,"quantitative.xls",quote=F)

}


cl.cores <- 5

cl <- makeCluster(cl.cores,type="FORK")

clusterExport(cl,'dat')

parLapply(cl=cl,colnames(a)[3:ncol(a)],fun=GWAS,cov,raw)

stopCluster(cl)
