#!/usr/bin/env Rscript

# Parse command line arguments

args <- commandArgs(trailingOnly = TRUE)
vargs <- strsplit(args, ",")
xs <- as.numeric(vargs[[1]])
ys <- as.numeric(vargs[[2]])

# Calculate means

x_mean <- mean(xs)
y_mean <- mean(ys)

# Size of data

n <- length(xs)

S_xx <- sum(
  sapply(
    xs,
    function(x) x^2
  )
) - n * x_mean^2

S_xy <- sum(
  mapply(
    function(x, y) x * y,
    xs,
    ys
  )
) - n * x_mean * y_mean

S_yy <- sum(
  sapply(
    ys,
    function(y) y^2
  )
) - n * y_mean^2

SS_R <- (S_xx * S_yy - S_xy^2) / S_xx

beta_est <- S_xy / S_xx

variance_param <- SS_R / (n - 2)

alpha_est <- y_mean - beta_est * x_mean

coeff_of_determination <- (S_yy - SS_R) / S_yy

TS <- sqrt(
  ((n - 2) * S_xx) / SS_R
) * beta_est

list(
  n = n,
  y_mean = y_mean,
  x_mean = x_mean,
  S_xx = S_xx,
  S_xy = S_xy,
  S_yy = S_yy,
  SS_R = SS_R,
  beta_est = beta_est,
  variance_param = variance_param,
  alpha_est = alpha_est,
  coeff_of_determination = coeff_of_determination,
  TS = TS
)
