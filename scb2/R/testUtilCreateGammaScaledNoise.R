testUtilCreateGammaScaledNoise <- function(tPar,
                                           sigma,
                                           lag){

  cat("\n Testing \'tests_scb2_162_createGammaScaledNoise\' \n")

  cat("\nTest parameters :", "\n")

  cat("tPar = ", tPar, "\n")
  cat("sigma = ", sigma, "\n")

  Start <- Sys.time()

  gamma <- computeGammaScaledNoise(tPar = tPar,
                                  sigma = sigma,
                                  lag = lag)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("gamma =", gamma, "\n")

  cat("End of test createGammaScaledNoise", "\n")

  cat("=====================\n")
}
