testUtilComputeAndSaveTrueBetaLRVAndBetaLRVHat <- function(sampleSize,
                                                           tParCount,
                                                           lag,
                                                           betaLRVHatCount,
                                                           sigma,
                                                           mean,
                                                           noise,
                                                           type,
                                                           typeOfKernel,
                                                           diagOrHoriz) {

  cat("\n Testing \'tests_scb2_203_computeAndSaveTrueBetaLRVAndBetaLRVHat\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("lag =", lag, "\n")
  cat("betaLRVHatCount =", betaLRVHatCount, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("noise =", noise, "\n")
  cat("type =", type, "\n")
  cat("typeOfKernel = ", typeOfKernel, "\n")
  cat("diagOrHoriz =", diagOrHoriz, "\n")

  Start <- Sys.time()

  betaLRVAndLRVHats <- computeAndSaveTrueBetaLRVAndBetaLRVHat(
      sampleSize = sampleSize,
      tParCount = tParCount,
      lag = lag,
      betaLRVHatCount = betaLRVHatCount,
      sigma = sigma,
      mean = mean,
      noise = noise,
      type = type,
      typeOfKernel = typeOfKernel,
      diagOrHoriz = diagOrHoriz
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test computeAndSaveTrueBetaLRVAndBetaLRVHat", "\n")
  cat("=====================\n")
}
