# Populate data/raw -----------------------------------------------------------------------------------------------
#' Run once to populate your project/data/raw folder with symbolic links to files required
#' by your project, which physically are en your synchronized OneDrive folder.
#' Don't forget to change path to this
#' Uncomment or delete.
files <- c(
  "example.csv",
  "another_example.RDS",
  exp_inmuebles.RDS
 )
dest <- "./data/raw"
target <- "path/to/your/DATA/"
lapply(files, function(f) R.utils::createLink(link = paste0(dest, f),
                                              target = paste0(target, f)))
rm(files, dest, target)
