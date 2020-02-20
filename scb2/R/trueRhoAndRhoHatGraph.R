trueRhoAndRhoHatGraph <- function(minSampleSize = 100,
                                  maxSampleSize = 5000,
                                  sampleSizeStep = 100,
                                  tPar = 0.5,
                                  lag = 1,
                                  bandWidthPowerForGamma = 1/13,
                                  sigma = 2,
                                  tParCount = 11,
                                  type = "MA1"){
  startTime = Sys.time()
  fileName <- "output/rhoHatTestVisual.svg"
  sampleSizeArray = seq(from = minSampleSize, to = maxSampleSize, by = sampleSizeStep)
  trueRhoArray <- array(data = NA, dim = length(sampleSizeArray))
  diagonalRhoArray <- array(data = NA, dim = length(sampleSizeArray))
  horizontalRhoArray <- array(data = NA, dim = length(sampleSizeArray))
  i = 1
  for(sampleSize in sampleSizeArray){
    samples = createDiagHorSamples(sampleSize = sampleSize,
                                   tParCount = tParCount,
                                   sigma = sigma)
    diagonalSample = samples[[2]]
    horizontal2dSample = samples[[1]]
    batchSize = computeBatchSize(sampleSize = sampleSize)
    trueRhoArray[i] = computeRhoScaledNoise(lag = lag)
    diagonalGamma0 = computeGammaHat(sampleSize = sampleSize,
                                    tPar = tPar,
                                    bandWidthPowerForGamma = 1/13,
                                    batchSize = batchSize,
                                    sample = diagonalSample,
                                    lag = 0)
    horizontalGamma0 = computeGammaHat(sampleSize = sampleSize,
                                      tPar = tPar,
                                      bandWidthPowerForGamma = 1/13,
                                      batchSize = batchSize,
                                      sample = horizontal2dSample,
                                      lag = 0)
    diagonalGamma = computeGammaHat(sampleSize = sampleSize,
                                    tPar = tPar,
                                    bandWidthPowerForGamma = 1/13,
                                    batchSize = batchSize,
                                    sample = diagonalSample,
                                    lag = lag)
    horizontalGamma = computeGammaHat(sampleSize = sampleSize,
                                      tPar = tPar,
                                      bandWidthPowerForGamma = 1/13,
                                      batchSize = batchSize,
                                      sample = horizontal2dSample,
                                      lag = lag)
    diagonalRhoArray[i] = computeRhoHat(diagonalGamma, diagonalGamma0)
    horizontalRhoArray[i] = computeRhoHat(horizontalGamma, horizontalGamma0)
    i = i + 1
  }

  arraySize <- length(trueRhoArray)
  color1Array <- array(data = "blue", dim = arraySize)
  color2Array <- array(data = "red", dim = arraySize)
  color3Array <- array(data = "black", dim = arraySize)

  svg(fileName)
  plot(x = c(sampleSizeArray, sampleSizeArray, sampleSizeArray),
       y = c(diagonalRhoArray, horizontalRhoArray, trueRhoArray),
       col = c(color1Array, color2Array, color3Array),
       xlab = "Sample size", ylab = "Gamma Value",
       xlim = c(0, sampleSizeArray[length(sampleSizeArray)] + sampleSizeArray[1]),
       ylim = c(min(c(diagonalRhoArray, horizontalRhoArray, trueRhoArray)),
                max(c(diagonalRhoArray, horizontalRhoArray, trueRhoArray))),
       main = "Graph for gamma", pch = 21, bg = c(color1Array, color2Array, color3Array))
  legend("topright", legend = c("true Rho", "diagonal", "horizontal"),
         col = c("black", "blue", "red"), lty=1:1, cex = 0.8)

  tLegend <- paste("t =", tPar)
  pointCountLegend <- paste("number of points =", arraySize)
  lastbatchSizeLegend <- paste("last m =", batchSize)
  maxSampleSizeLegend <- paste("Max sample size =", max(sampleSizeArray))

  endTime <- Sys.time()
  durationHours <- as.integer(floor(difftime(endTime, startTime, units="hours")))
  durationMins <- as.integer(floor(difftime(endTime, startTime, units="mins"))) %% 60
  durationSecs <- as.integer(floor(difftime(endTime, startTime, units="secs"))) %% 60

  durationLegend <- paste0("duration = ", durationHours, ":",
                           durationMins, ":", durationSecs)

  lines(sampleSizeArray, diagonalRhoArray, col = "blue")
  lines(sampleSizeArray, horizontalRhoArray, col = "red")
  lines(sampleSizeArray, trueRhoArray, col = "black")

  legend("topleft", legend = c(tLegend, pointCountLegend,
                               lastbatchSizeLegend,
                               maxSampleSizeLegend,
                               durationLegend),
         cex = 0.8)

  dev.off()

}
