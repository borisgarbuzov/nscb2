testUtilComputeRhoHat <- function(gammaHat, gammaHat0){
  cat("\n Testing \'tests_scb2_176_computeRhoHat\ \n")

  cat("\nTest parameters:", "\n")
  cat("gammaHat =", gammaHat, "\n")
  cat("gammaHat0 = ", gammaHat0, "\n")

  Start <- Sys.time()

  rhoHat <- computeRhoHat(gammaHat = gammaHat,
                          gammaHat0 = gammaHat0)

  End <- Sys.time()
  duration <- End - Start

  cat("\nResult:\n")
  cat("Duration =", duration, "\n")

  cat("rhoHat  =", rhoHat, "\n")

  cat("End of test computeRhoHat", "\n")

  cat("=====================\n")
}
