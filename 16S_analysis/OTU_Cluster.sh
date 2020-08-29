#!/bin/bash
echo ==========start at : `date` ==========
cat /Process/Clean_Data/*.fa > /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/All_Sample.fasta &&\
mothur "#unique.seqs(fasta=/Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/All_Sample.fasta, outputdir=/Process/OTU_Cluster_Taxonomy/2.OTU_Cluster)" &&\
python sort_seq_for_uparse.py -n /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/All_Sample.names -f /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/All_Sample.unique.fasta -o /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster &&\
usearch -cluster_otus /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/sort_unique.fasta -otu_radius_pct 3 -otus /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/OTU_0.97.fasta -uc /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/OTU.map.uc &&\
usearch -uchime_ref  /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/OTU_0.97.fasta -db /Database/16S/uchime_reference_dataset/gold_20110519.fa -strand plus -nonchimeras /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/OTU_0.97.removed_chimera.fasta &&\
less /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/OTU_0.97.removed_chimera.fasta | perl -e '$num=1;while(<>){chomp;if(/^\>/){print">Otu$num
";$num++;}else{print "$_
";}}' > /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/OTU.fasta &&\
vsearch -usearch_global /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/All_Sample.fasta -db /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/OTU.fasta -strand both -id 0.97 -uc /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/global.map.uc &&\
python uc2otutab.py /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/global.map.uc > /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/OTU_shared_all.xls &&\
echo ==========end at : `date` ==========
