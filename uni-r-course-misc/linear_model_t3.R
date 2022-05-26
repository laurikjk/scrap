years <- c(1982, 1984, 1988, 1990, 1994, 1996, 1998, 2000, 2002) - 1982
portions <- c(33.1, 31.8, 30.4, 24.3, 26.3, 27.7, 26.3, 25.3, 24.8)

# Calculate estimate for variance parameter

years_mean <- mean(years)
portions_mean <- mean(portions)

n <- length(years)


S_xx <- sum(
  sapply(
    years,
    function(x) x^2
  )
) - n * years_mean^2

S_xy <- sum(
  mapply(
    function(x, y) x * y,
    years,
    portions
  )
) - n * years_mean * portions_mean

S_yy <- sum(
  sapply(
    portions,
    function(y) y^2
  )
) - n * portions_mean^2

SS_R <- (S_xx * S_yy - S_xy^2) / S_xx

beta_est <- S_xy / S_xx

variance_param <- SS_R / (n - 2)

alpha_est <- portions_mean - beta_est * years_mean

year_1997_est <- alpha_est + beta_est * (1997 - 1982)

portions_mean
years_mean
S_xx
S_xy
S_yy
SS_R
beta_est
n
variance_param
alpha_est
year_1997_est