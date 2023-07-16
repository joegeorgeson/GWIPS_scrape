# GWIPS_scrape
This was an impromtu script created to scrape downloadable links from the [GWIPS website](https://gwips.ucc.ie/downloads/index.html) and rename/organize the files into something more user friendly.

This should be portable to other UCSC-mirrors through updating the python script.

## Step 1: Retrieve all links
```
python get_gwips.py > gwips_links.txt
```

## Step 2: Download all links
```
sh wget_loop.sh gwips_links.txt
```

## Step 3: Rename files and organize into assembly-based directories
(will need to update paths inside `gwips_helper.R`
```
Rscript gwips_helper.R
```
