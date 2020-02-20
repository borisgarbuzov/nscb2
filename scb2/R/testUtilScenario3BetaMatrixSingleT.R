testUtilScenario3BetaMatrixSingleT <- function(tParCount = 100,
                                               tIndex = 6,
                                               minSampleSize = 1000,
                                               maxSampleSize = 1000000,
                                               sampleSizeStep = 10000,
                                               sigma = 2,
                                               maxLag = 8,
                                               lag = 2,
                                               pictureWidth = 2000,
                                               pictureHeight = 1000,
                                               mySeed = "random",
                                               renevalOrExpansion = "renewal",
                                               typeOfKernel = "gaussian",
                                               bDegree = -0.26,
                                               bConst = 1,
                                               mConst = 1){

  cat("\n Testing \'tests_scb2_171_scenario3BetaMatrixSingleT\' \n")

  cat("\nTest parameters :", "\n")

  cat("tParCount = ", tParCount, "\n")
  cat("tIndex = ", tIndex, "\n")
  cat("minSampleSize = ", minSampleSize, "\n")
  cat("maxSampleSize = ", maxSampleSize, "\n")
  cat("sampleSizeStep = ", sampleSizeStep, "\n")
  cat("sigma = ", sigma, "\n")
  cat("maxLag = ", maxLag, "\n")
  cat("lag = ", lag, "\n")
  cat("mySeed = ", mySeed, "\n")
  cat("renevalOrExpansion = ", renevalOrExpansion, "\n")
  cat("typeOfKernel = ", typeOfKernel, "\n")
  cat("bDegree = ", bDegree, "\n")
  cat("bConst = ", bConst, "\n")
  cat("mConst = ", mConst, "\n")

  Start <- Sys.time()

  scenario3BetaMatrixSingleT(
    tParCount = tParCount,
    tIndex = tIndex,
    minSampleSize = minSampleSize,
    maxSampleSize = maxSampleSize,
    sampleSizeStep = sampleSizeStep,
    sigma = sigma,
    maxLag = maxLag,
    lag = lag,
    pictureWidth = pictureWidth,
    pictureHeight = pictureHeight,
    mySeed = mySeed,
    renevalOrExpansion = renevalOrExpansion,
    typeOfKernel = typeOfKernel,
    bDegree = bDegree,
    bConst = bConst,
    mConst = mConst)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test scenario3BetaMatrixSingleT", "\n")

  cat("=====================\n")
}
