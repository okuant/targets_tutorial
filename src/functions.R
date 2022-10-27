rename_data <- function(dt) {
  setnames(
    dt,
    c("gender", "race", "parent_edu", "lunch", "prep_course",
      "math_sc", "reading_sc", "writing_sc")
  )
  dt
}
