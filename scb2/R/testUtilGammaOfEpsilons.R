testUtilGammaOfEpsilons <- function(sampleSize,
                                    tParCount,
                                    tPar,
                                    noise,
                                    trueGammaHat){

  cat("\n Testing \'test gamma of epsilons\' \n")

  cat("\nTest parameters :", "\n")
  cat("noise = ", noise, "\n")
  cat("sampleSize = ", sampleSize, "\n")
  cat("tParCount = ", tParCount, "\n")

  Start <- Sys.time()

  diagHorSample <- createDiagHorSamplesScaledNoise(sampleSize = sampleSize,
                                                   tParCount = tParCount,
                                                   noise = noise)
  horizontal2dSample <- diagHorSample[[1]][tPar * tParCount,]

  gammaHat <- computeGammaHat(sample = horizontal2dSample, lag = 1)

  End <- Sys.time()
  duration <- End - Start

  expect_equal(gammaHat, expected = trueGammaHat, tolerance = .0001)

  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("trueGammaHat =", trueGammaHat, "\n")
  cat("gammaHat =", gammaHat, "\n")

  cat("End of test gamma of epsilons", "\n")

  cat("=====================\n")
}
