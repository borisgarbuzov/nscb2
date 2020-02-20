testUtilComputeTrueLrv <- function(sigma,
                                   tPar) {
  cat("\n Testing \'tests_scb2_158_computeTrueLrv\ \n")

  cat("\nTest parameters :", "\n")

  cat("sigma = ", sigma, "\n")
  cat("tPar = ", tPar, "\n")

  Start <- Sys.time()

  trueLrv <- computeTrueLrv(sigma = sigma,
                            tPar = tPar)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("trueLrv =", trueLrv, "\n")

  cat("End of test computeTrueLrv", "\n")

  cat("=====================\n")
}
