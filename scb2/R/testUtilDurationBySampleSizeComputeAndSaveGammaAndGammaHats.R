testUtilDurationBySampleSizeComputeAndSaveGammaAndGammaHats <- function(
  fromSampleSize,
  toSampleSize,
  stepSampleSize,
  tParCount,
  gammaHatCount)
  {

  cat("\n Testing \'tests_scb2_233_durationBySampleSizeComputeAndSaveGammaAndGammaHats\' \n")

  cat("\nTest parameters:", "\n")
  cat("fromSampleSize =", fromSampleSize, "\n")
  cat("toSampleSize =", toSampleSize, "\n")
  cat("stepSampleSize =", stepSampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("gammaHatCount =", gammaHatCount, "\n")

  Start <- Sys.time()

  gammaAndGammaHats <-
    durationBySampleSizeComputeAndSaveGammaAndGammaHats(
      fromSampleSize = fromSampleSize,
      toSampleSize = toSampleSize,
      stepSampleSize = stepSampleSize,
      tParCount = tParCount,
      gammaHatCount = gammaHatCount
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", gammaAndGammaHats, "\n")

  cat("End of test durationBySampleSizeComputeAndSaveGammaAndGammaHats", "\n")
  cat("=====================\n")
}
