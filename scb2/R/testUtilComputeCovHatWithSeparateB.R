testUtilComputeCovHatWithSeparateB <- function(tPar,
                                               sample,
                                               lag,
                                               bandWidth){
  cat("\n Testing \'tests_scb2_177_computeCovHatWithSeparateB\ \n")

  cat("\nTest parameters:", "\n")

  cat("tPar =", tPar, "\n")
  cat("sample =", sample, "\n")
  cat("lag =", lag, "\n")
  cat("bandWidth =", bandWidth, "\n")

  Start <- Sys.time()

  gammaHat <- computeCovHatWithSeparateB(tPar = tPar,
                                         sample = sample,
                                         lag = lag,
                                         bandWidth = bandWidth)

  End <- Sys.time()
  duration <- End - Start

  cat("\nResult:\n")
  cat("Duration =", duration, "\n")

  cat("gammaHat =", gammaHat, "\n")

  cat("End of test computeCovHatWithSeparateB", "\n")

  cat("=====================\n")
}
