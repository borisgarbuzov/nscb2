testUtilScenario4BetaSingleN <- function(tParCount,
                                     sampleSize,
                                     sigma,
                                     maxLag,
                                     lag,
                                     bDegree,
                                     mySeed,
                                     bDegreeForGamma){
  cat("\n Testing \'tests_scb2_180_scenario4BetaSingleN\ \n")

  cat("\nTest parameters:", "\n")
  cat("tParCount =", tParCount, "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("sigma =", sigma, "\n")
  cat("maxLag =", maxLag, "\n")
  cat("lag =", lag, "\n")
  cat("bDegree =", bDegree, "\n")
  cat("mySeed =", mySeed, "\n")
  cat("bDegreeForGamma =", bDegreeForGamma, "\n")


  Start <- Sys.time()

  scenario4BetaSingleN(tParCount = tParCount,
                       sampleSize = sampleSize,
                       sigma = sigma,
                       maxLag = maxLag,
                       lag = lag,
                       bDegree = bDegree,
                       mySeed = mySeed,
                       bDegreeForGamma = bDegreeForGamma)

  End <- Sys.time()
  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("\nEnd of test scenario4SingleN", "\n")

  cat("=====================\n")
}
