testUtilTrueGammaAndGammaHatGraphSingleN <- function(sampleSize,
                                                     lag,
                                                     bandWidthPowerForGamma,
                                                     sigma,
                                                     tParCount,
                                                     noise,
                                                     type = "ScaledNoise"){
  cat("\n Testing \'tests_scb2_191_trueGammaAndGammaHatGraphSingleN\ \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("lag =", lag, "\n")
  cat("bandWidthPowerForGamma =", bandWidthPowerForGamma, "\n")
  cat("sigma =", sigma, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("noise =", noise, "\n")

  Start <- Sys.time()

  gammaList <- trueGammaAndGammaHatGraphSingleN(sampleSize = sampleSize,
                                                lag = lag,
                                                bandWidthPowerForGamma = bandWidthPowerForGamma,
                                                sigma = sigma,
                                                tParCount = tParCount,
                                                noise = noise,
                                                type = type)

  End <- Sys.time()
  duration <- End - Start

  cat("Duration =", duration, "\n")

  cat("trueGammaArray", gammaList[[1]], "\n")
  cat("diagonalGammaArray", gammaList[[2]], "\n")
  cat("horizontalGammaArray", gammaList[[3]], "\n")

  cat("End of test trueGammaAndGammaHatGraphSingleN", "\n")

  cat("=====================\n")
}
