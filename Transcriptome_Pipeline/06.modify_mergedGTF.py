import re

outfile = open(‘./Reformed_merged.gtf', 'w')
with open(‘./stringtie_merged.gtf', 'r') as gtf:
    for line in gtf:
        if 'gene_name' in line:
            '''
            chr1    Cufflinks    exon    1735    2449    .    +    .    
            gene_id "XLOC_000001"; transcript_id "TCONS_00000001"; exon_number "1"; 
            gene_name "ENSGALG00000009771"; oId "ENSGALT00000015891"; 
            nearest_ref "ENSGALT00000015891"; class_code "="; tss_id "TSS1"; p_id "P1";
            '''
            
            gene_id = re.search('gene_id ("[\w/\.-]+");', line).group(1)  #\w -> [a-zA-Z0-9_]
            s = re.search('gene_name ("[\w/\.-]+");', line)
            if not s:
                outfile.write(line)
                continue
            gene_name = s.group(1)
            new_line = line.replace('gene_name ' + gene_name, 'gene_name ' + gene_id, 1)
            write_line = new_line.replace('gene_id ' + gene_id, 'gene_id ' + gene_name, 1)
            outfile.write(write_line)
            
        else:
            outfile.write(line)

outfile.close()
