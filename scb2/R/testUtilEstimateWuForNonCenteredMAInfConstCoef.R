testUtilEstimateWuForNonCenteredMAInfConstCoef <- function(size,
                                                           psi,
                                                           psiMaxSize,
                                                           sigma,
                                                           mean) {
  cat("\nTesting \'tests_45a_estimateWuForNonCenteredMAInfConstCoef\' \n")

  Start <- Sys.time()

  original <- createOriginalMAInfConstCoef(size = size,
                                           sigma = sigma,
                                           mean = mean,
                                           psi = psi,
                                           psiMaxSize = psiMaxSize,
                                           psiIncrement = FALSE)
  lvr <- estimateLRVWu2009(sample = original,
                           type = "nonCentered")

  End <- Sys.time()

  duration <- End - Start

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("psiMaxSize =", psiMaxSize, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("original =", original[1:5], "\n")

  cat("Result:\n")
  cat("lvr =", lvr, "\n")

  cat("Duration =", duration, "\n")

  testUtilObjectSize(lvr)

  cat("End of test estimateWuForNonCenteredMAInfConstCoef","\n")
  cat("=====================\n")

}
