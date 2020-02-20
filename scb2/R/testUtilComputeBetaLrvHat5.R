testUtilComputeBetaLrvHat5 <- function(sample,
                                       lag,
                                       tParArray,
                                       diagOrHoriz,
                                       typeOfKernel) {

  cat("\n Testing \'tests_scb2_213_computeBetaLrvHat5\' \n")

  cat("\nTest parameters:", "\n")
  cat("sample =", sample, "\n")
  cat("lag =", lag, "\n")
  cat("tParArray =", tParArray, "\n")
  cat("diagOrHoriz =", diagOrHoriz, "\n")
  cat("typeOfKernel =", typeOfKernel, "\n")

  Start <- Sys.time()

  betaLRVHat <- computeBetaLrvHat5(
    sample = sample,
    lag = lag,
    tParArray = tParArray,
    diagOrHoriz = diagOrHoriz,
    typeOfKernel = typeOfKernel
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  expect_that(betaLRVHat , is_a("array"))
  testUtilObjectSize(betaLRVHat)

  cat("betaLRVHat =", betaLRVHat, "\n")
  cat("End of test computeBetaLrvHat5", "\n")
  cat("=====================\n")
}
