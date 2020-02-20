testUtilDurationByTParCountComputeAndSaveGammaAndGammaHats <- function(
  sampleSize,
  minTParCount,
  maxTParCount,
  tParCountStep,
  gammaHatCount
)
{

  cat("\n Testing \'tests_scb2_237_durationByTParCountComputeAndSaveGammaAndGammaHats\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("minTParCount =", minTParCount, "\n")
  cat("maxTParCount =", maxTParCount, "\n")
  cat("tParCountStep =", tParCountStep, "\n")
  cat("gammaHatCount =", gammaHatCount, "\n")

  Start <- Sys.time()

  durationByTParCountComputeAndSaveGammaAndGammaHats(
    sampleSize = sampleSize,
    minTParCount = minTParCount,
    maxTParCount = maxTParCount,
    tParCountStep = tParCountStep,
    gammaHatCount = gammaHatCount
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test durationByTParCountComputeAndSaveGammaAndGammaHats", "\n")
  cat("=====================\n")
}
