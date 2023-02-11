EV <- 5 # EV = 1 / rate, EV given
x <- seq(0, 40, 0.1)
y <- dexp(x, rate=1/EV)


plot(x, y, type="h", xlab="x", ylab="y", main="Exponential Distribution")

# Cumulative distribution function
pexp(x, rate=1/EV)

# Probability of x being greater than 4
1 - pexp(4, rate=1/EV)

# Probability of x being 10 to 14
pexp(14, rate=1/EV) - pexp(10, rate=1/EV)