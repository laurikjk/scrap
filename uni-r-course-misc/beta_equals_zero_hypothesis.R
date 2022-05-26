
heights_and_salaries <- c(
# Height, Salary
  183, 100,
  160, 92,
  196, 106,
  186, 92,
  195, 109,
  182, 101,
  208, 116,
  169, 96,
  166, 94,
  198, 101,
  145, 93,
  168, 96
)

heights <- heights_and_salaries[c(TRUE, FALSE)]
salaries <- heights_and_salaries[c(FALSE, TRUE)]

heights_mean <- mean(heights)
salaries_mean <- mean(salaries)

n <- length(heights)


S_xx <- sum(
  sapply(
    heights,
    function(x) x^2
  )
) - n * heights_mean^2

S_xy <- sum(
  mapply(
    function(x, y) x * y,
    heights,
    salaries
  )
) - n * heights_mean * salaries_mean

S_yy <- sum(
  sapply(
    salaries,
    function(y) y^2
  )
) - n * salaries_mean^2

SS_R <- (S_xx * S_yy - S_xy^2) / S_xx

beta_est <- S_xy / S_xx

TS <- sqrt(
  ((n - 2) * S_xx) / SS_R
) * beta_est

p <- 2*pt(TS, df = (n - 2))

salaries_mean
heights_mean
S_xx
S_xy
S_yy
SS_R
beta_est
TS
p






