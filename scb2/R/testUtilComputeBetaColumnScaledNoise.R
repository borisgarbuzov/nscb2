testUtilComputeBetaColumnScaledNoise <- function(sample = sample,
                                                 psi = psi,
                                                 sigma = sigma,
                                                 lag = lag,
                                                 tPar = tPar){
  cat("\n Testing \'tests_scb2_172_computeBetaColumnScaledNoise\ \n")
  cat("\nTest parameters :", "\n")
  cat("sample = ", sample, "\n")
  cat("psi = ", psi, "\n")
  cat("sigma = ", sigma, "\n")
  cat("lag = ", lag, "\n")
  cat("tPar = ", tPar, "\n")

  Start <- Sys.time()

  diagonalBetaColumn <- computeBetaColumnScaledNoise(sample = sample,
                                                     psi = psi,
                                                     sigma = sigma,
                                                     lag = lag,
                                                     tPar = tPar)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  expect_that(diagonalBetaColumn , is_a("array"))
  testUtilObjectSize(diagonalBetaColumn)

  cat("diagonalBetaColumn =", diagonalBetaColumn, "\n")
  cat("End of test computeBetaColumnScaledNoise", "\n")
  cat("=====================\n")
}
