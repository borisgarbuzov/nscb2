testUtilComputeAndSaveZhouStatisticArrays <- function(tParCount,
                                                      replicationCount,
                                                      minSampleSize,
                                                      maxSampleSize,
                                                      sampleSizeStep) {

  cat("\n Testing \'tests_scb2_225_computeAndSaveZhouStatisticArrays\' \n")

  cat("\nTest parameters:", "\n")
  cat("tParCount =", tParCount, "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("minSampleSize =", minSampleSize, "\n")
  cat("maxSampleSize =", maxSampleSize, "\n")
  cat("sampleSizeStep =", sampleSizeStep, "\n")

  Start <- Sys.time()

  zhouStatistic <-
    computeAndSaveZhouStatisticArrays(
      tParCount = tParCount,
      replicationCount = replicationCount,
      minSampleSize = minSampleSize,
      maxSampleSize = maxSampleSize,
      sampleSizeStep = sampleSizeStep
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test computeAndSaveZhouStatisticArrays", "\n")
  cat("=====================\n")
}
