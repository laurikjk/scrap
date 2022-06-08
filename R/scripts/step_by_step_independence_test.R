#!/usr/bin/env Rscript

# Parse command line arguments
args <- commandArgs(trailingOnly = TRUE)
vargs <- strsplit(args, ",")
matrix_as_vector <- as.numeric(vargs[[1]])
rowcount <- as.numeric(vargs[[2]])

matrix <- matrix(matrix_as_vector, nrow = rowcount, byrow = TRUE)

# Sums
row_sums <- rowSums(matrix)
col_sums <- colSums(matrix)
sum_of_all <- sum(row_sums)

# Create a matrix of expected frequencies

es_fun <- function(x, y) {
  return(
    (x * y) / sum_of_all
  )
}
es <- outer(row_sums, col_sums, FUN = es_fun)
es_as_vector <- as.vector(t(es))

# Test statistic

ts_fun <- function(x, y) {
  return(
    ((x - y) ^ 2) / y
  )
}

applied <- mapply(ts_fun, matrix_as_vector, es_as_vector)

TS <- sum(mapply(ts_fun, matrix_as_vector, es_as_vector))

# p-value

pvalue <- 1 - pchisq(TS, df = (nrow(matrix) - 1) * (ncol(matrix) - 1))


# Test null hypothesis
reject_10_percent <- pvalue < 0.1
reject_5_percent <- pvalue < 0.05
reject_1_percent <- pvalue < 0.01



list(
    matrix = matrix,
    row_sums = row_sums,
    col_sums = col_sums,
    sum_of_all = sum_of_all,
    es = es,
    applied = applied,
    TS = TS,
    pvalue = pvalue,
    reject_10_percent = reject_10_percent,
    reject_5_percent = reject_5_percent,
    reject_1_percent = reject_1_percent
)
