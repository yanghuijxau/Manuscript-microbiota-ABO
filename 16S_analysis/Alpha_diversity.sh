#!/bin/bash
echo ==========start at : `date` ==========
mothur "#rarefaction.single(shared=./Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_shared_for_alpha_diversity.0.03.subsample.xls, calc=sobs-chao-ace-shannon-simpson, processors=8, outputdir=/Process/Alpha_Diversity, freq=500)" && \
mothur "#summary.single(shared=./Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_shared_for_alpha_diversity.0.03.subsample.xls, calc=sobs-chao-ace-shannon-simpson, outputdir=/Process/Alpha_Diversity, label=0.03,groupmode=t, subsample=F, iters=1000)" && \
perl Get_alpha_result.pl /Process/Alpha_Diversity/*.groups.summary > /Process/Alpha_Diversity/Alpha_diversity.xls && \
echo ==========end at : `date` ==========