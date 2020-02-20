testUtilComputeMEbyCovHat5 <- function(tParArray,
                                       lag,
                                       sample,
                                       nonCoverageProbability,
                                       diagOrHoriz,
                                       typeOfKernel) {

  cat("\n Testing \'tests_scb2_214_computeMEbyCovHat5\' \n")

  cat("\nTest parameters:", "\n")
  cat("tParArray =", tParArray, "\n")
  cat("lag =", lag, "\n")
  cat("sample =", sample, "\n")
  cat("nonCoverageProbability =", nonCoverageProbability, "\n")
  cat("diagOrHoriz =", diagOrHoriz, "\n")
  cat("typeOfKernel =", typeOfKernel, "\n")

  Start <- Sys.time()

  parList <- list(isTrueLRV = T,
                  factorType = "NRF")

  ME <- computeMEbyCovHat5(
    tParArray = tParArray,
    lag = lag,
    sample = sample,
    nonCoverageProbability = nonCoverageProbability,
    diagOrHoriz = diagOrHoriz,
    typeOfKernel = typeOfKernel,
    parList = parList
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  expect_that(ME , is_a("array"))
  testUtilObjectSize(ME)

  cat("ME =", ME, "\n")
  cat("End of test computeMEbyCovHat5", "\n")
  cat("=====================\n")
}
