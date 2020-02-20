testUtilComputeBatchSize <- function(sampleSize){

  cat("\n Testing \'tests_scb2_157_computeBatchSize\ \n")

  cat("\nTest parameters :", "\n")

  cat("sampleSize = ", sampleSize, "\n")

  Start <- Sys.time()

  batchSize <- computeBatchSize(sampleSize = sampleSize)

  End <- Sys.time()
  duration <- End - Start


  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("batchSize =", batchSize, "\n")

  cat("End of test computeBatchSize", "\n")

  cat("=====================\n")
}

