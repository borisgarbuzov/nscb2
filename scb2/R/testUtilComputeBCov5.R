testUtilComputeBCov5 <- function(sampleSize) {
  cat("\n Testing \'tests_scb2_204_computeBCov5\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")

  Start <- Sys.time()

  bCov <- computeBCov5(sampleSize = sampleSize)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", bCov, "\n")

  cat("End of test computeBCov5", "\n")
  cat("=====================\n")
}
