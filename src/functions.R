rename_data <- function(dt) {
  setnames(
    dt,
    c("gender", "race", "parent_edu", "lunch", "prep_course",
      "math_sc", "reading_sc", "writing_sc")
  )
  dt
}

fit_model <- function(dt) {
  model <- lm(reading_sc ~ writing_sc, exams) 
  moedl$coefficients
}

plot_model <- function(model, dt) {
  ggplot(dt) +
    geom_point(aes(x = Temp, y = Ozone)) +
    geom_abline(intercept = model[1], slope = model[2])
}