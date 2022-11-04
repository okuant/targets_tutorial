# Load packages required to define the pipeline:
library(targets)
library(tarchetypes)
library(data.table)
library(magrittr)

# Set target options:
tar_option_set(
  packages = c("ggplot2"), # packages that your targets need to run
  format = "rds"           # default storage format
)

# Load the R scripts with your custom functions:
source("src/functions.R")
# Or source everything in src/ folder:
# lapply(list.files("src", full.names = TRUE, recursive = TRUE), source)

# Define sub-pipeline (input)
input_pl <- list(
  tar_target(exams_file, "data/raw/exams.csv", format = "file")
)

# Define sub-pipeline (main)
main_pl <- list(
  tar_target(
    exams,
    exams_file %>% 
      fread() %>% 
      rename_data()
  ),
  
  tar_target(
    model,
    fit_model(exams)
  ),
  
  tar_target(
    plot,
    plot_model(exams, model)
  )
)

# Output: concatenate sub-pipelines
c(
  input_pl,
  main_pl
)
