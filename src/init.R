# Basics -----------------------------------------------------------------------
library(okutools)

proj_name <- list.files(".", pattern = "*.Rproj") %>% 
  stringr::str_replace("\\.Rproj", "")


# Prepare data/processed -------------------------------------------------------
proc_data_physdir <- file.path(data_path(proj_name), "processed")
dir.create(proc_data_physdir, recursive = T, showWarnings = FALSE)

procdata_dest <- "./data/processed"
R.utils::createLink(link = procdata_dest,
                    target = proc_data_physdir)


# Prepare output ---------------------------------------------------------------
output_physdir <- file.path(data_path(proj_name), "output")
dir.create(output_physdir, showWarnings = FALSE)

output_dest <- "./data/output"
R.utils::createLink(link = output_dest,
                    target = output_physdir)



rm(proc_data_physdir, procdata_dest,
   output_dest, output_physdir, proj_name)
