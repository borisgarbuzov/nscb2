testUtilQuantileCrossValidationTest <- function(sampleSize,
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
  sample2 = generateModErrorStatisticArray(sampleSize, tParCount, replicationCount, lag, sigma, mean)

  cat("Test parameters:", "\n")

  cat("sampleSize = ", sampleSize, "\n")
  cat("tParCount = ", tParCount, "\n")
  cat("replicationCount = ", replicationCount, "\n")
  cat("lag = ", lag, "\n")
  cat("sigma = ", sigma, "\n")
  cat("mean = ", mean, "\n")
  cat("p = ", p, "\n\n")

  printInfoAboutTwoSamples(sample1, sample2)

  cat("sample1 = ", sample1, "\n")
  cat("sample2 = ", sample2, "\n")

  cat("=====================\n")

  # 3. Compute q1 = quantile(ч=sample1, p=p), q2 = quantile(ч=sample2, p=p)

  q1 = quantile(x=sample1, probs=p)
  cat("q1 = ", q1, "\n")

  q2 = quantile(x=sample2, probs=p)
  cat("q2 = ", q2, "\n")

  # 4. Find the cross p levels. p1 = уcdf(sample=sample1, q=q2), p2 = cуdf(sample=sample2, q=q1)

  p1Sample = ecdf(sample1)
  p2Sample = ecdf(sample2)
  p1 = p1Sample(q2)
  p2 = p2Sample(q1)
  cat("p1(q2) = ", p1, "\n")
  cat("p2(q1) = ", p2, "\n")

  # 5. Compare (p-p1), (p-p2), (q1-q2).

  cat("p - p1 = ", p - p1, "\n")
  cat("p - p2 = ", p - p2, "\n")
  cat("q1 - q2 = ", q1 - q2, "\n")

  End <- Sys.time()

  duration <- End - Start

  cat("Duration =", duration, "\n")
  cat("End of test testUtilQuantileCrossValidationTest","\n")
  cat("=====================\n")
}
