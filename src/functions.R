rename_data <- function(dt) {
  setnames(
    dt,
    c("gender", "race", "parent_edu", "lunch", "prep_course",
      "math_sc", "reading_sc", "writing_sc")
  )
  dt
}

fit_model <- function(dt) {
  model <- lm(reading_sc ~ writing_sc, dt) 
  model
}

plot_model <- function(dt, model) {
  ggplot(dt) +
    geom_point(aes(x = writing_sc, y = reading_sc)) +
    geom_abline(intercept = model$coefficients[1], slope = model$coefficients[2],
                color = "red") 
}