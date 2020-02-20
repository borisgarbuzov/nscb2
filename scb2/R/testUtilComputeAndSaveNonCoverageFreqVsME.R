testUtilComputeAndSaveNonCoverageFreqVsME <- function(sampleSize,
                                                      tParCount,
                                                      replicationCount,
                                                      meMin,
                                                      meMax,
                                                      meStep,
                                                      sigma,
                                                      mean,
                                                      lag) {

  cat("\n Testing \'tests_scb2_226_computeAndSaveNonCoverageFreqVsME\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("meMin =", meMin, "\n")
  cat("meMax =", meMax, "\n")
  cat("meStep =", meStep, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("lag =", lag, "\n")

  Start <- Sys.time()

  coverageFreqVsME <-
    computeAndSaveNonCoverageFreqVsME(
      sampleSize = sampleSize,
      tParCount = tParCount,
      replicationCount = replicationCount,
      meMin = meMin,
      meMax = meMax,
      meStep = meStep,
      sigma = sigma,
      mean = mean,
      lag = lag
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", coverageFreqVsME, "\n")

  cat("End of test computeAndSaveNonCoverageFreqVsME", "\n")
  cat("=====================\n")
}
