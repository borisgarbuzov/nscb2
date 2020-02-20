testUtilComputeBatchSize5 <- function(sampleSize) {
  cat("\n Testing \'tests_scb2_206_computeBatchSize5\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")

  Start <- Sys.time()

  batchSize <- computeBatchSize5(sampleSize = sampleSize)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", batchSize, "\n")

  cat("End of test computeBatchSize5", "\n")
  cat("=====================\n")
}
