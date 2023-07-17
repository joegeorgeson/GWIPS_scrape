
gwips.key <- fread("~/tmp/GWIPS/get_gwips2.py.txt", header=F)
gwips.key.n <- gsub("https://gwips.ucc.ie/downloads//","",gwips.key$V1)

str.s <- lapply(gwips.key.n, function(x) strsplit(x,"/")[[1]])

clade <- unlist(lapply(str.s, function(x) x[1]))
genome <- unlist(lapply(str.s, function(x) x[2]))
assembly <- unlist(lapply(str.s, function(x) x[3]))
group <- unlist(lapply(str.s, function(x) x[4]))
track <- unlist(lapply(str.s, function(x) x[5]))
table <- unlist(lapply(str.s, function(x) x[6]))
downloadPath <- paste0("https://gwips.ucc.ie/downloads/",unlist(lapply(str.s, function(x) x[7])))
bwEpitransPath <- paste0("/home/labs/schwartzlab/Collaboration/databases/GWIPS/",
                         assembly,"/",table, ".bw")

gwips.key.txt <- fread("~/tmp/GWIPS/get_gwips_text.txt", header=F, sep="\t")
gwips.key.txt.n <- gsub("https://gwips.ucc.ie/downloads/","",gwips.key.txt$V1)

str.s2 <- lapply(gwips.key.txt.n, function(x) strsplit(x,"__")[[1]])

download.key <- unlist(lapply(str.s2, function(x) x[8]))
match.index <- match(download.key, unlist(lapply(str.s, function(x) x[7])))
to.remove <- grep("download.php\\?tableName\\=all\\&",download.key)

str.s3 <- str.s2[-to.remove]
clade.text <- unlist(lapply(str.s3, function(x) x[2]))
genome.text <- unlist(lapply(str.s3, function(x) x[3]))
assembly.text <- unlist(lapply(str.s3, function(x) x[4]))
group.text <- unlist(lapply(str.s3, function(x) x[5]))
track.text <- unlist(lapply(str.s3, function(x) x[6]))
table.text <- unlist(lapply(str.s3, function(x) x[7]))


gwips.key <- data.table(clade=clade,
                        genome=genome,
                        assembly=assembly,
                        group=group,
                        track=track,
                        table=table,
                        clade.text=clade.text,
                        genome.text=genome.text,
                        assembly.text=assembly.text,
                        group.text=group.text,
                        track.text=track.text,
                        table.text=table.text,
                        downloadLink=downloadPath,
                        bwEpitransPath=bwEpitransPath)
View(gwips.key)

fwrite(gwips.key, "~/tmp/GWIPS/GWIPS_key.csv",row.names = F, sep=",")
