testUtilCreateDiagonalScatterPlot <- function(sampleSize = 1000,
                                              tParCount = 5,
                                              mean = 0,
                                              sigma = 2,
                                              replicationSize = 1000){
  cat("\n Testing \'tests_scb2_188_createDiagonalScatterPlot\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("mean =", mean, "\n")
  cat("sigma =", sigma, "\n")
  cat("replicationSize =", replicationSize, "\n")

  Start <- Sys.time()

  # Check if this directory exists
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  diagonalArray = array(data = 0, dim = c(replicationSize, 2))

  for(replicationCount in 1:replicationSize){
    diagHorSample <- createDiagHorSamplesScaledNoise(sampleSize = sampleSize,
                                                     tParCount = tParCount,
                                                     mean = mean,
                                                     sigma = sigma)
    diagonalSample <- diagHorSample[[2]][2:1]
    diagonalArray[replicationCount,] <- diagonalSample
  }

  # create filename
  fileName <- paste0("output/diagonalSampleScatterPlot, sampleSize=",
                     sampleSize, "tParCount=", tParCount, "replicationSize=",
                     replicationSize, ".svg")

  # plot diagonal and horizontal sample by calling additional function
  svg(fileName)

  range = c(min(diagonalArray), max(diagonalArray))

  plot(x = diagonalArray, xlab = "Second column", ylab = "First column",
       xlim = range, ylim = range, yaxs = "i", xaxs = 'i',
       main = "Scatter plot of diagonal samples")
  abline(h = 0, v = 0, lwd = 2)

  sampleSizeLegend <- paste("Sample size =", sampleSize)
  tParLegend <- paste("tParCount =", tParCount)
  replicationSizeLegend <- paste("Replication size =", replicationSize)

  legend("topleft", legend = c(sampleSizeLegend, tParLegend,
                               replicationSizeLegend), cex = 0.8)

  dev.off()

  End <- Sys.time()
  duration <- End - Start

  cat("Duration =", duration, "\n")

  cat("End of test createDiagonalScatterPlot", "\n")

  cat("=====================\n")
}
