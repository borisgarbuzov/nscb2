testUtilScenario3BetaMatrixSingleN <- function(tParCount = 100,
                                               sampleSize = 1000,
                                               sigma = 2,
                                               maxLag = 8,
                                               lag = 2,
                                               pictureWidth = 2000,
                                               pictureHeight = 1000,
                                               mySeed = "random",
                                               typeOfKernel = "gaussian",
                                               noise = NULL,
                                               bDegree = -0.26,
                                               bConst = 1,
                                               mConst = 1,
                                               diagHorizSamplePair = NULL){

  cat("\n Testing \'tests_scb2_166_scenario3BetaMatrixSingleN\' \n")

  cat("\nTest parameters :", "\n")

  cat("tParCount = ", tParCount, "\n")
  cat("sampleSize = ", sampleSize, "\n")
  cat("sigma = ", sigma, "\n")
  cat("maxLag = ", maxLag, "\n")
  cat("lag = ", lag, "\n")
  cat("mySeed = ", mySeed, "\n")
  cat("typeOfKernel = ", typeOfKernel, "\n")
  cat("bDegree = ", bDegree, "\n")
  cat("bConst = ", bConst, "\n")
  cat("mConst = ", mConst, "\n")
  cat("diagHorizSamplePair = ", diagHorizSamplePair, "\n")

  Start <- Sys.time()

  scenario3BetaMatrixSingleN(
    tParCount = tParCount,
    sampleSize = sampleSize,
    sigma = sigma,
    maxLag = maxLag,
    lag = lag,
    pictureWidth = pictureWidth,
    pictureHeight = pictureHeight,
    mySeed = mySeed,
    typeOfKernel = typeOfKernel,
    noise = noise,
    bDegree = bDegree,
    bConst = bConst,
    mConst = mConst,
    diagHorizSamplePair = diagHorizSamplePair
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test scenario3BetaMatrixSingleN", "\n")

  cat("=====================\n")
}
