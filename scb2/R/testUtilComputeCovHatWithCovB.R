testUtilComputeCovHatWithCovB <- function(tPar,
                                           sample,
                                           lag,
                                           bCov){
  cat("\n Testing \'tests_scb2_179_computeCovHatWithCovB\ \n")

  cat("\nTest parameters:", "\n")
  cat("tPar =", tPar, "\n")
  cat("sample =", sample, "\n")
  cat("lag =", lag, "\n")
  cat("bCov =", bCov, "\n")

  Start <- Sys.time()

  gammaHat <- computeCovHatWithCovB(tPar = tPar,
                                    sample = sample,
                                    lag = lag,
                                    bCov = bCov)

  End <- Sys.time()
  duration <- End - Start

  cat("\nResult:\n")
  cat("Duration =", duration, "\n")

  cat("kernelArray =", gammaHat, "\n")

  cat("End of test computeCovHatWithCovB", "\n")

  cat("=====================\n")
}
