testUtilComputeBetaMatrixColumnHat <- function(sample,
                                               lag,
                                               tPar,
                                               bandWidthPowerForGamma){
  cat("\n Testing \'tests_scb2_175_computeBetaMatrixColumnHat\ \n")

  cat("\nTest parameters:", "\n")
  cat("sample = ", sample, "\n")
  cat("lag = ", lag, "\n")
  cat("tPar = ", tPar, "\n")
  cat("bandWidthPowerForGamma = ", bandWidthPowerForGamma, "\n")

  Start <- Sys.time()

  betaColumn <- computeBetaMatrixColumnHat(sample = sample,
                                           lag = lag,
                                           tPar = tPar,
                                           bandWidthPowerForGamma = bandWidthPowerForGamma)

  End <- Sys.time()
  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  expect_that(betaColumn , is_a("array"))
  testUtilObjectSize(betaColumn)

  cat("betaColumn =", betaColumn, "\n")

  cat("End of test computeBetaMatrixColumnHat", "\n")

  cat("=====================\n")
}
