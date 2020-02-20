trueGammaAndGammaHatGraphSingleT <- function(minSampleSize = 100,
                                      maxSampleSize = 10000,
                                      sampleSizeStep = 100,
                                      tIndex = 6,
                                      lag = 0,
                                      bandWidthPowerForGamma = 1/4,
                                      sigma = 2,
                                      tParCount = 11,
                                      type = "ScaledNoise"){
  startTime = Sys.time()
  fileName <- paste0("output/gammaHatTestVisual_sampleSize=", maxSampleSize, "_tIndex=", tIndex, ".svg")
  sampleSizeArray = seq(from = minSampleSize, to = maxSampleSize, by = sampleSizeStep)
  tParArray <- createTParArray(tParCount)
  trueGammaArray <- array(data = NA, dim = length(sampleSizeArray))
  diagonalGammaArray <- array(data = NA, dim = length(sampleSizeArray))
  horizontalGammaArray <- array(data = NA, dim = length(sampleSizeArray))
  gammaIndex = 1
  for(sampleSize in sampleSizeArray){
    samples = createDiagHorSamples(sampleSize = sampleSize,
                                   tParCount = tParCount,
                                   sigma = sigma,
                                   type = type)
    diagonalSample = samples[[2]]
    horizontal2dSample = samples[[1]]
    trueGammaArray[gammaIndex] = computeGammaScaledNoise(tPar = tParArray[tIndex+1], sigma = sigma, lag = lag)
    bandWidth = computeBForGamma(sampleSize, bandWidthPowerForGamma)
    kernelArray = computeKernelArray(sampleSize = sampleSize,
                                     tPar = tParArray[tIndex+1],
                                     bandWidth = bandWidth)
    diagonalGammaArray[gammaIndex] = computeGammaHat(sample = diagonalSample,
                                            lag = lag,
                                            kernelArray = kernelArray)
    horizontalGammaArray[gammaIndex] = computeGammaHat(sample = horizontal2dSample[tIndex,],
                                              lag = lag)
    gammaIndex = gammaIndex + 1
  }

  createPlotTrueGammaAndGammaHatSingleT(trueGammaArray,
                                        diagonalGammaArray,
                                        horizontalGammaArray,
                                        sampleSizeArray,
                                        bandWidthPowerForGamma,
                                        bandWidth,
                                        tPar = tParArray[tIndex],
                                        startTime,
                                        lag,
                                        fileName)

  gammaList <- list(trueGammaArray,
                    diagonalGammaArray,
                    horizontalGammaArray)
  return(gammaList)

}
