testUtilComputeGammaHat <- function(sample,
                                    lag){
  cat("\n Testing \'tests_scb2_182_computeGammaHat\ \n")

  cat("\nTest parameters:", "\n")
  cat("sample =", sample, "\n")
  cat("lag =", lag, "\n")

  Start <- Sys.time()

  gammaHat <- computeGammaHat(sample = sample,
                              lag = lag)

  End <- Sys.time()
  duration <- End - Start

  cat("\nResult:\n")
  cat("Duration =", duration, "\n")

  cat("gammaHat  =", gammaHat, "\n")

  cat("End of test computeKernelArray", "\n")

  cat("=====================\n")
}
