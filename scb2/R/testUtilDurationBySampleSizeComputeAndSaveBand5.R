testUtilDurationBySampleSizeComputeAndSaveBand5 <- function(
  fromSampleSize,
  toSampleSize,
  stepSampleSize,
  tParCount)
{

  cat("\n Testing \'tests_scb2_234_durationBySampleSizeComputeAndSaveBand5\' \n")

  cat("\nTest parameters:", "\n")
  cat("fromSampleSize =", fromSampleSize, "\n")
  cat("toSampleSize =", toSampleSize, "\n")
  cat("stepSampleSize =", stepSampleSize, "\n")
  cat("tParCount =", tParCount, "\n")

  Start <- Sys.time()

  durationBySampleSizeComputeAndSaveBand5(
    fromSampleSize = fromSampleSize,
    toSampleSize = toSampleSize,
    stepSampleSize = stepSampleSize,
    tParCount = tParCount
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test durationBySampleSizeComputeAndSaveBand5", "\n")
  cat("=====================\n")
}
