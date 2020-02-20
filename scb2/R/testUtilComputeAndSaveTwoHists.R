testUtilComputeAndSaveTwoHists <- function(
  sampleSize,
  tParCount,
  replicationCount,
  lag,
  sigma,
  mean
) {

  cat("\n Testing \'tests_scb2_228_computeAndSaveTwoHists\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("lag =", lag, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")

  Start <- Sys.time()

  twoHist <-
    computeAndSaveTwoHists(
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
  cat("result =", twoHist, "\n")

  cat("End of test computeAndSaveTwoHists", "\n")
  cat("=====================\n")
}
