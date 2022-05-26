years <- c(1994, 1996, 1998, 2000, 2002, 2004, 2005, 2007, 2009)
points <- c(504, 508, 512, 514, 516, 518, 520, 515, 515)

# Calculate estimate for variance parameter

years_mean <- mean(years)
points_mean <- mean(points)

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
    points
  )
) - n * years_mean * points_mean

S_yy <- sum(
  sapply(
    points,
    function(y) y^2
  )
) - n * points_mean^2

SS_R <- (S_xx * S_yy - S_xy^2) / S_xx

beta_est <- S_xy / S_xx

variance_param <- SS_R / (n - 2)

alpha_est <- points_mean - beta_est * years_mean

year_1997_est <- alpha_est + beta_est * 1997
year_2006_est <- alpha_est + beta_est * 2006
year_2008_est <- alpha_est + beta_est * 2008


points_mean
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
year_2006_est
year_2008_est
