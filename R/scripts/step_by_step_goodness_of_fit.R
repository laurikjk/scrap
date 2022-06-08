#!/usr/bin/env Rscript

# Parse command line arguments
args <- commandArgs(trailingOnly = TRUE)
vargs <- strsplit(args, ",")
Ns <- as.numeric(vargs[[1]]) # Actual portions
expected_portions <- as.numeric(vargs[[2]]) # Expected portions

# Sample size
n <- sum(Ns)

# Number of groups
k <- length(Ns)

# Expected frequencies
es <- sapply(expected_portions, function(x) return(n * x))

# Test statistic
ts_fun <- function(x, y) {
  return(
    ((x - y) ^ 2) / y
  )
}

TS <- sum(mapply(ts_fun, Ns, es))

# p-value
pvalue <- 1 - pchisq(TS, df = k - 1)

# H_0 expected_portions = Ns
# H_1 expected_portions != Ns
reject_10_percent <- pvalue < 0.1
reject_5_percent <- pvalue < 0.05
reject_1_percent <- pvalue < 0.01

list(
  n = n,
  k = k,
  es = es,
  TS = TS,
  pvalue = pvalue,
  reject_10_percent = reject_10_percent,
  reject_5_percent = reject_5_percent,
  reject_1_percent = reject_1_percent
)
