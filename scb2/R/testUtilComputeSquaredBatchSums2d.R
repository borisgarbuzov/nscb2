testUtilComputeSquaredBatchSums2d <- function(tParCount,
                                              sampleSize,
                                              bConst){
  cat("\n Testing \'tests_scb2_198_computeSquaredBatchSums2d\' \n")

  cat("\nTest parameters:", "\n")
  cat("tParCount =", tParCount, "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("bConst =", bConst, "\n")

  Start <- Sys.time()

  squaredBatchSums2d <- computeSquaredBatchSums2d(tParCount = tParCount,
                                                  sampleSize = sampleSize,
                                                  bConst = bConst)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test computeSquaredBatchSums2d", "\n")
  cat("=====================\n")
}
