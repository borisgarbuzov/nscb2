nonRandomFactorAlphaVsB <- function(minSampleSize = 100,
                                    maxSampleSize = 1100,
                                    sampleSizeStep = 100) {

  nonCoverageProbArray <- seq(from = 0, to = 1, by = 1/10)
  sampleSizeArray = seq(from = minSampleSize, to = maxSampleSize,
                        by = sampleSizeStep)
  bCovArray <- array(data = NA, dim = length(sampleSizeArray))
  nonRandomFactorArray <- array(data = NA, dim = c(length(sampleSizeArray),
                                                   length(sampleSizeArray)))

  for (sampleIndex in 1:length(sampleSizeArray)) {
    bCovArray[sampleIndex] <- computeBCov5(sampleSize = sampleSizeArray[sampleIndex])
    for (probIndex in 1:length(nonCoverageProbArray)) {
      bCov <- bCovArray[sampleIndex]
      logSqrt <-  sqrt(-2 * log(bCov))
      cFactor <- logSqrt + (getC_K() - log(log(1 / sqrt (1 - nonCoverageProbArray[probIndex])))) / logSqrt
      phiFactor <- sqrt(getPHI_K_NORMAL_DIFF() / (sampleSizeArray[sampleIndex] * bCov))
      nonRandomFactor <- cFactor * phiFactor
      nonRandomFactorArray[sampleIndex, probIndex] <- nonRandomFactor
    }
  }

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output", recursive = TRUE)
  }

  fileNameCSV <- "output/CSVNonRandomFactorAlphaVsB.csv"
  write.csv(x = list(bCovArray = bCovArray, nonRandomFactorArray = nonRandomFactorArray),
            file = fileNameCSV, row.names = F)

  fileName2D <- "output/heatmapNonRandomFactorAlphaVsB.svg"
  svg(fileName2D)
  image(x = nonCoverageProbArray, y = rev(bCovArray), z = t(nonRandomFactorArray),
        xlab = "alpha", ylab = "b")
  title("Heatmap of phiFactor alpha vs b")
  dev.off()

  fileName3D <- paste0("output/3DNonRandomFactorAlphaVsB.svg")
  svg(fileName3D)
  print(wireframe(t(nonRandomFactorArray), xlab = "alpha", ylab = "b",
                  zlab = "cFactor", drape = T))
  dev.off()
}
