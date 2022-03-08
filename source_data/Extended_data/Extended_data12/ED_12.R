source(file.path(progr.dir,'Fig.S9_functions.R'))
# A. blood group classification of 16 June
# Plot for the chinese paper
jpeg(file.path(
    home.dir,'Results/Microbiota_genotype_association/Blood_group/Erysipelotrichaceae_OTUs_vs_bloodgr/97perc_OTUs/OTU_abund_more_10to_5/BloodGroup_Erys_Human_allAmpl_VolcAndQQPlots_AnonA_v3.jpg'),
    width = 2400, height = 1600)
make.plot4paper.6facets(bloodgroups.file = file.path(
    home.dir,'Work_dir/DATA/CEDAR1_genotypes/2020_06_30_BloodGr/CEDAR_genot_imp_BloodGroup_A_nonA_secrStatus.csv')
)
dev.off()
# B vs non-B
jpeg(file.path(
    home.dir,'Results/Microbiota_genotype_association/Blood_group/Erysipelotrichaceae_OTUs_vs_bloodgr/97perc_OTUs/OTU_abund_more_10to_5/BloodGroup_Erys_Human_allAmpl_VolcAndQQPlots_B_nonB_v3.jpg'),
    width = 2400, height = 1600)
make.plot4paper.6facets(bloodgroups.file = file.path(
    home.dir,'Work_dir/DATA/CEDAR1_genotypes/2020_06_30_BloodGr/CEDAR_genot_imp_BloodGroup_B_nonB_secrStatus.csv')
)
dev.off()

# O vs non-O
jpeg(file.path(
    home.dir,'Results/Microbiota_genotype_association/Blood_group/Erysipelotrichaceae_OTUs_vs_bloodgr/97perc_OTUs/OTU_abund_more_10to_5/BloodGroup_Erys_Human_allAmpl_VolcAndQQPlots_O_nonO_v3.jpg'),
    width = 2400, height = 1600)
make.plot4paper.6facets(bloodgroups.file = file.path(
    home.dir,'Work_dir/DATA/CEDAR1_genotypes/2020_06_30_BloodGr/CEDAR_genot_imp_BloodGroup_OO_vsOthers_secrStatus.csv')
)
dev.off()