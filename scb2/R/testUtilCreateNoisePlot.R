testUtilCreateNoisePlot <- function(sampleSize = 100,
                                    mean = 0,
                                    sigma = 2){
  cat("\n Testing \'tests_scb2_183_createNoisePlot\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("mean =", mean, "\n")
  cat("sigma =", sigma, "\n")

  Start <- Sys.time()

  # Check if this directory exists
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  # create first noise
  noiseFirst <- createNoise(sampleSize = sampleSize,
                            mean = mean,
                            sd = sigma)

  # create second noise
  noiseSecond <- createNoise(sampleSize = sampleSize,
                             mean = mean,
                             sd = sigma)

  # create filename
  fileName <- paste0("output/noiseSamplePlot, sampleSize = ", sampleSize,
                     "mean=", mean, "sigma=", sigma, ".svg")

  # plot diagonal and horizontal sample by calling additional function
  svg(fileName)
  plot(x = noiseFirst, type = "l", col = "blue", xlab = "Index",
       ylab = "Value", main = "Graph of noise")

  lines(noiseSecond, col = "red")

  legend("topright", legend = c("noise sample 1", "noise sample 2"),
         col = c("blue", "red"), lty=1, cex = 0.8)

  sampleSizeLegend <- paste("Sample size =", sampleSize)
  meanLegend <- paste("mean =", mean)
  sigmaLegend <- paste("sigma = ", sigma)

  legend("topleft", legend = c(sampleSizeLegend, meanLegend, sigmaLegend),
         cex = 0.8)

  dev.off()

  End <- Sys.time()
  duration <- End - Start

  cat("Duration =", duration, "\n")

  cat("End of test createNoisePlot", "\n")

  cat("=====================\n")
}
