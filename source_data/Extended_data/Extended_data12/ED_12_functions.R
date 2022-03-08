library(stats)
library(ggplot2)
library(chemometrics)

source(file.path(progr.dir,'gg_qqplot.R')) #QQ plots in ggplot2


# INPUT
 # bloodgroups.file = file.path(
    # home.dir,'Work_dir/DATA/CEDAR1_genotypes/CEDAR_genot_imp_BloodGroup_A_nonA.csv'
 # metadata.file = metadata that will be used in linear model
 # feature.table.before.imputation = e.g. file.path(
    # home.dir,'Work_dir/DATA/My_Fastq_reanal/V1V2/Rep_Seqs/V1V2_RepSeq_table_10k.tsv') 
# nonzero.values.threshold = min number of NA values to consider the Rep Seq
# threshold.full.lm = if number of NA values for current Rep Seq < threshold.full.lm,
    # the linear model applied is simply OTU.table.v12.Erys_[,i]~bloodgr.with.A
# remove.zeros - if zero values in feature.table.before.imputation should be
#               replaced by NA
# data.corrected4loc = if yes, the sample names are IPC000, not IPC000.IL.V12
# scale_ = if we should scale the abundances of taxa (mean 0, SD 1) - otherwise volcano plots are weird
# convert_blood_group_to10 = convert AA, AO, AB to 1 and non-A to 0 blood group.
#           in case the blood group is in 1-0 format, do not do the conversion, 
#           assign it to FALSE!
# plot.file = file where to make the plot.If NULL, the plot is printed to stdout
# return.plot.only = if TRUE, return only the plot
# return.df.and.plot = return both data frame with p-values etc. and the plot
#           as elements of a list (is dominant to return.plot.only and plot.file)
bloodGr.Erys.plot <- function(repseq.taxon.file,feature.table.file,
                              feature.table.before.imputation = NULL,
                              bloodgroups.file, plot.file = NULL, title_ = '',
                              metadata.file = file.path(
                                  home.dir,'/Work_dir/DATA/My_Fastq_reanal/Pooled_amplicons/metadata.tsv'),
                              nonzero.values.threshold = 30,
                              threshold.full.lm = 30, remove.zeros = T,
                              data.corrected4loc = F, scale_ = F,
                              convert_blood_group_to10 = T, size_ = 40,
                              return.df.and.plot = F,
                              return.plot.only = F, color_ = 'black'
                              ){
    OTU.table.v12 <- read.table.smart(feature.table.file)
    # 
    if(data.corrected4loc){
        if(length(unique(str_sub(colnames(OTU.table.v12),end = 6)))!=
           length(colnames(OTU.table.v12))){stop('feature.table.file error')}
        colnames(OTU.table.v12) <- str_sub(colnames(OTU.table.v12),end = 6)
    }
    if(remove.zeros){# replace the imputed-before-clr values by NA
        if(is.null(feature.table.before.imputation)){
            stop('feature.table.before.imputation file must be specified')
        }
        OTU.table.v12.before.imp <- read.table.smart(feature.table.before.imputation)
        OTU.table.v12[OTU.table.v12.before.imp==0] <- NA #checked 4 values, NA is in right places
    }
    OTU.table.v12 <- as.data.frame(t(OTU.table.v12))
    # Read the taxa-repseq correspondence file
    repseq.taxa.df <- read.table.smart(repseq.taxon.file,quote = "")
    repseq.taxa.df.Erys <- repseq.taxa.df[repseq.taxa.df$Taxon%like%';D_4__Erysipelotrichaceae',]
    repseq.Erys <- rownames(repseq.taxa.df.Erys)
    # Extract only rep seqs corresp to Erysipellotrychaceae from OTU.table.v12.mod_
    OTU.table.v12.Erys <- OTU.table.v12[,colnames(OTU.table.v12)%in%repseq.Erys]
    OTU.table.v12.Erys <- as.data.frame(OTU.table.v12.Erys)
    RepSeqs.number <- ncol(OTU.table.v12.Erys)

    # Add blood groups to the data frame
    Bloodgroups <- read.table.smart(bloodgroups.file)
    if(ncol(Bloodgroups)<2){
        stop('Blood group file must contain 2 columns')
    }
    samples.bloodgr <- character(length(rownames(OTU.table.v12.Erys)))
    names(samples.bloodgr) <- rownames(OTU.table.v12.Erys)
    samples.secrStatus <- character(length(rownames(OTU.table.v12.Erys)))
    names(samples.secrStatus) <- rownames(OTU.table.v12.Erys)
    for(i in 1:length(samples.bloodgr)){
        samples.bloodgr[i] <- Bloodgroups[str_sub(names(samples.bloodgr)[i],end = 6),1]
        samples.secrStatus[i] <- Bloodgroups[str_sub(names(samples.bloodgr)[i],end = 6),2]
    } #2 samples checked ok
    if((sum(!rownames(OTU.table.v12.Erys)==names(samples.bloodgr))>0)|
       (sum(!rownames(OTU.table.v12.Erys)==names(samples.secrStatus))>0)){
        stop('wrong order of samples!')
    } else{
        OTU.table.v12.Erys[,ncol(OTU.table.v12.Erys)+1] <- samples.bloodgr
        colnames(OTU.table.v12.Erys)[ncol(OTU.table.v12.Erys)] <- 'bloodgr'
        if(convert_blood_group_to10){
            OTU.table.v12.Erys[,ncol(OTU.table.v12.Erys)+1] <- ifelse(
                OTU.table.v12.Erys$bloodgr%in%c('AB','A0','AA','A'),1,0)
        }else{
            OTU.table.v12.Erys[,ncol(OTU.table.v12.Erys)+1] <-
                as.numeric(OTU.table.v12.Erys$bloodgr)
        }
        colnames(OTU.table.v12.Erys)[ncol(OTU.table.v12.Erys)] <- 'bloodgr.with.A'
        OTU.table.v12.Erys$bloodgr.with.A[is.na(OTU.table.v12.Erys$bloodgr)] <- NA 
        OTU.table.v12.Erys[,ncol(OTU.table.v12.Erys)+1] <-samples.secrStatus
        colnames(OTU.table.v12.Erys)[ncol(OTU.table.v12.Erys)] <- 'Secr.status'
        OTU.table.v12.Erys[,ncol(OTU.table.v12.Erys)+1] <-as.numeric(
            OTU.table.v12.Erys$bloodgr.with.A)*as.numeric(
                OTU.table.v12.Erys$Secr.status)
        colnames(OTU.table.v12.Erys)[ncol(OTU.table.v12.Erys)] <- 'bloodgr.with.A.AND.secretor'
            # for IPCs 0-500 we have 42 NAs, this is due to also aunknown genotypes
            # 4 samples checked to original Blood group imput file = ok
    }
    # 
    # Add covariates to the data frame
    metadata <- read.table(metadata.file,
                           header = T, row.names = 1, sep = '\t', as.is = T, check.names = F)
    # if we need to correct for 
    if(data.corrected4loc){
        metadata <- metadata[,c('age','BMI','Date.collection',
                                 'Date.collection.YYYYMM','ethnie',
                                 'sex','smoker')]
        # remove the rows we do not need
        for(sample in unique(str_sub(rownames(metadata), end = 6))){
            rows.curr.sample <- which(rownames(metadata)%like%sample)
            # keep 1 row only
            if(length(rows.curr.sample)>1){
                metadata <- metadata[-c(rows.curr.sample[2:length(rows.curr.sample)]),]
            }
        }
        rownames(metadata) <- str_sub(rownames(metadata),end = 6)
    }
    metadata_new <- metadata
    metadata_new$Date.collection[is.na(metadata_new$Date.collection)] <- 
        metadata_new$Date.collection.YYYYMM[is.na(metadata_new$Date.collection)]
    samples.without.metadata <- length(setdiff(rownames(
        OTU.table.v12.Erys),rownames(metadata_new)))
    if(!data.corrected4loc){ #else there is no column of run date
        metadata_new$MiSeq_run_date_YYMMDD <- as.factor(metadata_new$MiSeq_run_date_YYMMDD)
    }
    if(samples.without.metadata>0){
        print(paste0(samples.without.metadata,' samples have no associated metadata'))
    }
    OTU.table.v12.Erys <- merge.by.rownames.flex(OTU.table.v12.Erys,
                                                 metadata_new, all.x = T)
    #remove OTUs with < nonzero.values.threshold (30) values
       # OTU.table.v12.Erys_ <- OTU.table.v12.Erys
       # OTU.table.v12.Erys_[,1:RepSeqs.number] <- OTU.table.v12.Erys_[,sum(!is.na())]
    RepSeqs.number.new = 0
    black.labels <- logical(RepSeqs.number)
    univariate.model.labels <- logical(RepSeqs.number)
    for(i in 1:RepSeqs.number){
        sum.nonzero.values <- sum(Reduce('&',list(c(!is.na(OTU.table.v12.Erys[,i])),c(
            OTU.table.v12.Erys[,i]!=0))))
        # print(sum.nonzero.values)
        if(sum.nonzero.values<nonzero.values.threshold){
            black.labels[i] <- T
        }
        if(sum.nonzero.values<threshold.full.lm){
            univariate.model.labels[i] <- T
        }
    }
    # scale variables if required
    if(scale_){
        OTU.table.v12.Erys[,1:RepSeqs.number] <- scale(
            OTU.table.v12.Erys[,1:RepSeqs.number])
    }
            # black.labels[(RepSeqs.number+1):ncol(OTU.table.v12.Erys)] <- F
            # univariate.model.labels[(RepSeqs.number+1):ncol(OTU.table.v12.Erys)] <- F
            # RepSeqs.number.new <- RepSeqs.number-sum(black.labels)
    OTU.table.v12.Erys_ <- OTU.table.v12.Erys
             # OTU.table.v12.Erys_ <- OTU.table.v12.Erys_[,!black.labels]
    # make linear model
    lm.df <- as.data.frame(matrix(ncol = 4, nrow = 0))
    colnames(lm.df) <- c('beta','log_1/p','taxon','number.non.NAs')
    print(paste0('Linear model is done for ',RepSeqs.number,' OTUs/rep. seqs'))
    print(paste0('OTUs/rep. seqs where univariate model done (total ', sum(
        univariate.model.labels==T),') are these:'))
    for(i in (1:RepSeqs.number)[!black.labels]){
        if(!univariate.model.labels[i]){
            if(!data.corrected4loc){ #case when we have multiple locations IPC000.IL.V12
                lm.current <- lm(formula = OTU.table.v12.Erys_[,i]~bloodgr.with.A+
                                     Secr.status+BMI+smoker+sex+age+
                                     MiSeq_run_date_YYMMDD%in%Location.new.style+Location.new.style,
                                 data = OTU.table.v12.Erys_)
            }else{ #case when we have 1 location IPC000
                lm.current <- lm(formula = OTU.table.v12.Erys_[,i]~bloodgr.with.A+
                                     Secr.status+BMI+smoker+sex+age,
                                 data = OTU.table.v12.Erys_)
            }
        } else{
            lm.current <- lm(formula = OTU.table.v12.Erys_[,i]~bloodgr.with.A,
                             data = OTU.table.v12.Erys_)
            cat(paste0(colnames(OTU.table.v12.Erys_)[i], '; '))
        }
        
        lm.df[i,1] <- summary(lm.current)[[4]]['bloodgr.with.A',1]
        lm.df[i,2] <- -log10(summary(lm.current)[[4]]['bloodgr.with.A',4])
        lm.df[i,3] <- repseq.taxa.df[colnames(OTU.table.v12.Erys_)[i],'Taxon']
        lm.df[i,4] <- sum(!is.na(OTU.table.v12.Erys_[,i]))
        
        # lm.current <- lmer(formula = OTU.table.v12.Erys_[,i]~bloodgr.with.A+
        #                        Secr.status+BMI+smoker+sex+age+
        #                        MiSeq_run_date_YYMMDD%in%Location.new.style+
        #                        Location.new.style+(1|Date.collection),
        #                  data = OTU.table.v12.Erys_)
        # 
        # lm.df[i,1] <- summary(lm.current)[[10]]['bloodgr.with.A',1]
        # lm.df[i,2] <- -log10(summary(lm.current)[[10]]['bloodgr.with.A',4])
        rownames(lm.df)[i] = colnames(OTU.table.v12.Erys_)[i]
    }
    lm.df <- lm.df[!is.na(lm.df[,1]),]
    # a volcano plot
    volc.plot <- ggplot(data = lm.df, aes(x = lm.df[,1], y = lm.df[,2]))+
        geom_point(aes(size=1))+
        xlim(1.2*c(-max(abs(lm.df[,1]), na.rm = T),
                   max(abs(lm.df[,1]), na.rm = T)))+
        # xlab('beta')+
        # ylab('log_1/p')+
        labs(title = title_, x="Beta",
             y = expression('-Log'[10]*'p'))+
        theme(axis.text=element_text(size=30, color = color_),
              axis.title = element_text(size=40, color = color_),
              plot.title = element_text(size=size_, hjust = 0.5),
              legend.position = 'none', plot.margin = margin(2, 1, 1, 1, "cm"))
    if(return.df.and.plot){ #return plot and lm.df as 2 elements of a list
        result <- list()
        result[[1]] <- lm.df
        result[[2]] <- volc.plot
        return(result)
    }else if(!return.plot.only){ #the usual case when we make a plot and return lm.df
        if(!is.null(plot.file)){
            jpeg(plot.file,
                 width = 800, height = 800)
            # par(mar = c(5,5,5,50))
            print(volc.plot)
            dev.off()
        } else{
            print(volc.plot)
        }
        return(lm.df)
    } else{
        return(volc.plot)
    }
 }



# Make a volcano plot
vol.plot.create <- function(lm.df, log.scaled.p = F, title_ = ''){
    if(!log.scaled.p){
        lm.df[,2] <- -log10(lm.df[,2])
    }
    volc.plot <- ggplot(data = lm.df, aes(x = lm.df[,1], y = lm.df[,2]))+
        geom_point(aes(size=1))+
        xlim(1.2*c(-max(abs(lm.df[,1]), na.rm = T),
                   max(abs(lm.df[,1]), na.rm = T)))+
        labs(title = title_, x="beta",
             y = expression('-log'[10]*'p'))+
        theme(axis.text=element_text(size=30),axis.title = element_text(size=40),
              plot.title = element_text(size=40, hjust = 0.5),
              legend.position = 'none', plot.margin = margin(2, 1, 1, 1, "cm"))
    print(volc.plot)
}


# For genera abundance data frame and blood group data frame, make linear model
create.lm.Erys <- function(bloodgroups.file = file.path(
    home.dir,'Work_dir/DATA/CEDAR1_genotypes/CEDAR_genot_imp_BloodGroup_A_nonA_secrStatus.csv'),
    genera.abundance, one.sided = F
){
    genera.abundance.t <- as.data.frame(t(genera.abundance))
    # Add blood groups to the data frame
    Bloodgroups <- read.table.smart(bloodgroups.file)
    if(ncol(Bloodgroups)<2){
        stop('Blood group file must contain 2 columns')
    }
    genera.abundance.Erys <- genera.abundance.t[
        ,colnames(genera.abundance.t)%like%';f__Erysipelotrichaceae']
    genera.abundance.bloodbroup <- merge.by.rownames.flex(genera.abundance.Erys,
                                                               Bloodgroups, all = F) #I checked blood group and secr status for 3 samples = OK
    genera.abundance.bloodbroup[,ncol(genera.abundance.bloodbroup)+1] <- ifelse(
        genera.abundance.bloodbroup$Blood.gr%in%c('AB','A0','AA','A'),1,0)
    colnames(genera.abundance.bloodbroup)[
        ncol(genera.abundance.bloodbroup)] <- 'Bloodgr.with.A'
    genera.abundance.bloodbroup$Bloodgr.with.A[
        is.na(genera.abundance.bloodbroup$Blood.gr)] <- NA 
    # make linear model
    lm.df <- as.data.frame(matrix(ncol = 2, nrow = 0))
    colnames(lm.df) <- c('beta','p')
    for(i in 1:11){
        lm.current <- lm(formula = genera.abundance.bloodbroup[,i]~Bloodgr.with.A+
                             secr.status,
                         data = genera.abundance.bloodbroup)
        lm.df[i,1] <- summary(lm.current)[[4]]['Bloodgr.with.A',1]
        lm.df[i,2] <- summary(lm.current)[[4]]['Bloodgr.with.A',4]
        rownames(lm.df)[i] = colnames(genera.abundance.bloodbroup)[i]
    }
    if(one.sided){
        for(i in 1:nrow(lm.df)){
            if(lm.df[i,1]>0){#this case it is elevated in A-containing blood group
                lm.df[i,2] <- lm.df[i,2]/2
            } else{
                lm.df[i,2] <- 1-(lm.df[i,2]/2)
            }
        }
    }
    return(lm.df)
}

# to a data frame of log associations, add row with one-sided non-log associations (used for making 1-sided QQ-plots)
convert.to.onesided.pval <- function(corr.df){
    corr.df$pval_oneSided <- NA
    for(i in 1:nrow(corr.df)){
        if(corr.df[i,'beta']>0){#this case it is elevated in A-containing blood group
            corr.df[i,'pval_oneSided'] <- 1/((10^(corr.df$`log_1/p`[i]))*2)
        } else{
            corr.df[i,'pval_oneSided'] <- 1-1/((10^(corr.df$`log_1/p`[i]))*2)
        }
    }
    return(corr.df)
}

# This function returns a 6-facet plot for assoc of blood group
#   (A-nonA, B-nonB, O-nonO) with Erysipel-assigned OTUs
# INPUT:
# bloodgroups.file = file with correspondence of sample to blood group (must be 1 or 0 only!)
#           e.g. file.path(
#           home.dir,'Work_dir/DATA/CEDAR1_genotypes/CEDAR_genot_imp_BloodGroup_A_nonA_secrStatus_v2.csv')
# repseq.taxon.files = correspondence of rep seq with a taxon (to spot Eryspipelotrichaceae)
# metadata.file = sample metadata
# feature.table.files = files with rep seq abundance
# titles = titles (main) of the 6 facets
# nonzero.values.threshold = OTUs with at least this non-zero values taken into account in the linear model
# remove.zeros = if 0 rep seq abundance values should be disregarded in analysis (F)
# data.corrected4loc = if the input data was corrected for location
# scale_ = if the OTU abundances should be scaled (T)
# convert_blood_group_to10 = normally F (better provide 0-1 within bloodgroups.file)

make.plot4paper.6facets <- function(repseq.taxon.files = c(file.path(
    home.dir,'Work_dir/DATA/My_Fastq_reanal/V1V2/2019_02_13/Vtoraya_ochered/Feature_ID_taxon_v12.csv'),
    file.path(
        home.dir,'Work_dir/DATA/My_Fastq_reanal/V3V4/2019_02_13/Vtoraya_ochered/Feature_ID_taxon_v34.tsv'),
    file.path(
        home.dir,'Work_dir/DATA/My_Fastq_reanal/V5V6/2019_02_13/Vtoraya_ochered/Feature_ID_taxon_v56.tsv')),
    bloodgroups.file,
    metadata.file = file.path(
        home.dir,'/Work_dir/DATA/My_Fastq_reanal/Pooled_amplicons/metadata.tsv'),
    feature.table.files = c(file.path(
        home.dir,'Work_dir/DATA/My_Fastq_reanal/V1V2/Rep_Seqs/V1V2_97identOTU_table_raref10k_averLoc.tsv'),
        file.path(
            home.dir,'Work_dir/DATA/My_Fastq_reanal/V3V4/Rep_Seqs/V3V4_97identOTU_table_raref5k_averLoc.tsv'),
        feature.table.file = file.path(
            home.dir,'Work_dir/DATA/My_Fastq_reanal/V5V6/Rep_Seqs/V5V6_97identOTU_table_raref10k_averLoc.tsv')
        ),
    # plot.file = NULL, return.plot.only = T,
    titles = c('V1V2','V3V4','V5V6','V1V2','V3V4','V5V6'), 
    nonzero.values.threshold = 5, remove.zeros = F, data.corrected4loc = T,
    scale_ = T, convert_blood_group_to10 = F
    # pvalQQ1, pvalQQ2, pvalQQ3
){
    plots.list <- list()
    #V1V2 
             # V1V2.list <- list()
    V1V2.list <- bloodGr.Erys.plot(repseq.taxon.file = repseq.taxon.files[1],
        bloodgroups.file = bloodgroups.file,
        metadata.file = metadata.file,
        feature.table.file = feature.table.files[1],
        plot.file = NULL, return.plot.only = T,
        title_ = titles[1],
        nonzero.values.threshold = nonzero.values.threshold, 
        remove.zeros = remove.zeros, data.corrected4loc = data.corrected4loc,
        scale_ = scale_, convert_blood_group_to10 = convert_blood_group_to10,
        return.df.and.plot = T
    ) 
    plots.list[[1]] <- V1V2.list[[2]]
    V1V2.bloodrg.Erys.df.min5.noCLR.oneSided <- (convert.to.onesided.pval(V1V2.list[[1]]))$pval_oneSided
    # V5V6.bloodrg.Erys.df.min5.noCLR.oneSided <- convert.to.onesided.pval(V5V6.bloodrg.Erys.df.min5.noCLR)
    # V3V4
    V3V4.list <- bloodGr.Erys.plot(repseq.taxon.file = repseq.taxon.files[2],
        bloodgroups.file = bloodgroups.file,
        metadata.file = metadata.file,
        feature.table.file = feature.table.files[2],
        title_ = titles[2],
        plot.file = NULL, return.plot.only = T,
        nonzero.values.threshold = nonzero.values.threshold,
        remove.zeros = remove.zeros, data.corrected4loc = data.corrected4loc,
        scale_ = scale_, convert_blood_group_to10 = convert_blood_group_to10,
        return.df.and.plot = T
    )
    plots.list[[2]] <- V3V4.list[[2]]
    V3V4.bloodrg.Erys.df.min5.noCLR.oneSided <- (convert.to.onesided.pval(
        V3V4.list[[1]]))$pval_oneSided
    # V5V6
    V5V6.list <- bloodGr.Erys.plot(repseq.taxon.file = repseq.taxon.files[3],
        bloodgroups.file = bloodgroups.file,
        metadata.file = metadata.file,
        feature.table.file = feature.table.files[3],
        plot.file = NULL, return.plot.only = T,
        title_ = titles[3],
        nonzero.values.threshold = nonzero.values.threshold,
        remove.zeros = remove.zeros, data.corrected4loc = data.corrected4loc,
        scale_ = scale_, convert_blood_group_to10 = convert_blood_group_to10,
        return.df.and.plot = T
    )
    plots.list[[3]] <- V5V6.list[[2]]
    V5V6.bloodrg.Erys.df.min5.noCLR.oneSided <- (convert.to.onesided.pval(
        V5V6.list[[1]]))$pval_oneSided
    
    plots.list[[4]] <- gg_qqplot(V1V2.bloodrg.Erys.df.min5.noCLR.oneSided,
                                 title_ = titles[4], point.size = 7)
    plots.list[[5]] <- gg_qqplot(V3V4.bloodrg.Erys.df.min5.noCLR.oneSided,
                                 title_ = titles[5], point.size = 7)
    plots.list[[6]] <- gg_qqplot(V5V6.bloodrg.Erys.df.min5.noCLR.oneSided,
                                 title_ = titles[6], point.size = 7)
    grid.arrange(grobs= lapply(plots.list, "+", theme(plot.margin=margin(25,25,8,100),
                                                      # axis.title = element_text(face = 'bold'),
                                                      plot.tag = element_text(face = 'bold',
                                                                              size = 40))),
                 nrow = 2, ncol = 3)
}