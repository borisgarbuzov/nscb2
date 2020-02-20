testUtilSquared2dBetaBenchmark <- function(minSampleSize,
                                           maxSampleSize,
                                           sampleSizeStep){
  cat("\n Testing \'tests_scb2_199_squared2dBetaBenchmark\' \n")

  cat("\nTest parameters:", "\n")
  cat("tParCount =", minSampleSize, "\n")
  cat("sampleSize =", maxSampleSize, "\n")
  cat("bConst =", sampleSizeStep, "\n")

  Start <- Sys.time()

  squaredBatchSums2d <- squared2dBetaBenchmark(minSampleSize = minSampleSize,
                                               maxSampleSize = maxSampleSize,
                                               sampleSizeStep = sampleSizeStep)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test squared2dBetaBenchmark", "\n")
  cat("=====================\n")
}
