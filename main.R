library(targets)

# Run pipeline
tar_make()

# Inspect pipeline
tar_manifest()

tar_visnetwork()
tar_visnetwork(targets_only = TRUE)

# Get results
tar_read(model)
# tar_load(model) loads model with the same variable name

tar_read(plot)
