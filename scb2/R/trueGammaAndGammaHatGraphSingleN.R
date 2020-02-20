trueGammaAndGammaHatGraphSingleN <- function(sampleSize = 1000,
                                      lag = 0,
                                      bandWidthPowerForGamma = 1/4,
                                      sigma = 2,
                                      tParCount = 100,
                                      noise = NULL,
                                      type = "ScaledNoise"){
  startTime = Sys.time()
  fileName <- paste0("output/gammaHatTestVisual_sampleSize=", sampleSize, "_tParCount=", tParCount, ".svg")
  tParArray <- createTParArray(tParCount)
  bandWidth = computeBForGamma(sampleSize, bandWidthPowerForGamma)
  sandboxPair <- createNewTParArrayIndex(tParArray = tParArray,
                                               bandWidth = bandWidth)
  trueGammaArray <- array(data = NA, dim = length(tParArray[sandboxPair[1]:sandboxPair[2]]))
  diagonalGammaArray <- array(data = NA, dim = length(tParArray[sandboxPair[1]:sandboxPair[2]]))
  horizontalGammaArray <- array(data = NA, dim = length(tParArray[sandboxPair[1]:sandboxPair[2]]))
  gammaIndex = 1
  samples = createDiagHorSamples(sampleSize = sampleSize,
                                 tParCount = tParCount,
                                 sigma = sigma,
                                 type = type,
                                 noise = noise)
  diagonalSample = samples[[2]]
  horizontal2dSample = samples[[1]]
  for(tIndex in sandboxPair[1]:sandboxPair[2]){
    trueGammaArray[gammaIndex] = computeGammaScaledNoise(tPar = tParArray[tIndex], sigma = sigma, lag = lag)

    kernelArray = computeKernelArray(sampleSize = sampleSize,
                                     tPar = tParArray[tIndex],
                                     bandWidth = bandWidth)
    diagonalGammaArray[gammaIndex] = computeGammaHat(sample = diagonalSample,
                                            lag = lag,
                                            kernelArray = kernelArray)
    horizontalGammaArray[gammaIndex] = computeGammaHat(sample = horizontal2dSample[tIndex,],
                                              lag = lag)
    gammaIndex = gammaIndex + 1
  }

  createPlotTrueGammaAndGammaHatSingleN(trueGammaArray,
                                        diagonalGammaArray,
                                        horizontalGammaArray,
                                        tParArray,
                                        sandboxPair = sandboxPair,
                                        bandWidthPowerForGamma,
                                        bandWidth,
                                        startTime,
                                        lag,
                                        sampleSize,
                                        fileName)

  gammaList <- list(trueGammaArray,
                    diagonalGammaArray,
                    horizontalGammaArray)
  return(gammaList)
}
