# Load packages required to define the pipeline:
library(targets)
library(tarchetypes)
library(data.table)
library(magrittr)

# Set target options:
tar_option_set(
  packages = c("ggplot2"), # packages that your targets need to run
  format = "RDS"            # default storage format
)

# tar_make_clustermq() configuration (okay to leave alone):
#options(clustermq.scheduler = "multiprocess")

# Load the R scripts with your custom functions:
lapply(list.files("src", full.names = TRUE, recursive = TRUE), source)


input_pl <- list(
  tar_target(exams_file, "data/raw/exams.csv", format = "file")
)

main_pl <- list(
  tar_target(exams,
             exams_file %>% 
               fread() %>% 
               rename_data()
  )
)