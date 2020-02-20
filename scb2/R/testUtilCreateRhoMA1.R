testUtilCreateRhoMA1 <- function(size,
                                 psi){

  cat("\n Testing \'tests_scb2_163_createRhoMA1\' \n")

  cat("\nTest parameters :", "\n")

  cat("size = ", size, "\n")
  cat("psi = ", psi, "\n")

  Start <- Sys.time()

  rho <- createRhoMA1(size = size,
                      psi = psi)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("rho =", rho, "\n")

  cat("End of test createRhoMA1", "\n")

  cat("=====================\n")
}
