testUtilComputeMultiplicationCoef <- function(sampleSize) {

  cat("\n Testing \'tests_scb2_243_testUtilComputeMultiplicationCoef\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")

  Start <- Sys.time()

  multiplicationCoef <- computeMultiplicationCoef(
    sampleSize = sampleSize
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", multiplicationCoef, "\n")

  cat("End of test computeMultiplicationCoef", "\n")
  cat("=====================\n")
}
