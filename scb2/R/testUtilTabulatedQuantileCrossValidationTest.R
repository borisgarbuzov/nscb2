# считает табулированную quantile для sample=generateModErrorStatisticArray(...)
testUtilTabulatedQuantileCrossValidationTest <- function(sampleSize,
                                                         tParCount,
                                                         replicationCount,
                                                         lag,
                                                         sigma,
                                                         mean,
                                                         p)
{
  # cat("\nTesting \'tests_scb2_241_testUtilQuantileCrossValidationTest\' \n")

  Start <- Sys.time()

  # New scenario
  # 1. Generate two samples, sample1, sample2. Any distribution, for now not necessarily ours.
  sample1 = generateModErrorStatisticArray(sampleSize, tParCount, replicationCount, lag, sigma, mean)

  cat("Test parameters:", "\n")

  cat("sampleSize = ", sampleSize, "\n")
  cat("tParCount = ", tParCount, "\n")
  cat("replicationCount = ", replicationCount, "\n")
  cat("lag = ", lag, "\n")
  cat("sigma = ", sigma, "\n")
  cat("mean = ", mean, "\n")
  cat("p = ", p, "\n")
  cat("sample1 \n")

  cat("=====================\n")

  # 3. Compute q1 = quantile(ч=sample1, p=p), q2 = quantile(ч=sample2, p=p)

  q1 = quantile(x=sample1, probs=p)
  cat("q1 = ", q1, "\n")

  q2 = getTabulatedQuantile(sampleSize = sampleSize, nonCoverageProbability=p)

  # 4. Find the cross p levels. p1 = уcdf(sample=sample1, q=q2), p2 = cуdf(sample=sample2, q=q1)

  p1Sample = ecdf(sample1)
  p1 = p1Sample(q2)
  cat("p1(q2) = ", p1, "\n")

  # 5. Compare (p-p1), (p-p2), (q1-q2).

  cat("p - p1 = ", p - p1, "\n")
  cat("q1 - q2 = ", q1 - q2, "\n")

  End <- Sys.time()

  duration <- End - Start

  cat("Duration =", duration, "\n")

  res <- c(sampleSize, replicationCount, p-p1, q1-q2, duration)
  return(res)

  cat("End of test testUtilQuantileCrossValidationTest","\n")
  cat("=====================\n")
}
