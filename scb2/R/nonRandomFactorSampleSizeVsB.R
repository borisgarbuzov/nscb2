nonRandomFactorSampleSizeVsB <- function(minSampleSize = 100,
                                         maxSampleSize = 1000,
                                         sampleSizeStep = 100,
                                         nonCoverageProb = 0.2) {

  sampleSizeArray = seq(from = minSampleSize, to = maxSampleSize,
                        by = sampleSizeStep)
  bCovArray <- array(data = NA, dim = length(sampleSizeArray))
  nonRandomFactorArray <- array(data = NA, dim = c(length(sampleSizeArray),
                                                   length(sampleSizeArray)))

  for (bIndex in 1:length(sampleSizeArray)) {
    bCovArray[bIndex] <- computeBCov5(sampleSize = sampleSizeArray[bIndex])
    for (sampleIndex in 1:length(sampleSizeArray)) {
      bCov <- bCovArray[bIndex]
      logSqrt <-  sqrt(-2 * log(bCov))
      cFactor <- logSqrt + (getC_K() - log(log(1 / sqrt (1 - nonCoverageProb)))) / logSqrt
      phiFactor <- sqrt(getPHI_K_NORMAL_DIFF() / (sampleSizeArray[sampleIndex] * bCov))
      nonRandomFactor <- cFactor * phiFactor
      nonRandomFactorArray[bIndex, sampleIndex] <- nonRandomFactor
    }
  }

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output", recursive = TRUE)
  }

  fileNameCSV <- "output/CSVNonRandomFactorSampleSizeVsB.csv"
  write.csv(x = list(bCovArray = bCovArray, nonRandomFactorArray = nonRandomFactorArray),
            file = fileNameCSV, row.names = F)

  fileName2D <- "output/heatmapNonRandomFactorSampleSizeVsB.svg"
  svg(fileName2D)
  image(x = rev(bCovArray), y = sampleSizeArray, z = t(nonRandomFactorArray),
        xlab = "b", ylab = "sample size")
  title("Heatmap of nonRandomFactor vs independent b and sample size")
  dev.off()

  fileName3D <- paste0("output/3DNonRandomFactorSampleSizeVsB.svg")
  svg(fileName3D)
  print(wireframe(t(nonRandomFactorArray), xlab = "b", ylab = "sample size",
                  zlab = list("nonRandomFactor", rot = 90), drape = T))
  dev.off()
}
