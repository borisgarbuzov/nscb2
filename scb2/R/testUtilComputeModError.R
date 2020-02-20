testUtilComputeModError <- function(trueRhoArray,
                                    trueBetaLrvArray,
                                    rhoHatArray)
  {

  cat("\n Testing \'tests_scb2_230_computeModError\' \n")

  cat("\nTest parameters:", "\n")
  cat("trueRhoArray =", trueRhoArray, "\n")
  cat("trueBetaLrvArray =", trueBetaLrvArray, "\n")
  cat("rhoHatArray =", rhoHatArray, "\n")

  Start <- Sys.time()

  modError <-
    computeModError(
      trueRhoArray = trueRhoArray,
      trueBetaLrvArray = trueBetaLrvArray,
      rhoHatArray = rhoHatArray
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", modError, "\n")

  cat("End of test computeModError", "\n")
  cat("=====================\n")
}
