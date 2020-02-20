testUtilCreateRhoScaledNoise <- function(lag){

  cat("\n Testing \'tests_scb2_164_createRhoScaledNoise\' \n")

  cat("\nTest parameters :", "\n")

  cat("lag = ", lag, "\n")


  Start <- Sys.time()

  rho <- createRhoScaledNoise(lag = lag)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("rho =", rho, "\n")

  cat("End of test createRhoScaledNoise", "\n")

  cat("=====================\n")
}
