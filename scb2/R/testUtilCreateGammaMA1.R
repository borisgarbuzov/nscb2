testUtilCreateGammaMA1 <- function(sigma,
                                   psi) {

  cat("\n Testing \'tests_scb2_161_createGammaMA1\' \n")

  cat("\nTest parameters :", "\n")

  cat("sigma = ", sigma, "\n")
  cat("psi = ", psi, "\n")

  Start <- Sys.time()

  gamma <- createGammaMA1(sigma = sigma,
                          psi = psi)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("gamma =", gamma, "\n")

  cat("End of test createGammaMA1", "\n")

  cat("=====================\n")
}
