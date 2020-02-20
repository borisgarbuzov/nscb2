createPlotTrueGammaAndGammaHatSingleN <- function(trueGammaArray,
                                                  diagonalGammaArray,
                                                  horizontalGammaArray,
                                                  tParArray,
                                                  sandboxPair,
                                                  bandWidthPowerForGamma,
                                                  bandWidth,
                                                  startTime,
                                                  lag,
                                                  sampleSize,
                                                  fileName){

  arraySize <- length(trueGammaArray)
  color1Array <- array(data = "blue", dim = arraySize)
  color2Array <- array(data = "red", dim = arraySize)
  color3Array <- array(data = "black", dim = arraySize)

  svg(fileName)
  plot(x = c(tParArray[sandboxPair[1]:sandboxPair[2]], tParArray[sandboxPair[1]:sandboxPair[2]], tParArray[sandboxPair[1]:sandboxPair[2]]),
       y = c(diagonalGammaArray, horizontalGammaArray, trueGammaArray),
       col = c(color1Array, color2Array, color3Array),
       xlab = "tPar Value", ylab = "Gamma Value",
       xlim = c(0, 1),
       ylim = c(min(c(diagonalGammaArray, horizontalGammaArray, trueGammaArray)),
                max(c(diagonalGammaArray, horizontalGammaArray, trueGammaArray))),
       main = "Graph for gamma", pch = 21, bg = c(color1Array, color2Array, color3Array))
  legend("bottomright", legend = c("true Gamma", "diagonal", "horizontal"),
         col = c("black", "blue", "red"), lty=1:1, cex = 0.8)

  degreeLegend <- paste("bandWidth degree =", round(bandWidthPowerForGamma, 4))
  lagLegend <- paste("lag =", lag)
  lastBandWidthLegend <- paste("last bandWidth =", round(bandWidth, 4))
  pointCountLegend <- paste("number of points =", arraySize)
  SampleSizeLegend <- paste("sample size =", sampleSize)

  endTime <- Sys.time()
  durationHours <- as.integer(floor(difftime(endTime, startTime, units="hours")))
  durationMins <- as.integer(floor(difftime(endTime, startTime, units="mins"))) %% 60
  durationSecs <- as.integer(floor(difftime(endTime, startTime, units="secs"))) %% 60

  durationLegend <- paste0("duration = ", durationHours, ":",
                           durationMins, ":", durationSecs)

  lines(tParArray[sandboxPair[1]:sandboxPair[2]], diagonalGammaArray, col = "blue")
  lines(tParArray[sandboxPair[1]:sandboxPair[2]], horizontalGammaArray, col = "red")
  lines(tParArray[sandboxPair[1]:sandboxPair[2]], trueGammaArray, col = "black")

  legend("topleft", legend = c(pointCountLegend,
                               SampleSizeLegend,
                               durationLegend,
                               degreeLegend,
                               lagLegend,
                               lastBandWidthLegend),
         cex = 0.8)

  dev.off()
}
