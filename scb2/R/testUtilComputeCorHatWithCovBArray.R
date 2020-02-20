testUtilComputeCorHatWithCovBArray <- function(tParArray,
                                               sample,
                                               lag,
                                               diagOrHoriz) {
  cat("\n Testing \'tests_scb2_207_computeCorHatWithCovBArray\' \n")

  cat("\nTest parameters:", "\n")
  cat("tParArray =", tParArray, "\n")
  cat("sample =", sample, "\n")
  cat("lag =", lag, "\n")
  cat("diagOrHoriz =", diagOrHoriz, "\n")

  Start <- Sys.time()

  corHat <- computeCorHatWithCovBArray(tParArray = tParArray,
                                       sample = sample,
                                       lag = lag,
                                       diagOrHoriz = diagOrHoriz)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", corHat, "\n")

  cat("End of test computeCorHatWithCovBArray", "\n")
  cat("=====================\n")
}
