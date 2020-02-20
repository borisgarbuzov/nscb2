trueGammaAndGammaHatGraphForTParCount <- function(sampleSize = 1000,
                                      tParCount = 100,
                                      lag = 0,
                                      bandWidthPowerForGamma = 1/13,
                                      sigma = 2,
                                      type = "MA1"){
  startTime = Sys.time()
  fileName <- "output/gammaHatTestVisualTParCount.svg"
  tParArray = createTParArray(tParCount)
  bandWidth <- computeBForGamma(sampleSize, -0.26)
  newTParArrayIndex <- createNewTParArrayIndex(tParArray = tParArray,
                                               bandWidth = bandWidth)
  trueGammaArray <- array(data = NA, dim = length(tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]]))
  diagonalGammaArray <- array(data = NA, dim = length(tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]]))
  horizontalGammaArray <- array(data = NA, dim = length(tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]]))
  i = 1
  samples = createDiagHorSamples(sampleSize = sampleSize,
                                 tParCount = tParCount,
                                 sigma = sigma)
  diagonalSample = samples[[2]]
  horizontal2dSample = samples[[1]]
  batchSize = computeBatchSize(sampleSize = sampleSize)
  for(tPar in tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]]){
    trueGammaArray[i] = computeGammaScaledNoise(tPar = tPar, sigma = sigma, lag = lag)
    diagonalGammaArray[i] = computeGammaHat(sampleSize = sampleSize,
                                             tPar = tPar,
                                             bandWidthPowerForGamma = 1/13,
                                             batchSize = batchSize,
                                             sample = diagonalSample,
                                             lag = lag)
    horizontalGammaArray[i] = computeGammaHat(sampleSize = sampleSize,
                                               tPar = tPar,
                                               bandWidthPowerForGamma = 1/13,
                                               batchSize = batchSize,
                                               sample = horizontal2dSample,
                                               lag = lag)
    i = i + 1
  }

  arraySize <- length(trueGammaArray)
  color1Array <- array(data = "blue", dim = arraySize)
  color2Array <- array(data = "red", dim = arraySize)
  color3Array <- array(data = "black", dim = arraySize)

  svg(fileName)
  plot(x = c(tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]], tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]], tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]]),
       y = c(diagonalGammaArray, horizontalGammaArray, trueGammaArray),
       col = c(color1Array, color2Array, color3Array),
       xlab = "tPar", ylab = "Gamma Value",
       xlim = c(0, 1),
       ylim = c(min(c(diagonalGammaArray, horizontalGammaArray, trueGammaArray)),
                max(c(diagonalGammaArray, horizontalGammaArray, trueGammaArray))),
       main = "Graph for gamma", pch = 21, bg = c(color1Array, color2Array, color3Array))
  legend("topright", legend = c("true Gamma", "diagonal", "horizontal"),
         col = c("black", "blue", "red"), lty=1:1, cex = 0.8)

  pointCountLegend <- paste("number of points =", arraySize)
  lastbatchSizeLegend <- paste("last m =", batchSize)
  maxSampleSizeLegend <- paste("Max tPar =", max(tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]]))
  SampleSizeLegend <- paste("Sample size = ", sampleSize)

  endTime <- Sys.time()
  durationHours <- as.integer(floor(difftime(endTime, startTime, units="hours")))
  durationMins <- as.integer(floor(difftime(endTime, startTime, units="mins"))) %% 60
  durationSecs <- as.integer(floor(difftime(endTime, startTime, units="secs"))) %% 60

  durationLegend <- paste0("duration = ", durationHours, ":",
                           durationMins, ":", durationSecs)

  lines(tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]], diagonalGammaArray, col = "blue")
  lines(tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]], horizontalGammaArray, col = "red")
  lines(tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]], trueGammaArray, col = "black")

  legend("topleft", legend = c(pointCountLegend,
                               lastbatchSizeLegend,
                               maxSampleSizeLegend,
                               durationLegend),
         cex = 0.8)

  dev.off()

}
