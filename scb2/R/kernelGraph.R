kernelGraph <- function(sampleSize = 1000,
                                      tPar=0.5,
                                      lag = 0,
                                      bandWidthPowerForGamma = -1/13,
                                      sigma = 2,
                                      type = "MA1"){
  startTime = Sys.time()
  fileName <- paste0("output/kernelGraph", "sampleSize=", sampleSize , "tPar=", tPar,
                     "bandWidthPowerForGamma=", bandWidthPowerForGamma, ".svg")
  allKernelArrays = c()
  allIndexArrays = c()
  for (i in 1:5) {
    bandWidth <- computeBForGamma(sampleSize, bandWidthPowerForGamma)
    sampleSize = sampleSize + sampleSize
    kernelArray <- computeKernelArray(sampleSize,
                                         tPar,
                                         bandWidth)
    indexArray = c(1:length(kernelArray))
    allKernelArrays = c(allKernelArrays, kernelArray)
    allIndexArrays = c(allIndexArrays, indexArray)
    if (i==5){
      maxKernelValue = max(kernelArray)
      minKernelValue = min(kernelArray)
    }
  }
  arraySize <- length(allKernelArrays)
  color1Array <- array(data = "blue", dim = arraySize)

  svg(fileName)
  plot(x = allIndexArrays,
       y = allKernelArrays,
       col = color1Array,
       xlab = "index", ylab = "Kernel Value",
       xlim = c(0, sampleSize),
       ylim = c(minKernelValue,
                maxKernelValue),
       main = "Graph for kernel", pch = 21, bg = color1Array)


  SampleSizeLegend <- paste("Sample size = ", sampleSize)

  endTime <- Sys.time()
  durationHours <- as.integer(floor(difftime(endTime, startTime, units="hours")))
  durationMins <- as.integer(floor(difftime(endTime, startTime, units="mins"))) %% 60
  durationSecs <- as.integer(floor(difftime(endTime, startTime, units="secs"))) %% 60

  durationLegend <- paste0("duration = ", durationHours, ":",
                           durationMins, ":", durationSecs)

  bandWidthLegend <- paste0("bandWidthPower = ", round(bandWidthPowerForGamma, 4))
  tParLegend <- paste0("tPar = ", round(tPar, 4))
  legend("topleft", legend = c(SampleSizeLegend,
                               bandWidthLegend,
                               tParLegend,
                               durationLegend),
         cex = 0.8)

  dev.off()

}
