require(combinat)

# combinations of 2 from 4
dim(combn(4,2))[2]

# permutations of 3
length(permn(3))

###########################################################################

# Normal distribution X ∼ N(4,5, 0,7^2)
pnorm(5, mean = 4.5, sd = 0.7, lower.tail = FALSE) # P(X > 5)
pnorm(4, mean = 4.5, sd = 0.7, lower.tail = TRUE) # P(X < 4)

# Same thing as standard normal distribution
pnorm(
  (5-4.5) / 0.7,
  mean = 0,
  sd = 1,
  lower.tail = FALSE
)

pnorm(
  (4-4.5) / 0.7,
  mean = 0,
  sd = 1,
  lower.tail = TRUE
)

###########################################################################

# given P(X < 180 000) = P(X > 320 000) = 0,25
# calculate mean and sd

# Because normal distribution is symmetric
# mean is in the middle of the two.

mean = 180000 + (320000 - 180000) / 2

# calculate standard deviation sd
# P(X > 320 000) = 0,25
# => P(Z <= (320 000 - mean) / sd ) = 1 - 0.25 = 0.75

sd = (320000 - mean) / qnorm(0.75)

# calculate P(260 000 < X < 300 000) when P(X < 180 000) = P(X > 320 000) = 0,25
# P((260 000 − 250 000) / 104 000 < (X − 250 000) / 104 000 < (300 000 − 250 000) / 104 000)
# => P (10/104 < Z < 50/104)

pnorm(50/104) - pnorm(10/104)


###########################################################################

# a) X ~ Binom(75, 300, 0.252)
# b) Approximate P(X >= 75) X ~ N(0,1)

# a)
1 - pbinom(75-1, 300, 0.252)

# b)
n = 74.5
size = 300
prob = 0.252

mu = size*prob
variance = size*prob*(1-prob)
sd = sqrt(variance)
q = (n-mu)/sd

# 1 - pnorm(q) because q is neqative

1 - pnorm(q)

###########################################################################

x = 87     # : amount of _ we're looking for in sample
n = 600    # : sample size
N = 12048  # : population

# Unbiased estimator
p = x/n

# Estimate of the amount of _ in the whole population

N*p

# Standard error of an (unbiased) estimator

sdp = sqrt(p*(1-p)/n)
sdp

# Amount of standard error

N*sdp 








