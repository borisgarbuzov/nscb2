testUtilCreateHorizontalScatterPlot <- function(sampleSize = 1000,
                                                tParCount = 5,
                                                mean = 0,
                                                sigma = 2,
                                                replicationSize = 1000,
                                                tPar = 0.2){
  cat("\n Testing \'tests_scb2_187_createHorizontalScatterPlot\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("mean =", mean, "\n")
  cat("sigma =", sigma, "\n")
  cat("replicationSize =", replicationSize, "\n")
  cat("tPar =", tPar, "\n")

  Start <- Sys.time()

  # Check if this directory exists
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  horizontalArray = array(data = 0, dim = c(replicationSize, 2))

  for(replicationCount in 1:replicationSize){
    diagHorSample <- createDiagHorSamplesScaledNoise(sampleSize = sampleSize,
                                                     tParCount = tParCount,
                                                     mean = mean,
                                                     sigma = sigma)
    horizontal2dSample <- diagHorSample[[1]][tPar * tParCount,][2:1]
    horizontalArray[replicationCount,] <- horizontal2dSample
  }

  # create filename
  fileName <- paste0("output/horizontalSampleScatterPlot, sampleSize=",
                     sampleSize, "tParCount=", tParCount, "replicationSize=",
                     replicationSize, ".svg")

  # plot diagonal and horizontal sample by calling additional function
  svg(fileName)

  range = c(min(horizontalArray), max(horizontalArray))

  plot(x = horizontalArray, xlab = "Second column", ylab = "First column",
       xlim = range, ylim = range, yaxs = "i", xaxs = 'i',
       main = "Scatter plot of horizontal samples")
  abline(h = 0, v = 0, lwd = 2)

  sampleSizeLegend <- paste("Sample size =", sampleSize)
  tParCountLegend <- paste("tParCount =", tParCount)
  replicationSizeLegend <- paste("Replication size =", replicationSize)
  tParLegend <- paste("tPar =", tPar)

  legend("topleft", legend = c(sampleSizeLegend, tParCountLegend,
                               tParLegend, replicationSizeLegend), cex = 0.8)

  dev.off()

  End <- Sys.time()
  duration <- End - Start

  cat("Duration =", duration, "\n")

  cat("End of test createHorizontalScatterPlot", "\n")

  cat("=====================\n")
}
