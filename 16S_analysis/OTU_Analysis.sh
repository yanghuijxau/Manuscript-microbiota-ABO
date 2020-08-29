#!/bin/bash
echo ==========start at : `date` ==========
/qiime1/bin/summarize_taxa.py -i /Process/OTU_Cluster_Taxonomy/3.OTU_Taxonomy/OTU_table.biom -L 2,3,4,5,6,7 --absolute_abundance -o /Process/OTU_Cluster_Taxonomy/5.Taxa_summary && \
python sort_sample_taxonomy.py -m ./Mapping.txt -p /Process/OTU_Cluster_Taxonomy/5.Taxa_summary/OTU_table_L2.txt -c /Process/OTU_Cluster_Taxonomy/5.Taxa_summary/OTU_table_L3.txt -o /Process/OTU_Cluster_Taxonomy/5.Taxa_summary/OTU_table_L4.txt -f /Process/OTU_Cluster_Taxonomy/5.Taxa_summary/OTU_table_L5.txt -g /Process/OTU_Cluster_Taxonomy/5.Taxa_summary/OTU_table_L6.txt -s /Process/OTU_Cluster_Taxonomy/5.Taxa_summary/OTU_table_L7.txt && \
echo ==========end at : `date` ==========