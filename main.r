#' For template use only. Uncomment or delete.
#' devtools::install_bitbucket(
#'   "okuanters/okutools",
#'   auth_user = rstudioapi::askForPassword("Bitbucket username"),
#'   password = rstudioapi::askForPassword("Bitbucket password")
#' )

#' Usual libraries. Uncomment or delete
# library(okutools)
# library(data.table)
# library(ggplot2)

#' Run once to populate your project/data/raw folder.
#' Uncomment or delete.
#' files <- c(
#'   "example.csv",
#'   "another_example.RDS",
#'   exp_inmuebles.RDS
#'  )
#' dest <- "./data/raw"
#' target <- "path/to/your/DATA/"
#' lapply(files, function(f) R.utils::createLink(link = paste0(dest, f), target = paste0(target, f)))
#' rm(files, dest, target)
