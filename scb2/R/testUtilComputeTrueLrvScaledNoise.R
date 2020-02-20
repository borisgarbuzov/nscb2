testUtilComputeTrueLrvScaledNoise <- function(sigma,
                                              tPar)
  {

  cat("\n Testing \'tests_scb2_160_computeTrueLrvScaledNoise\ \n")

  cat("\nTest parameters :", "\n")

  Start <- Sys.time()

  trueLrv <- computeTrueLrvScaledNoise(sigma,
                                       tPar)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")

  cat("Result:\n")

  cat("Duration =", duration, "\n")

  cat("trueLrv =", trueLrv, "\n")

  cat("End of test computeTrueLrvScaledNoise", "\n")

  cat("=====================\n")
}
