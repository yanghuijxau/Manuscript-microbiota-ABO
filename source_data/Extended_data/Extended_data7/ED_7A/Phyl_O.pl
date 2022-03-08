$window_size = 5000;
$nr_var_in_wind = 100;
open DATAFILE, 'Datafile.txt';
$i = 0;
while (<DATAFILE>) 
{
	chomp;
	@x = split '	',$_;
	for ($j=0;$j<=$#x;$j++) 
		{
			$datafile[$i][$j]=$x[$j];
		};
    $i += 1;
};
close DATAFILE;
$nr_var = $i-1;
$nr_animals = $#x;
$nr_inf_col = 0;
print "Number of variants: ",$nr_var," - Nr of animals: ",$nr_animals,"\n";

open RESULTS, ">>results.txt";
open MEANS, ">>means.txt";
open MAX, ">>max.txt";
print RESULTS "POS;IND1;IND2;TYPE;ND\n";
print MEANS "POS;TYPE;COLOR\n";
print MAX "POS;TYPE;MND\n";
for ($var=1486;$var<=1486;$var++)
#for ($var=1;$var<=$nr_var;$var++)
{
    $sum_aaw = 0; $nr_aaw = 0;
    $sum_aab = 0; $nr_aab = 0;
    $sum_aa = 0; $nr_aa = 0;
    $sum_oosc = 0; $nr_oosc = 0;
    $sum_oob = 0; $nr_oob = 0;
    $sum_oo = 0; $nr_oo = 0;
    
    $sum_aaw_aaw = 0; $nr_aaw_aaw = 0;
    $sum_aaw_aab = 0; $nr_aaw_aab = 0;
    $sum_aaw_aa = 0; $nr_aaw_aa = 0;
    $sum_aaw_oosc = 0; $nr_aaw_oosc = 0;
    $sum_aaw_oob = 0; $nr_aaw_oob = 0;
    $sum_aaw_oo = 0; $nr_aaw_oo = 0;
    
    $sum_aab_aaw = 0; $nr_aab_aaw = 0;
    $sum_aab_aab = 0; $nr_aab_aab = 0;
    $sum_aab_aa = 0; $nr_aab_aa = 0;
    $sum_aab_oosc = 0; $nr_aab_oosc = 0;
    $sum_aab_oob = 0; $nr_aab_oob = 0;
    $sum_aab_oo = 0; $nr_aab_oo = 0;
    
    $sum_aa_aaw = 0; $nr_aa_aaw = 0;
    $sum_aa_aab = 0; $nr_aa_aab = 0;
    $sum_aa_aa = 0; $nr_aa_aa = 0;
    $sum_aa_oosc = 0; $nr_aa_oosc = 0;
    $sum_aa_oob = 0; $nr_aa_oob = 0;
    $sum_aa_oo = 0; $nr_aa_oo = 0;
    
    $sum_oosc_aaw = 0; $nr_oosc_aaw = 0;
    $sum_oosc_aab = 0; $nr_oosc_aab = 0;
    $sum_oosc_aa = 0; $nr_oosc_aa = 0;
    $sum_oosc_oosc = 0; $nr_oosc_oosc = 0;
    $sum_oosc_oob = 0; $nr_oosc_oob = 0;
    $sum_oosc_oo = 0; $nr_oosc_oo = 0;
    
    $sum_oob_aaw = 0; $nr_oob_aaw = 0;
    $sum_oob_aab = 0; $nr_oob_aab = 0;
    $sum_oob_aa = 0; $nr_oob_aa = 0;
    $sum_oob_oosc = 0; $nr_oob_oosc = 0;
    $sum_oob_oob = 0; $nr_oob_oob = 0;
    $sum_oob_oo = 0; $nr_oob_oo = 0;
    
    $sum_oo_aaw = 0; $nr_oo_aaw = 0;
    $sum_oo_aab = 0; $nr_oo_aab = 0;
    $sum_oo_aa = 0; $nr_oo_aa = 0;
    $sum_oo_oosc = 0; $nr_oo_oosc = 0;
    $sum_oo_oob = 0; $nr_oo_oob = 0;
    $sum_oo_oo = 0; $nr_oo_oo = 0;
    
    $max_nd_aa_aa = 0;
    $max_nd_oo_oo = 0;
    
    
    # Define begin
    $b = 0;
    while ($datafile[$var][0] - $datafile[$var-$b][0] < $window_size/2 && $var > $b)
    #while ($b <= $nr_var_in_wind/2 && $var > $b)
    {
        $begin = $var - $b;
        $b += 1;
    };
    #1 Define end
    $e = 0;
    while ($datafile[$var+$e][0] - $datafile[$var][0] < $window_size/2 && $var+$e <= $nr_var)
    #while ($e <= $nr_var_in_wind/2 && $var+$e <= $nr_var)
    {
        $end = $var + $e;
        $e += 1;
    };
    $nr_steps = $b + $e - 1;
    print "Analyzing var ",$var,", begin nr: ",$begin,", begin pos: ",$datafile[$begin][0],", end nr: ",$end," end pos: ",$datafile[$end][0]," window-size: ",$datafile[$end][0]-$datafile[$begin][0],"\n";
    $x=0;
    for ($i=1;$i<=$nr_animals;$i++)
    {
        print "I: ",$i," Type: ",$datafile[0][$i];
		if ($datafile[0][$i] =~ /AA/ || $datafile[0][$i] =~ /OO/)
        {
        print " - yes ...\n";
		$x+=1;
        $running_sum_nd = 0; $running_sum_nr = 0;
        for ($k=0;$k<=$nr_steps;$k++)
        {
            if ($datafile[$begin+$k][$nr_inf_col+$i] eq "0/1"){$running_sum_nd += 1;$running_sum_nr += 1;}
            elsif ($datafile[$begin+$k][$nr_inf_col+$i] eq "0/0" || $datafile[$begin+$k][$nr_inf_col+$i] eq "1/1"){$running_sum_nr += 1;};
        };
        print RESULTS $datafile[$var][0],";",$x,";",$x,";",$datafile[0][$i],"-",$datafile[0][$i],";",$running_sum_nd/($datafile[$end][0]-$datafile[$begin][0]),"\n";
       
        if ($datafile[0][$i] eq "AAW" || $datafile[0][$i] eq "AAV" || $datafile[0][$i] eq "AAS"){$sum_aaw += $running_sum_nd; $nr_aaw += 1;}
        elsif ($datafile[0][$i] eq "AAEB" || $datafile[0][$i] eq "AARB" || $datafile[0][$i] eq "AAAB"){$sum_aab += $running_sum_nd; $nr_aab += 1;}
        elsif ($datafile[0][$i] eq "AA"){$sum_aa += $running_sum_nd; $nr_aa += 1;}
        elsif ($datafile[0][$i] eq "OOSC"){$sum_oosc += $running_sum_nd; $nr_oosc += 1;}
        elsif ($datafile[0][$i] eq "OOEB" || $datafile[0][$i] eq "OORB" || $datafile[0][$i] eq "OOAB"){$sum_oob += $running_sum_nd; $nr_oob += 1;}
        elsif ($datafile[0][$i] eq "OO"){$sum_oo += $running_sum_nd; $nr_oo += 1;};
        
        #print $datafile[$var][0],";",$i,"-",$i,";",$datafile[0][$i],"-",$datafile[0][$i],";",$running_sum_nd/($datafile[$end][0]-$datafile[$begin][0]),"\n";
		$dist[$x][$x] = $running_sum_nd/($datafile[$end][0]-$datafile[$begin][0]);
        $z = 0;
		
		for ($j=$i+1;$j<=$nr_animals;$j++)
        {
            print "J: ",$j," Type: ",$datafile[0][$j];
			if ($datafile[0][$j] =~ /AA/ || $datafile[0][$j] =~ /OO/)
            {
            print " - yes ...\n";
			$z += 1;
			$y = $x + $z;
			print ";",$y;
            $running_sum_nd = 0;$running_sum_nr = 0;
            for ($k=0;$k<=$nr_steps;$k++)
            {
                if ($datafile[$begin+$k][$nr_inf_col+$i] eq "0/0")
                {
                    if ($datafile[$begin+$k][$nr_inf_col+$j] eq "0/0"){$running_sum_nd += 0;$running_sum_nr += 1;}
                    elsif ($datafile[$begin+$k][$nr_inf_col+$j] eq "0/1"){$running_sum_nd += 0.5;$running_sum_nr += 1;}
                    elsif ($datafile[$begin+$k][$nr_inf_col+$j] eq "1/1"){$running_sum_nd += 1;$running_sum_nr += 1;};
                }
                elsif ($datafile[$begin+$k][$nr_inf_col+$i] eq "0/1")
                {
                    if ($datafile[$begin+$k][$nr_inf_col+$j] eq "0/0"){$running_sum_nd += 0.5;$running_sum_nr += 1;}
                    elsif ($datafile[$begin+$k][$nr_inf_col+$j] eq "0/1"){$running_sum_nd += 0.5;$running_sum_nr += 1;}
                    elsif ($datafile[$begin+$k][$nr_inf_col+$j] eq "1/1"){$running_sum_nd += 0.5;$running_sum_nr += 1;};
                }
                elsif ($datafile[$begin+$k][$nr_inf_col+$i] eq "1/1")
                {
                    if ($datafile[$begin+$k][$nr_inf_col+$j] eq "0/0"){$running_sum_nd += 1;$running_sum_nr += 1;}
                    elsif ($datafile[$begin+$k][$nr_inf_col+$j] eq "0/1"){$running_sum_nd += 0.5;$running_sum_nr += 1;}
                    elsif ($datafile[$begin+$k][$nr_inf_col+$j] eq "1/1"){$running_sum_nd += 0;$running_sum_nr += 1;};
                };
            };
            print RESULTS $datafile[$var][0],";",$x,";",$y,";",$datafile[0][$i],"-",$datafile[0][$j],";",$running_sum_nd/($datafile[$end][0]-$datafile[$begin][0]),"\n";
            print RESULTS $datafile[$var][0],";",$y,";",$x,";",$datafile[0][$j],"-",$datafile[0][$i],";",$running_sum_nd/($datafile[$end][0]-$datafile[$begin][0]),"\n";
            
            if ($datafile[0][$i] eq "AAW" || $datafile[0][$i] eq "AAV" || $datafile[0][$i] eq "AAS")
            {
                if ($datafile[0][$j] eq "AAW" || $datafile[0][$j] eq "AAV" || $datafile[0][$j] eq "AAS"){$sum_aaw_aaw += $running_sum_nd; $nr_aaw_aaw += 1;}
                elsif ($datafile[0][$j] eq "AAEB" || $datafile[0][$j] eq "AARB" || $datafile[0][$j] eq "AAAB"){$sum_aaw_aab += $running_sum_nd; $nr_aaw_aab += 1;}
                elsif ($datafile[0][$j] eq "AA"){$sum_aaw_aa += $running_sum_nd; $nr_aaw_aa += 1;}
                elsif ($datafile[0][$j] eq "OOSC"){$sum_aaw_oosc += $running_sum_nd; $nr_aaw_oosc += 1;}
                elsif ($datafile[0][$j] eq "OOEB" || $datafile[0][$j] eq "OORB" || $datafile[0][$j] eq "OOAB"){$sum_aaw_oob += $running_sum_nd; $nr_aaw_oob += 1;}
                elsif ($datafile[0][$j] eq "OO"){$sum_aaw_oo += $running_sum_nd; $nr_aaw_oo += 1;};
            }
            elsif ($datafile[0][$i] eq "AAEB" || $datafile[0][$i] eq "AARB" || $datafile[0][$i] eq "AAAB")
            {
                if ($datafile[0][$j] eq "AAW" || $datafile[0][$j] eq "AAV" || $datafile[0][$j] eq "AAS"){$sum_aab_aaw += $running_sum_nd; $nr_aab_aaw += 1;}
                elsif ($datafile[0][$j] eq "AAEB" || $datafile[0][$j] eq "AARB" || $datafile[0][$j] eq "AAAB"){$sum_aab_aab += $running_sum_nd; $nr_aab_aab += 1;}
                elsif ($datafile[0][$j] eq "AA"){$sum_aab_aa += $running_sum_nd; $nr_aab_aa += 1;}
                elsif ($datafile[0][$j] eq "OOSC"){$sum_aab_oosc += $running_sum_nd; $nr_aab_oosc += 1;}
                elsif ($datafile[0][$j] eq "OOEB" || $datafile[0][$j] eq "OORB" || $datafile[0][$j] eq "OOAB"){$sum_aab_oob += $running_sum_nd; $nr_aab_oob += 1;}
                elsif ($datafile[0][$j] eq "OO"){$sum_aab_oo += $running_sum_nd; $nr_aab_oo += 1;};
            }
            elsif ($datafile[0][$i] eq "AA")
            {
                if ($datafile[0][$j] eq "AAW" || $datafile[0][$j] eq "AAV" || $datafile[0][$j] eq "AAS"){$sum_aa_aaw += $running_sum_nd; $nr_aa_aaw += 1;}
                elsif ($datafile[0][$j] eq "AAEB" || $datafile[0][$j] eq "AARB" || $datafile[0][$j] eq "AAAB"){$sum_aa_aab += $running_sum_nd; $nr_aa_aab += 1;}
                elsif ($datafile[0][$j] eq "AA")
                {
                    $sum_aa_aa += $running_sum_nd; $nr_aa_aa += 1;
                    if ($running_sum_nd > $max_nd_aa_aa){$max_nd_aa_aa = $running_sum_nd;};
                }
                elsif ($datafile[0][$j] eq "OOSC"){$sum_aa_oosc += $running_sum_nd; $nr_aa_oosc += 1;}
                elsif ($datafile[0][$j] eq "OOEB" || $datafile[0][$j] eq "OORB" || $datafile[0][$j] eq "OOAB"){$sum_aa_oob += $running_sum_nd; $nr_aa_oob += 1;}
                elsif ($datafile[0][$j] eq "OO"){$sum_aa_oo += $running_sum_nd; $nr_aa_oo += 1;};
            }
            elsif ($datafile[0][$i] eq "OOSC")
            {
                if ($datafile[0][$j] eq "AAW" || $datafile[0][$j] eq "AAV" || $datafile[0][$j] eq "AAS"){$sum_oosc_aaw += $running_sum_nd; $nr_oosc_aaw += 1;}
                elsif ($datafile[0][$j] eq "AAEB" || $datafile[0][$j] eq "AARB" || $datafile[0][$j] eq "AAAB"){$sum_oosc_aab += $running_sum_nd; $nr_oosc_aab += 1;}
                elsif ($datafile[0][$j] eq "AA"){$sum_oosc_aa += $running_sum_nd; $nr_oosc_aa += 1;}
                elsif ($datafile[0][$j] eq "OOSC"){$sum_oosc_oosc += $running_sum_nd; $nr_oosc_oosc += 1;}
                elsif ($datafile[0][$j] eq "OOEB" || $datafile[0][$j] eq "OORB" || $datafile[0][$j] eq "OOAB"){$sum_oosc_oob += $running_sum_nd; $nr_oosc_oob += 1;}
                elsif ($datafile[0][$j] eq "OO"){$sum_oosc_oo += $running_sum_nd; $nr_oosc_oo += 1;};
            }
            elsif ($datafile[0][$i] eq "OOEB" || $datafile[0][$i] eq "OORB" || $datafile[0][$i] eq "OOAB")
            {
                if ($datafile[0][$j] eq "AAW" || $datafile[0][$j] eq "AAV" || $datafile[0][$j] eq "AAS"){$sum_oob_aaw += $running_sum_nd; $nr_oob_aaw += 1;}
                elsif ($datafile[0][$j] eq "AAEB" || $datafile[0][$j] eq "AARB" || $datafile[0][$j] eq "AAAB"){$sum_oob_aab += $running_sum_nd; $nr_oob_aab += 1;}
                elsif ($datafile[0][$j] eq "AA"){$sum_oob_aa += $running_sum_nd; $nr_oob_aa += 1;}
                elsif ($datafile[0][$j] eq "OOSC"){$sum_oob_oosc += $running_sum_nd; $nr_oob_oosc += 1;}
                elsif ($datafile[0][$j] eq "OOEB" || $datafile[0][$j] eq "OORB" || $datafile[0][$j] eq "OOAB"){$sum_oob_oob += $running_sum_nd; $nr_oob_oob += 1;}
                elsif ($datafile[0][$j] eq "OO"){$sum_oob_oo += $running_sum_nd; $nr_oob_oo += 1;};
            }
            elsif ($datafile[0][$i] eq "OO")
            {
                if ($datafile[0][$j] eq "AAW" || $datafile[0][$j] eq "AAV" || $datafile[0][$j] eq "AAS"){$sum_oo_aaw += $running_sum_nd; $nr_oo_aaw += 1;}
                elsif ($datafile[0][$j] eq "AAEB" || $datafile[0][$j] eq "AARB" || $datafile[0][$j] eq "AAAB"){$sum_oo_aab += $running_sum_nd; $nr_oo_aab += 1;}
                elsif ($datafile[0][$j] eq "AA"){$sum_oo_aa += $running_sum_nd; $nr_oo_aa += 1;}
                elsif ($datafile[0][$j] eq "OOSC"){$sum_oo_oosc += $running_sum_nd; $nr_oo_oosc += 1;}
                elsif ($datafile[0][$j] eq "OOEB" || $datafile[0][$j] eq "OORB" || $datafile[0][$j] eq "OOAB"){$sum_oo_oob += $running_sum_nd; $nr_oo_oob += 1;}
                elsif ($datafile[0][$j] eq "OO")
                {
                    $sum_oo_oo += $running_sum_nd; $nr_oo_oo += 1;
                    if ($running_sum_nd > $max_nd_oo_oo){$max_nd_oo_oo = $running_sum_nd;};
                };
            };
            
            #print "->",$datafile[$var][0],";",$i,"-",$j,";",$datafile[0][$i],"-",$datafile[0][$i],";",$running_sum_nd/($datafile[$end][0]-$datafile[$begin][0]),"\n";
			$dist[$x][$y] = $running_sum_nd/($datafile[$end][0]-$datafile[$begin][0]);
			$dist[$y][$x] = $running_sum_nd/($datafile[$end][0]-$datafile[$begin][0]);
            };# ignore j = AO
        };
        };# ignore i = AO
    };
    print MEANS $datafile[$var][0],";AAW;",($sum_aaw/$nr_aaw)/($datafile[$end][0]-$datafile[$begin][0]),";#fee5d9\n";
    print MEANS $datafile[$var][0],";AAB;",($sum_aab/$nr_aab)/($datafile[$end][0]-$datafile[$begin][0]),";#fb6a4a\n";
    print MEANS $datafile[$var][0],";AA;",($sum_aa/$nr_aa)/($datafile[$end][0]-$datafile[$begin][0]),";#a50f15\n";
    print MEANS $datafile[$var][0],";OOSC;",($sum_oosc/$nr_oosc)/($datafile[$end][0]-$datafile[$begin][0]),";#eff3ff\n";
    print MEANS $datafile[$var][0],";OOB;",($sum_oob/$nr_oob)/($datafile[$end][0]-$datafile[$begin][0]),";#6baed6\n";
    print MEANS $datafile[$var][0],";OO;",($sum_oo/$nr_oo)/($datafile[$end][0]-$datafile[$begin][0]),";#08519c\n";
    
    print "A->",$datafile[$var][0],";AAW;",($sum_aaw/$nr_aaw)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print "A->",$datafile[$var][0],";AAB;",($sum_aab/$nr_aab)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print "A->",$datafile[$var][0],";AA;",($sum_aa/$nr_aa)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print "A->",$datafile[$var][0],";OOSC;",($sum_oosc/$nr_oosc)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print "A->",$datafile[$var][0],";OOB;",($sum_oob/$nr_oob)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print "A->",$datafile[$var][0],";OO;",($sum_oo/$nr_oo)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    
    print MEANS $datafile[$var][0],";AAW_AAW;",($sum_aaw_aaw/$nr_aaw_aaw)/($datafile[$end][0]-$datafile[$begin][0]),";#fee5d9\n";
    print MEANS $datafile[$var][0],";AAW_AAB;",($sum_aaw_aab/$nr_aaw_aab)/($datafile[$end][0]-$datafile[$begin][0]),";#fcbba1\n";
    print MEANS $datafile[$var][0],";AAW_AA;",($sum_aaw_aa/$nr_aaw_aa)/($datafile[$end][0]-$datafile[$begin][0]),";#fc9272\n";
    print MEANS $datafile[$var][0],";AAW_OOSC;",($sum_aaw_oosc/$nr_aaw_oosc)/($datafile[$end][0]-$datafile[$begin][0]),";#d9d9d9\n";
    print MEANS $datafile[$var][0],";AAW_OOB;",($sum_aaw_oob/$nr_aaw_oob)/($datafile[$end][0]-$datafile[$begin][0]),";#bdbdbd\n";
    print MEANS $datafile[$var][0],";AAW_OO;",($sum_aaw_oo/$nr_aaw_oo)/($datafile[$end][0]-$datafile[$begin][0]),";#969696\n";
    
    #print MEANS $datafile[$var][0],";AAB_AAW;",($sum_aab_aaw/$nr_aab_aaw)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print MEANS $datafile[$var][0],";AAB_AAB;",($sum_aab_aab/$nr_aab_aab)/($datafile[$end][0]-$datafile[$begin][0]),";#fb6a4a\n";
    print MEANS $datafile[$var][0],";AAB_AA;",($sum_aab_aa/$nr_aab_aa)/($datafile[$end][0]-$datafile[$begin][0]),";#de2d26\n";
    print MEANS $datafile[$var][0],";AAB_OOSC;",($sum_aab_oosc/$nr_aab_oosc)/($datafile[$end][0]-$datafile[$begin][0]),";#636363\n";
    print MEANS $datafile[$var][0],";AAB_OOB;",($sum_aab_oob/$nr_aab_oob)/($datafile[$end][0]-$datafile[$begin][0]),";#252525\n";
    print MEANS $datafile[$var][0],";AAB_OO;",($sum_aab_oo/$nr_aab_oo)/($datafile[$end][0]-$datafile[$begin][0]),";#000000\n";
    
    #print MEANS $datafile[$var][0],";AA_AAW;",($sum_aa_aaw/$nr_aa_aaw)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    #print MEANS $datafile[$var][0],";AA_AAB;",($sum_aa_aab/$nr_aa_aab)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print MEANS $datafile[$var][0],";AA_AA;",($sum_aa_aa/$nr_aa_aa)/($datafile[$end][0]-$datafile[$begin][0]),";#a50f15\n";
    print MEANS $datafile[$var][0],";AA_OOSC;",($sum_aa_oosc/$nr_aa_oosc)/($datafile[$end][0]-$datafile[$begin][0]),";#cc4c02\n";
    print MEANS $datafile[$var][0],";AA_OOB;",($sum_aa_oob/$nr_aa_oob)/($datafile[$end][0]-$datafile[$begin][0]),";#993404\n";
    print MEANS $datafile[$var][0],";AA_OO;",($sum_aa_oo/$nr_aa_oo)/($datafile[$end][0]-$datafile[$begin][0]),";#662506\n";
    
    #print MEANS $datafile[$var][0],";OOSC_AAW;",($sum_oosc_aaw/$nr_oosc_aaw)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    #print MEANS $datafile[$var][0],";OOSC_AAB;",($sum_oosc_aab/$nr_oosc_aab)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    #print MEANS $datafile[$var][0],";OOSC_AA;",($sum_oosc_aa/$nr_oosc_aa)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    #print MEANS $datafile[$var][0],";OOSC_OOSC;",($sum_oosc_oosc/$nr_oosc_oosc)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print MEANS $datafile[$var][0],";OOSC_OOB;",($sum_oosc_oob/$nr_oosc_oob)/($datafile[$end][0]-$datafile[$begin][0]),";#c6dbef\n";
    print MEANS $datafile[$var][0],";OOSC_OO;",($sum_oosc_oo/$nr_oosc_oo)/($datafile[$end][0]-$datafile[$begin][0]),";#9ecae1\n";
    
    #print MEANS $datafile[$var][0],";OOB_AAW;",($sum_oob_aaw/$nr_oob_aaw)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    #print MEANS $datafile[$var][0],";OOB_AAB;",($sum_oob_aab/$nr_oob_aab)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    #print MEANS $datafile[$var][0],";OOB_AA;",($sum_oob_aa/$nr_oob_aa)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    #print MEANS $datafile[$var][0],";OOB_OOSC;",($sum_oob_oosc/$nr_oob_oosc)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print MEANS $datafile[$var][0],";OOB_OOB;",($sum_oob_oob/$nr_oob_oob)/($datafile[$end][0]-$datafile[$begin][0]),";#6baed6\n";
    print MEANS $datafile[$var][0],";OOB_OO;",($sum_oob_oo/$nr_oob_oo)/($datafile[$end][0]-$datafile[$begin][0]),";#3182bd\n";
    
    #print MEANS $datafile[$var][0],";OO_AAW;",($sum_oo_aaw/$nr_oo_aaw)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    #print MEANS $datafile[$var][0],";OO_AAB;",($sum_oo_aab/$nr_oo_aab)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    #print MEANS $datafile[$var][0],";OO_AA;",($sum_oo_aa/$nr_oo_aa)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    #print MEANS $datafile[$var][0],";OO_OOSC;",($sum_oo_oosc/$nr_oo_oosc)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    #print MEANS $datafile[$var][0],";OO_OOB;",($sum_oo_oob/$nr_oo_oob)/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print MEANS $datafile[$var][0],";OO_;OO;",($sum_oo_oo/$nr_oo_oo)/($datafile[$end][0]-$datafile[$begin][0]),";#08519c\n";
    
    print "M->",$datafile[$var][0],";AA;",$max_nd_aa_aa/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print "M->",$datafile[$var][0],";OO;",$max_nd_oo_oo/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print MAX $datafile[$var][0],";AA;",$max_nd_aa_aa/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    print MAX $datafile[$var][0],";OO;",$max_nd_oo_oo/($datafile[$end][0]-$datafile[$begin][0]),"\n";
    
};#var
close RESULTS;
close MEANS;
close MAX;
print "X = ",$x,"; Y = ",$y,"\n";
#if ($x != $y){print "Problem ...\n";};
open DIST,">dist.txt";
print DIST "PHAC_AFR_AA;SUS_VERR_AA;SUS_SCR_VITT_AA;EU_WB_1_AA;EU_WB_2_AA;RU_WB_1_AA;RU_WB_2_AA;RU_WB_3_AA;RU_WB_4_AA;CH_DOM_EH1_AA;CH_DOM_TB_1_AA;CH_DOM_TB_2_AA;EU_DOM_LD_1_AA;EU_DOM_PT_1_AA;SUS_CEB_OO;CH_WB_1_OO;EU_WB_3_OO;EU_WB_4_OO;CH_DOM_BX_1_OO;CH_DOM_BX_2_OO;CH_DOM_BX_3_OO;CH_DOM_BX_4_OO;CH_DOM_BX_5_OO;CH_DOM_EH_2_OO;CH_DOM_TB_3_OO;CH_DOM_TB_4_OO;CH_DOM_LA_1_OO;CH_DOM_LA_2_OO;CH_DOM_LA_3_OO;CH_DOM_LD_2_OO;EU_DOM_LD_3_OO;EU_DOM_LD_4_OO;EU_DOM_LD_5_OO;EU_DOM_LD_6_OO;EU_DOM_LD_7_OO;EU_DOM_LW_1_OO;EU_DOM_LW_2_OO;EU_DOM_LW_3_OO;EU_DOM_LW_4_OO;EU_DOM_LW_5_OO;EU_DOM_PT_2_OO;EU_DOM_PT_3_OO;EU_DOM_PT_4_OO;EU_DOM_PT_5_OO;US_DOM_WD_1_OO;US_DOM_WD_2_OO;US_DOM_WD_3_OO;US_DOM_WD_4_OO\n";
for ($i=1;$i<=$x;$i++)
{
	print DIST $dist[$i][1];
	for ($j=2;$j<=$x;$j++)
	{
		print DIST ";",$dist[$i][$j];
	}
	print DIST "\n";
};
close DIST;