testUtilCreateHorizontalPlot <- function(sampleSize = 100,
                                         tParCount = 5,
                                         mean = 0,
                                         sigma = 2,
                                         tPar = 0.2){
  cat("\n Testing \'tests_scb2_184_createHorizontalPlot\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("mean =", mean, "\n")
  cat("sigma =", sigma, "\n")
  cat("tPar =", tPar, "\n")

  Start <- Sys.time()

  # Check if this directory exists
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  # create first horizontal sample
  diagHorSample1 <- createDiagHorSamplesScaledNoise(sampleSize = sampleSize,
                                                    tParCount = tParCount,
                                                    mean = mean, sigma = sigma)
  horizontal2dSampleFirst <- diagHorSample1[[1]][tPar * tParCount,]

  # create second horizontal sample
  diagHorSample2 <- createDiagHorSamplesScaledNoise(sampleSize = sampleSize,
                                                    tParCount = tParCount,
                                                    mean = mean, sigma = sigma)
  horizontal2dSampleSecond <- diagHorSample2[[1]][tPar * tParCount,]

  # create filename
  fileName <- paste0("output/horizontalSamplePlot, sampleSize=", sampleSize,
                     "tParCount=", tParCount, ".svg")

  # plot diagonal and horizontal sample by calling additional function
  svg(fileName)
  plot(x = horizontal2dSampleFirst, type = "l", col = "blue", xlab = "Index",
       ylab = "Value", main = "Graph of horizontal samples")

  lines(horizontal2dSampleSecond, col = "red")

  legend("topright", legend = c("horizontal sample 1", "horizontal sample 2"),
         col = c("blue", "red"), lty=1, cex = 0.8)

  sampleSizeLegend <- paste("Sample size =", sampleSize)
  tParCountLegend <- paste("tParCount =", tParCount)
  tParLegend <- paste("tPar =", tPar)

  legend("topleft", legend = c(sampleSizeLegend, tParCountLegend, tParLegend),
         cex = 0.8)

  dev.off()

  End <- Sys.time()
  duration <- End - Start

  cat("Duration =", duration, "\n")

  cat("End of test createHorizontalPlot", "\n")

  cat("=====================\n")
}
