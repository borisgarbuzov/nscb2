



# tPar - a value of t where I want to get correctHorizontalGammaHat == computed
# correctHorizontalGammaHat - the value I expect to see at tPar point and for given noise
# noise - pre-computed array of noise
# lag at which I will match my computed gamma
testUtiltest01230trueGammaAndGammaHatGraphSingleN <- function(tParCount,
                                                            tPar,
                                                            lag,
                                                            noise,
                                                            correctHorizontalGammaHat){
  cat("\n Testing \'123noiseHorizontal\' \n")

  sampleSize = length(noise)
  # tIndex = tPar * (tParCount-1) # unused
  # cat("tIndex =", tIndex, "\n")

  cat("\nTest parameters:", "\n")
  cat("tParCount =", tParCount, "\n")
  cat("tPar =", tPar, "\n")
  cat("noise =", noise, "\n")
  cat("sampleSize =", sampleSize, "\n")


  # create our horizontal sample with given epsilon and take line corresponding
  # to given tIndex
  gammaList <- trueGammaAndGammaHatGraphSingleN(sampleSize = sampleSize,
                                                lag = lag,
                                                tParCount = tParCount,
                                                noise = noise)
  horizontalGamma <- gammaList[[3]][1]

  cat("Result:\n")

  # check if computed gamma equals gamma calculated by hand
  expect_equal(horizontalGamma, expected = correctHorizontalGammaHat,
               tolerance = .0001)

  cat("correctHorizontalGammaHat =", correctHorizontalGammaHat, "\n")
  cat("horizontalGamma =", horizontalGamma, "\n")

  cat("End of test 123noiseHorizontal", "\n")

  cat("=====================\n")
}
