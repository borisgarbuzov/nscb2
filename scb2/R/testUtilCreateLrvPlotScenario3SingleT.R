testUtilCreateLrvPlotScenario3SingleT <- function(lrvXArray,
                                                  lrvYArray,
                                                  trueLrv,
                                                  sampleSizeArray,
                                                  tParArray,
                                                  bConst = 1,
                                                  mConst = 1,
                                                  bandWidth,
                                                  batchSize,
                                                  bandWidthDegree,
                                                  batchSizeDegree,
                                                  mySeed){
  tIndex = 4

  cat("\n Testing \'tests_scb2_152_createLrvPlotScenario3SingleT\' \n")

  cat("\nTest parameters :", "\n")
  cat("lrvXArray = \n", lrvXArray, "\n")
  cat("lrvYArray = \n", lrvYArray, "\n")
  cat("tParArray = \n", tParArray, "\n")
  cat("sampleSizeArray = \n", sampleSizeArray, "\n")
  cat("trueLrv = \n", trueLrv, "\n")
  cat("bConst = ", bConst, "\n")
  cat("mConst = ", mConst, "\n")
  cat("bandWidth = ", bandWidth, "\n")
  cat("batchSize = ", batchSize, "\n")

  Start <- Sys.time()

  for(i in 1:length(sampleSizeArray)){

    nameOfFile <- paste0("SingleT", "(t=", tParArray[tIndex],
                         ", maxSampleSize=", sampleSizeArray[i], ").svg")

    createLrvPlotScenario3SingleT(lrvXArray = lrvXArray[1:i],
                                  lrvYArray = lrvYArray[1:i],
                                  trueLrv = trueLrv,
                                  sampleSizeArray = sampleSizeArray[1:i],
                                  fileName = nameOfFile,
                                  tPar = tParArray[tIndex],
                                  bConst = bConst,
                                  mConst = mConst,
                                  b = bandWidth,
                                  m = batchSize,
                                  startTime = Start,
                                  bandWidthDegree = bandWidthDegree,
                                  batchSizeDegree = batchSizeDegree,
                                  mySeed = mySeed)




  }

  End <- Sys.time()
  duration <- End - Start

  cat("\n Result:\n")
  cat("Duration =", duration, "\n")


  cat("End of test createLrvPlotScenario3SingleT", "\n")

  cat("=====================\n")

}
