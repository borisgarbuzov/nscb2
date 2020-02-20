cFactorAlphaVsB <- function(minSampleSize = 100,
                            maxSampleSize = 1100,
                            sampleSizeStep = 100) {

  nonCoverageProbArray <- seq(from = 0, to = 1, by = 1/10)
  sampleSizeArray = seq(from = minSampleSize, to = maxSampleSize,
                        by = sampleSizeStep)
  bCovArray <- array(data = NA, dim = length(sampleSizeArray))
  cFactorArray <- array(data = NA, dim = c(length(sampleSizeArray),
                                             length(bCovArray)))

  for (sampleIndex in 1:length(sampleSizeArray)) {
    bCovArray[sampleIndex] <- computeBCov5(sampleSize = sampleSizeArray[sampleIndex])
    for (probIndex in 1:length(nonCoverageProbArray)) {
      bCov <- bCovArray[sampleIndex]
      logSqrt <-  sqrt(-2 * log(bCov))
      cFactor <- logSqrt + (getC_K() - log(log(1 / sqrt (1 - nonCoverageProbArray[probIndex])))) / logSqrt
      cFactorArray[sampleIndex, probIndex] <- cFactor
    }
  }

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output", recursive = TRUE)
  }

  fileNameCSV <- "output/CSVCFactorAlphaVsB.csv"
  write.csv(x = list(bCovArray = bCovArray, cFactorArray = cFactorArray),
            file = fileNameCSV, row.names = F)

  fileName2D <- "output/heatmapCFactorAlphaVsB.svg"
  svg(fileName2D)
  image(x = nonCoverageProbArray, y = rev(bCovArray), z = t(cFactorArray),
        xlab = "alpha", ylab = "b")
  title("Heatmap of cFactor alpha vs b")
  dev.off()

  fileName3D <- paste0("output/3DCFactorAlphaVsB.svg")
  svg(fileName3D)
  print(wireframe(t(cFactorArray), xlab = "alpha", ylab = "b",
                  zlab = "cFactor", drape = T))
  dev.off()
}
