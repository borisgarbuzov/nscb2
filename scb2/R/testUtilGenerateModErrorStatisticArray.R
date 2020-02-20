testUtilGenerateModErrorStatisticArray <- function(
  sampleSize,
  tParCount,
  replicationCount,
  lag,
  sigma,
  mean
) {

  cat("\n Testing \'tests_scb2_229_generateModErrorStatisticArray\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("lag =", lag, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")

  Start <- Sys.time()

  modErrorStatisticArray <-
    generateModErrorStatisticArray(
      sampleSize = sampleSize,
      tParCount = tParCount,
      replicationCount = replicationCount,
      lag = lag,
      sigma = sigma,
      mean = mean
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", modErrorStatisticArray, "\n")

  cat("End of test generateModErrorStatisticArray", "\n")
  cat("=====================\n")
}
