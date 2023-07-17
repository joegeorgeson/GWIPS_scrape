
# GWIPS_scrape
This was an impromtu script created to scrape downloadable links from the [GWIPS website](https://gwips.ucc.ie/downloads/index.html) and rename/organize the files into something more user friendly.

This should be portable to other UCSC-mirrors through updating the python script.

**Ulitmately, all data needed for GWIPS mining is contained within the file [GWIPS_key.csv](GWIPS_key.csv) created on 17Jul2023.**


## Step 1: Retrieve all links
```
python get_gwips.py > gwips_links.txt
```

## Step 2: Download all links
```
sh wget_loop.sh gwips_links.txt
```

## Step 3: Rename files and organize into assembly-based directories
(will need to update paths inside `gwips_helper.R`)
```
Rscript gwips_helper.R
```

## Step 4: Create master key
* An additional python script was create `get_gwips_text.py` to retrieve the 'text' attribute as displayed the html page.
* An additional R script `Make_key.R` was written to consolidate all info.

The final directory created contains the below;
```
num.files	size	parent
4009	133G	.
7	207M	araTha1
3	24M	araTha1.1
42	88M	baciSubt2
18	31M	caulCres
109	4.4G	ce10
6	158M	ce10.1
75	2.2G	danRer7
19	832M	danRer7.1
41	1.2G	dm3
9	383M	dm3.1
17	49M	eschColi_BW25113
413	1.1G	eschColi_K12
10	6.8M	eschColi_K12.1
1084	50G	hg38
8	193M	hg38.1
23	21M	HHV5
2	1.9M	HHV5.1
35	4.0M	Influenza_A_H1N1
32	3.7M	Influenza_A_H1N1.1
27	3.0M	Influenza_A_H1N1.2
27	3.0M	Influenza_A_H1N1.3
9	1.1M	Influenza_A_H1N1.4
9	1.1M	Influenza_A_H1N1.5
1	1.5K	k_marxianus_DMKU3_1042
12	12M	Mabcessus_ASM6918v1
973	54G	mm10
5	969K	NC_001416
15	64M	Ncrassa_or74a
6	93M	Ncrassa_or74a_Sachs_Lab
42	195M	P_aeruginosa_ATCC_33988
22	142M	P_aeruginosa_PAO1
25	936M	plasFalc1
120	8.2G	rn6
42	241M	S_coelicolor_ASM20383v1
45	288M	s_pombe
575	8.5G	sacCer3
6	104M	sacCer3.1
12	82M	Salmonella_typhimurium_SL1344
26	23M	Saureus_ASM1342
30	76M	Saureus_ASM1346
6	70M	Tbrucei_TREU927
9	158M	xenLaevis
12	291M	Zea_Mays_B73
```
