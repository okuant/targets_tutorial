# Load packages required to define the pipeline:
library(targets)
library(tarchetypes)
library(data.table)
library(magrittr)

# Set target options:
tar_option_set(
  packages = c("ggplot2", "quarto"), # packages that your targets need to run
  format = "rds"                     # default storage format
)

# Load the R scripts with your custom functions:
source("src/functions.R")
# Or source everything in src/ folder:
# lapply(list.files("src", full.names = TRUE, recursive = TRUE), source)

# Define sub-pipeline (input)
input_pl <- list(
  tar_target(exams_file, "data/raw/exams.csv", format = "file"),
  
  tar_target(
    exams,
    exams_file %>% 
      fread() %>% 
      rename_data()
  )
)

# Parameters for mapping
values <- data.table(
  names = c("ab", "nointercept"),
  fit_function = rlang::syms(c("fit_model", "fit_model_no_incpt")),
  fit_line_color = c("red", "green")
)

# Define sub-pipeline (main)
main_pl <- tar_map(
  values = values,
  names = names,
  
  tar_target(
    model,
    fit_function(exams)
  ),
  
  tar_target(
    plot,
    plot_model(exams, model, fit_line_color)
  )
)

# Output: concatenate sub-pipelines
c(
  input_pl,
  main_pl
)
