trueGammaAndGammaHatGraph <- function(minSampleSize = 100,
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
  i = 1
  for(sampleSize in sampleSizeArray){
    samples = createDiagHorSamples(sampleSize = sampleSize,
                                   tParCount = tParCount,
                                   sigma = sigma,
                                   type = type)
    diagonalSample = samples[[2]]
    horizontal2dSample = samples[[1]]
    trueGammaArray[i] = computeGammaScaledNoise(tPar = tParArray[tIndex+1], sigma = sigma, lag = lag)
    bandWidth = computeBForGamma(sampleSize, bandWidthPowerForGamma)
    kernelArray = computeKernelArray(sampleSize = sampleSize,
                                     tPar = tParArray[tIndex+1],
                                     bandWidth = bandWidth)
    diagonalGammaArray[i] = computeGammaHat(sample = diagonalSample,
                                            lag = lag,
                                            kernelArray = kernelArray)
    horizontalGammaArray[i] = computeGammaHat(sample = horizontal2dSample[tIndex,],
                                              lag = lag)
    i = i + 1
  }

  arraySize <- length(trueGammaArray)
  color1Array <- array(data = "blue", dim = arraySize)
  color2Array <- array(data = "red", dim = arraySize)
  color3Array <- array(data = "black", dim = arraySize)

  svg(fileName)
  plot(x = c(sampleSizeArray, sampleSizeArray, sampleSizeArray),
       y = c(diagonalGammaArray, horizontalGammaArray, trueGammaArray),
       col = c(color1Array, color2Array, color3Array),
       xlab = "Sample size", ylab = "Gamma Value",
       xlim = c(0, sampleSizeArray[length(sampleSizeArray)] + sampleSizeArray[1]),
       ylim = c(min(c(diagonalGammaArray, horizontalGammaArray, trueGammaArray)),
                max(c(diagonalGammaArray, horizontalGammaArray, trueGammaArray))),
       main = "Graph for gamma", pch = 21, bg = c(color1Array, color2Array, color3Array))
  legend("topright", legend = c("true Gamma", "diagonal", "horizontal"),
         col = c("black", "blue", "red"), lty=1:1, cex = 0.8)

  tLegend <- paste("t =", tParArray[tIndex])
  degreeLegend <- paste("bandWidth degree =", round(bandWidthPowerForGamma, 4))
  lagLegend <- paste("lag =", lag)
  lastBandWidthLegend <- paste("last bandWidth =", round(bandWidth, 4))
  pointCountLegend <- paste("number of points =", arraySize)
  maxSampleSizeLegend <- paste("Max sample size =", max(sampleSizeArray))

  endTime <- Sys.time()
  durationHours <- as.integer(floor(difftime(endTime, startTime, units="hours")))
  durationMins <- as.integer(floor(difftime(endTime, startTime, units="mins"))) %% 60
  durationSecs <- as.integer(floor(difftime(endTime, startTime, units="secs"))) %% 60

  durationLegend <- paste0("duration = ", durationHours, ":",
                           durationMins, ":", durationSecs)

  lines(sampleSizeArray, diagonalGammaArray, col = "blue")
  lines(sampleSizeArray, horizontalGammaArray, col = "red")
  lines(sampleSizeArray, trueGammaArray, col = "black")

  legend("topleft", legend = c(tLegend, pointCountLegend,
                               maxSampleSizeLegend,
                               durationLegend,
                               degreeLegend,
                               lagLegend,
                               lastBandWidthLegend),
         cex = 0.8)

  dev.off()

}
