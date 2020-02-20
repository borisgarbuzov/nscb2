testUtilComputeCorHatWithCovB <- function(sample,
                                          lag,
                                          tPar,
                                          bCov){
  cat("\n Testing \'tests_scb2_178_computeCorHatWithCovB\ \n")

  cat("\nTest parameters:", "\n")
  cat("sample =", sample, "\n")
  cat("lag = ", lag, "\n")
  cat("tPar =", tPar, "\n")
  cat("bCov = ", bCov, "\n")

  Start <- Sys.time()

  rhoHat <- computeCorHatWithCovB(sample = sample,
                                  lag = lag,
                                  tPar = tPar,
                                  bCov = bCov)

  End <- Sys.time()
  duration <- End - Start

  cat("\nResult:\n")
  cat("Duration =", duration, "\n")

  cat("rhoHat =", rhoHat, "\n")

  cat("End of test computeCorHatWithCovB", "\n")

  cat("=====================\n")
}
