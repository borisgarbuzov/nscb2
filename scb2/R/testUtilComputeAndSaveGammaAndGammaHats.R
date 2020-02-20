testUtilComputeAndSaveGammaAndGammaHats <- function(sampleSize,
                                                    tParCount,
                                                    lag,
                                                    gammaHatCount,
                                                    sigma,
                                                    mean,
                                                    noise,
                                                    type,
                                                    diagOrHoriz) {

  cat("\n Testing \'tests_scb2_208_computeAndSaveGammaAndGammaHats\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("lag =", lag, "\n")
  cat("gammaHatCount =", gammaHatCount, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("noise =", noise, "\n")
  cat("type =", type, "\n")
  cat("diagOrHoriz =", diagOrHoriz, "\n")

  Start <- Sys.time()

  gammaAndGammaHats <- computeAndSaveGammaAndGammaHats(
    sampleSize = sampleSize,
    tParCount = tParCount,
    lag = lag,
    gammaHatCount = gammaHatCount,
    sigma = sigma,
    mean = mean,
    noise = noise,
    type = type,
    diagOrHoriz = diagOrHoriz
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test computeAndSaveGammaAndGammaHats", "\n")
  cat("=====================\n")
}
