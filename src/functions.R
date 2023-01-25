rename_data <- function(dt) {
  setnames(
    dt,
    c("gender", "race", "parent_edu", "lunch", "prep_course",
      "math_sc", "reading_sc", "writing_sc")
  )
  dt
}

fit_model <- function(dt) {
  stopifnot(c("reading_sc", "writing_sc") %in% names(dt))
  model <- lm(reading_sc ~ writing_sc, dt) 
  model
}

fit_model_no_incpt <- function(dt) {
  stopifnot(c("reading_sc", "writing_sc") %in% names(dt))
  model <- lm(reading_sc ~ writing_sc - 1, dt) 
  model
}

plot_model <- function(dt, model, fit_line_color) {
  coefs <- model$coefficients
  incpt <- if (length(coefs) == 2) coefs[1] else 0
  slope <- if (length(coefs) == 2) coefs[2] else coefs
  
  ggplot(dt) +
    geom_point(aes(x = writing_sc, y = reading_sc)) +
    geom_abline(intercept = incpt, slope = slope,
                color = fit_line_color) 
}