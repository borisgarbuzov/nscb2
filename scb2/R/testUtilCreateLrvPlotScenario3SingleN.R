testUtilCreateLrvPlotScenario3SingleN <- function(lrvXArray,
                                                  lrvYArray,
                                                  newTParArrayIndex,
                                                  trueLrvArray,
                                                  sampleSize,
                                                  tParArray,
                                                  bandWidth,
                                                  batchSize,
                                                  bandWidthDegree,
                                                  batchSizeDegree,
                                                  mySeed,
                                                  bConst,
                                                  mConst) {
  cat("\n Testing \'tests_scb2_151_createLrvPlotScenario3SingleN\' \n")

  cat("\nTest parameters :", "\n")
  cat("lrvXArray = \n", lrvXArray, "\n")
  cat("lrvYArray = \n", lrvYArray, "\n")
  cat("trueLrvArray = \n", trueLrvArray, "\n")
  cat("sampleSize = ", sampleSize, "\n")
  cat("tParArray = \n", tParArray, "\n")
  cat("bandWidth = ", bandWidth, "\n")
  cat("batchSize = ", batchSize, "\n")



  Start <- Sys.time()

  nameOfFile <- paste0("SingleN", "(batchSize=", batchSize,
                       ", bandwidth=", bandWidth,
                       ", sampleSize=", sampleSize, ").svg")

  createLrvPlotScenario3SingleN(
    lrvXArray = lrvXArray,
    lrvYArray = lrvYArray,
    trueLrvArray = trueLrvArray,
    sampleSize = sampleSize,
    fileName = nameOfFile,
    tParArray = tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]],
    b = bandWidth,
    m = batchSize,
    startTime = Start,
    bandWidthDegree = bandWidthDegree,
    batchSizeDegree = batchSizeDegree,
    mySeed = mySeed,
    bConst = bConst,
    mConst = mConst
  )




  End <- Sys.time()
  duration <- End - Start

  cat("\n Result:\n")
  cat("Duration =", duration, "\n")


  cat("End of test createLrvPlotScenario3SingleN", "\n")

  cat("=====================\n")
}
