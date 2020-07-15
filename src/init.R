# Basics ----------------------------------------------------------------------------------------------------------
library(okutools)

proj_name <- list.files(".", pattern = "*.Rproj")
proj_name <- gsub("\\.Rproj", "", proj_name)

data_path <- Sys.getenv("DATA_PATH")

# Populate data/raw -----------------------------------------------------------------------------------------------
configs <- purrr::map(
  list.files(path = "./cfg", ".yml", full.names = T),
  load_config
)
configs <- purrr::map(
  configs,
  `$`, get
)

files <- purrr::invoke_map(configs, "datasets")
files <- unlist(files)
files <- unique(files)

dataraw_link_dir <- "./data/raw"
lapply(files, function(f) R.utils::createLink(link = file.path(dataraw_link_dir, f),
                                              target = file.path(data_path, f)))


# Prepare data/processed ------------------------------------------------------------------------------------------
proc_data_physdir <- file.path(data_path, proj_name, "processed_data")
dir.create(proc_data_physdir, recursive = T, showWarnings = FALSE)

procdata_dest <- "./data/processed"
R.utils::createLink(link = procdata_dest,
                    target = proc_data_physdir)
# Alt
# file.symlink(from = proc_data_physdir,
#              to = procdata_dest)
# Test
# saveRDS(proc_data_physdir, "data/processed/proc_data_physdir.RDS")


# Prepare output --------------------------------------------------------------------------------------------------
output_physdir <- file.path(data_path, proj_name, "output")
dir.create(output_physdir, recursive = T, showWarnings = FALSE)

output_dest <- "./output"
R.utils::createLink(link = output_dest,
                    target = output_physdir)
# Test
# saveRDS(proc_data_physdir, "output/proc_data_physdir.RDS")



rm(configs, files, dataraw_link_dir, proc_data_physdir, procdata_dest)


