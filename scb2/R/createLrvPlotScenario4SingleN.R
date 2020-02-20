createLrvPlotScenario4SingleN <- function(lrvXArray,
                                          lrvYArray,
                                          trueLrvArray,
                                          sampleSize,
                                          fileName,
                                          tParArray,
                                          bConst = 1,
                                          mConst = 1,
                                          b,
                                          m,
                                          startTime,
                                          bandWidthDegree,
                                          batchSizeDegree,
                                          mySeed,
                                          lag)
{
  arraySize <- length(lrvXArray)
  color1Array <- array(data = "blue", dim = arraySize)
  color2Array <- array(data = "red", dim = arraySize)
  color3Array <- array(data = "black", dim = arraySize)

  svg(fileName)
  plot(x = c(tParArray, tParArray, tParArray), y = c(lrvXArray, lrvYArray, trueLrvArray),
       col = c(color1Array, color2Array, color3Array), xlab = "tPar", ylab = "LRV",
       xlim = c(0, max(tParArray)+tParArray[1]), ylim = c(0, max(c(lrvXArray, lrvYArray, trueLrvArray))),
       main = "Graph for single-N", pch = 21, bg = c(color1Array, color2Array, color3Array))

  legend("bottomright",
         legend = c("true LRV", "diagonal", "horizontal"),
         col = c("black", "blue", "red"), lty=1:1, cex = 0.8)

  sampleSizeLegend <- paste("Sample size =", sampleSize)
  lagLegend <- paste("lag =", lag)
  pointCountLegend <- paste("number of points =", arraySize)
  lastBandWidthLegend <- paste("b =", round(b, 4))
  lastbatchSizeLegend <- paste("m =", m)
  bandWidthLegend <- paste("b = B * n^", bandWidthDegree)
  batchSizeLegend <- paste("m = M * n^", batchSizeDegree)
  bConst = paste("B =", bConst)
  mConst = paste("M =", mConst)
  if(mySeed){
    seed <- "seed is const"
  }else{
    seed <- "seed is random"
  }

  endTime <- Sys.time()
  durationHours <- as.integer(floor(difftime(endTime, startTime, units="hours")))
  durationMins <- as.integer(floor(difftime(endTime, startTime, units="mins"))) %% 60
  durationSecs <- as.integer(floor(difftime(endTime, startTime, units="secs"))) %% 60

  durationLegend <- paste0("duration = ", durationHours, ":",
                           durationMins, ":", durationSecs)

  lines(tParArray, lrvXArray, col = "blue")
  lines(tParArray, lrvYArray, col = "red")

  legend("topleft",
         legend = c(sampleSizeLegend, lagLegend, pointCountLegend,
                    bandWidthLegend, batchSizeLegend,
                    bConst, mConst,
                    lastBandWidthLegend, lastbatchSizeLegend,
                    durationLegend,
                    seed),
         cex = 0.8)

  dev.off()
}
