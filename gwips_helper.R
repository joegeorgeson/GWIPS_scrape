library(data.table)
library(fs)

GWIPS.dir <- "~/GWIPS/data/"
out.dir <- "~/GWIPS/db/"

bw.files <- list.files(GWIPS.dir, pattern="download.php")
bw.files.n <- gsub("download.php[?]","", bw.files)

bw.files.assembly <- unlist(lapply(bw.files.n, function(x) strsplit(x, "assemblyName=")[[1]][2]))

bw.files.assembly.1 <- unlist(lapply(bw.files.n, function(x) strsplit(x, "&assemblyName=")[[1]][1]))
bw.files.table <- unlist(lapply(bw.files.assembly.1, function(x) strsplit(x, "tableName=")[[1]][2]))

GWIPS.dt <- data.table(init.path=bw.files,assembly=bw.files.assembly,
                       table=bw.files.table)

bw.files.table.s <- split(GWIPS.dt, GWIPS.dt$assembly)

for(i in 1:length(bw.files.table.s)){
  this.dir <- paste0(out.dir, names(bw.files.table.s)[i])
  this.dat <- bw.files.table.s[[i]]

  if(!dir.exists(this.dir)){
    dir.create(this.dir)
  }

  old.path <- paste0(GWIPS.dir,"/", this.dat$init.path)
  new.path <- paste0(this.dir,"/", this.dat$table, ".bw")

  fs::file_copy(old.path, new.path, overwrite=T)
}
