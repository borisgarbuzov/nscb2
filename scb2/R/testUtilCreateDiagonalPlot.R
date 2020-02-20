testUtilCreateDiagonalPlot <- function(sampleSize = 100,
                                       tParCount = 5,
                                       mean = 0,
                                       sigma = 2){
  cat("\n Testing \'tests_scb2_185_createDiagonalPlot\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("mean =", mean, "\n")
  cat("sigma =", sigma, "\n")

  Start <- Sys.time()

  # Check if this directory exists
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  # create first diagonal sample
  diagHorSample1 <- createDiagHorSamplesScaledNoise(sampleSize = sampleSize,
                                                    tParCount = tParCount,
                                                    mean = mean, sigma = sigma)
  diagonalSampleFirst <- diagHorSample1[[2]]

  # create second diagonal sample
  diagHorSample2 <- createDiagHorSamplesScaledNoise(sampleSize = sampleSize,
                                                    tParCount = tParCount,
                                                    mean = mean, sigma = sigma)
  diagonalSampleSecond <- diagHorSample2[[2]]

  # create filename
  fileName <- paste0("output/diagonalSamplePlot, sampleSize=", sampleSize,
                     "tParCount=", tParCount, ".svg")

  # plot diagonal and horizontal sample by calling additional function
  svg(fileName)
  plot(x = diagonalSampleFirst, type = "l", col = "blue", xlab = "Index",
       ylab = "Value", main = "Graph of diagonal samples")

  lines(diagonalSampleSecond, col = "red")

  legend("topright", legend = c("diagonal sample 1", "diagonal sample 2"),
         col = c("blue", "red"), lty=1, cex = 0.8)

  sampleSizeLegend <- paste("Sample size =", sampleSize)
  tParLegend <- paste("tParCount =", tParCount)

  legend("topleft", legend = c(sampleSizeLegend, tParLegend), cex = 0.8)

  dev.off()

  End <- Sys.time()
  duration <- End - Start

  cat("Duration =", duration, "\n")

  cat("End of test createDiagonalPlot", "\n")

  cat("=====================\n")
}
