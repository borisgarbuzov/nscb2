testUtil123NoiseHorizontal <- function(tParCount,
                                       tPar,
                                       lag,
                                       noise,
                                       correctHorizontalGammaHat){
  cat("\n Testing \'Testing 123noiseHorizontal\' \n")

  sampleSize = length(noise)
  tIndex = tPar * (tParCount-1)

  cat("\nTest parameters:", "\n")
  cat("tParCount =", tParCount, "\n")
  cat("tPar =", tPar, "\n")
  cat("noise =", noise, "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tIndex =", tIndex, "\n")

  # create our horizontal sample with given epsilon and take line corresponding
  # to given tIndex
  samples <- createDiagHorSamples(sampleSize = sampleSize,
                                 tParCount = tParCount,
                                 sigma = 2,
                                 type = "ScaledNoise",
                                 noise = noise)

  horizontal2dSample <- samples[[1]]
  horizontalLine <- horizontal2dSample[tIndex,]

  # compute gamma for horizontal line
  horizontalGamma <- computeGammaHat(sample = horizontalLine,
                                     lag = lag)
  cat("Result:\n")

  # check if computed gamma equals gamma calculated by hand
  expect_equal(horizontalGamma, expected = correctHorizontalGammaHat,
               tolerance = .0001)

  cat("horizontal line corresponding to t=", tPar, "\n", horizontalLine, "\n")
  cat("correctHorizontalGammaHat =", correctHorizontalGammaHat, "\n")
  cat("horizontalGamma =", horizontalGamma, "\n")

  cat("End of test 123noiseHorizontal", "\n")

  cat("=====================\n")
}
