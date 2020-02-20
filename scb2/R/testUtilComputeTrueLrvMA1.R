testUtilComputeTrueLrvMA1 <- function(sigma,
                                      tPar){

  cat("\n Testing \'tests_scb2_159_computeTrueLrvMA1\' \n")

  cat("\nTest parameters :", "\n")

  cat("sigma = ", sigma, "\n")
  cat("tPar = ", tPar, "\n")

  Start <- Sys.time()

  trueLrv <- computeTrueLrvMA1(sigma = sigma,
                               tPar = tPar)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("trueLrv =", trueLrv, "\n")

  cat("End of test computeTrueLrvMA1", "\n")

  cat("=====================\n")
}
