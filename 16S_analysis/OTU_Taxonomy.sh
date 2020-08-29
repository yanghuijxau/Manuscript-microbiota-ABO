cd #!/bin/bash
echo ==========start at : `date` ==========
/qiime1/bin/assign_taxonomy.py -i /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/OTU.fasta -r /Database/16S/Greengene/Greengene_2013_5_99/Greengene_2013_5_99_otus.fasta -t /Database/16S/Greengene/Greengene_2013_5_99/Greengene_2013_5_99_otus.taxonomy -m rdp -c 0.8 --rdp_max_memory 6000 -o /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy && \
perl OTU_taxonomy_deal.pl -i /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/OTU_shared_all.xls -t /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_tax_assignments.txt -f /Process/OTU_Cluster_Taxonomy/2.OTU_Cluster/OTU.fasta -o /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy -s Bacteria && \
perl OTU_table_for_biom.pl /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_shared_final.xls /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_taxonomy.xls /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy && \
perl make_otu_share.pl /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_table_for_biom.txt > /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_shared_for_alpha_diversity.xls && \
mothur "#sub.sample(shared= /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_shared_for_alpha_diversity.xls)" && \
python normalized_OTU.py -shared /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_shared_for_alpha_diversity.0.03.subsample.xls && \
perl OTU_table_for_biom.pl /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_shared_final.xls /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_taxonomy.xls /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy && \
perl OTU_stat_V1.1.pl -s /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_shared_for_alpha_diversity.0.03.subsample.xls -f 1 -d /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy && \
/qiime1/bin/biom convert -i /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_table_for_biom.txt -o /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_table.biom --to-hdf5 --table-type="OTU table" --process-obs-metadata taxonomy &&\
/qiime1/bin/biom summarize-table -i /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_table.biom -o /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_stat.xls &&\
/qiime1/bin/align_seqs.py -i /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_final.fasta -p 0.75 -o /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy &&\
/qiime1/bin/filter_alignment.py -i /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_final_aligned.fasta -g 0.99 -o /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy &&\
echo ==========end at : `date` ==========