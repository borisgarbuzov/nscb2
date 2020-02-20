testUtilScenario4BetaSingleT <- function(tParCount,
                                     tIndex,
                                     minSampleSize,
                                     maxSampleSize,
                                     sampleSizeStep,
                                     sigma,
                                     lag,
                                     mySeed,
                                     bDegree){
  cat("\n Testing \'tests_scb2_181_scenario4BetaSingleT\ \n")

  cat("\nTest parameters:", "\n")
  cat("tIndex =", tIndex, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("minSampleSize =", minSampleSize, "\n")
  cat("maxSampleSize =", maxSampleSize, "\n")
  cat("sampleSizeStep =", sampleSizeStep, "\n")
  cat("sigma =", sigma, "\n")
  cat("lag =", lag, "\n")
  cat("mySeed =", mySeed, "\n")
  cat("bDegree =", bDegree, "\n")

  Start <- Sys.time()

  scenario4BetaSingleT(tParCount = tParCount,
                       tIndex = tIndex,
                       minSampleSize = minSampleSize,
                       maxSampleSize = maxSampleSize,
                       sampleSizeStep = sampleSizeStep,
                       sigma = sigma,
                       maxLag = maxLag,
                       lag = lag,
                       mySeed = mySeed,
                       bDegree = bDegree)

  End <- Sys.time()
  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("\nEnd of test scenario4SingleT", "\n")

  cat("=====================\n")
}
