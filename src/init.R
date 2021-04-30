# Basics -----------------------------------------------------------------------
library(okutools)

proj_name <- list.files(".", pattern = "*.Rproj") %>% 
  stringr::str_replace("\\.Rproj", "")

# Populate data/raw ------------------------------------------------------------
unlist_configs <- list.files(path = "./cfg", ".yml", full.names = T) %>%
  purrr::map(yaml::yaml.load_file, eval.expr = F) %>%
  unlist %>% 
  suppressWarnings

matches_with_file_path <- unlist_configs %>%
  names %>%
  stringr::str_which("input_file_path")

input_files <- unlist_configs[matches_with_file_path] %>% 
  unique %>% 
  basename

data_path_files <- list.files(data_path(), recursive = TRUE)

paths_to_link_matches <- lapply(
  input_files,
  function(f) stringr::str_subset(
    pattern = paste0("/", f),
    string = data_path_files
  ))
no_match <- sapply(paths_to_link_matches, length) == 0
if (any(no_match)) {
  warning("No matching files found for: ",
          paste(input_files[no_match], collapse = ", ")
  )
}

paths_to_link <- paths_to_link_matches %>%
  unlist %>%
  data_path() %>%
  file.info() %>%
  data.table::as.data.table(keep.rownames = "file_path") %>%
  .[, `:=`(file_name = basename(file_path))] %>%
  .[, N := .N, file_name] %>%
  data.table::setorder(-N, file_name, -mtime) %>%
  .[] %>% 
  .[, first(.SD), file_name] %>% 
  .[["file_path"]]

rm(input_files, matches_with_file_path, data_path_files, unlist_configs,
   paths_to_link_matches, no_match)

# Setup raw ---------------------------------------------------------------
dataraw_link_dir <- "./data/raw"
dir_content <- list.files(dataraw_link_dir, full.names = T)
symlink_filter <- dir_content %>%
  Sys.readlink %>% 
  stringr::str_length() > 0
dir_content[symlink_filter] %>%
  file.remove

lapply(paths_to_link,
       function(f) R.utils::createLink(link = file.path(dataraw_link_dir,
                                                        basename(f)),
                                       target = f))

# Prepare data/processed -------------------------------------------------------
proc_data_physdir <- file.path(data_path(proj_name), "processed")
dir.create(proc_data_physdir, recursive = T, showWarnings = FALSE)

procdata_dest <- "./data/processed"
file.remove(procdata_dest)
R.utils::createLink(link = procdata_dest,
                    target = proc_data_physdir)


# Prepare output ---------------------------------------------------------------
output_physdir <- file.path(data_path(proj_name), "output")
dir.create(output_physdir, showWarnings = FALSE)

output_dest <- "./data/output"
file.remove(output_dest)
R.utils::createLink(link = output_dest,
                    target = output_physdir)



rm(dataraw_link_dir, proc_data_physdir, procdata_dest,
   output_dest, output_physdir, proj_name, paths_to_link,
   dir_content, symlink_filter)
