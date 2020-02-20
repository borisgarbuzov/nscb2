testUtilCreateNoiseScatterPlot <- function(sampleSize = 1000,
                                           mean = 0,
                                           sigma = 2,
                                           replicationSize = 1000){
  cat("\n Testing \'tests_scb2_186_createNoiseScatterPlot\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("mean =", mean, "\n")
  cat("sigma =", sigma, "\n")
  cat("replicationSize =", replicationSize, "\n")

  Start <- Sys.time()

  # Check if this directory exists
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  noiseArray = array(data = 0, dim = c(replicationSize, 2))

  for(replicationCount in 1:replicationSize){
    noise <- createNoise(sampleSize = sampleSize,
                         mean = mean,
                         sd = sigma)
    noiseArray[replicationCount,] <- noise[2:1]
  }

  # create filename
  fileName <- paste0("output/noiseSampleScatterPlot, sampleSize=",
                     sampleSize, "mean", mean, "sigma", sigma,
                     "replicationSize=", replicationSize, ".svg")

  # plot diagonal and horizontal sample by calling additional function
  svg(fileName)

  range = c(min(noiseArray), max(noiseArray))

  plot(x = noiseArray, xlab = "Second column", ylab = "First column",
       xlim = range, ylim = range, yaxs = "i", xaxs = 'i',
       main = "Scatter plot of noise")
  abline(h = 0, v = 0, lwd = 2)

  sampleSizeLegend <- paste("Sample size =", sampleSize)
  meanLegend <- paste("mean =", mean)
  sigmaLegend <- paste("sigma =", sigma)
  replicationSizeLegend <- paste("Replication size =", replicationSize)

  legend("topleft", legend = c(sampleSizeLegend, meanLegend, sigmaLegend,
                               replicationSizeLegend), cex = 0.8)

  dev.off()

  End <- Sys.time()
  duration <- End - Start

  cat("Duration =", duration, "\n")

  cat("End of test createNoiseScatterPlot", "\n")

  cat("=====================\n")
}
