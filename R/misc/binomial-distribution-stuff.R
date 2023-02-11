n <- 10^4
p <- 10^(-3)

# Calculate expected value of binomial distribution with n and p with sum
vector <- 0:n
expected <- sum(vector * dbinom(vector, n, p))
expected

# Same as above
expected <- n * p
expected

points <- c(0:20)

# Plot to see that expected value is the highest point
plot(
    points,
    dbinom(points, n, p),
    type = "h",
    col = "black",
    lwd = 10
)

# Calculate mode of binomial distribution with n and p
mode <- floor((n + 1) * p)

# Approximate expected value of binomial distribution
# with poisson distribution with lambda = n * p
expected <- sum(0:n * dpois(0:n, n * p))
expected

# Calculate X=0, X=2, X=10
dpois(0, n * p)
dpois(2, n * p)
dpois(10, n * p)

# Plot to see that it's pretty much the same
plot(
    points,
    dpois(points, n * p),
    type = "h",
    col = "black",
    lwd = 10
)

