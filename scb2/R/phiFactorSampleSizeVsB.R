phiFactorSampleSizeVsB <- function(minSampleSize = 100,
                                   maxSampleSize = 1000,
                                   sampleSizeStep = 100) {

  sampleSizeArray = seq(from = minSampleSize, to = maxSampleSize,
                        by = sampleSizeStep)
  bCovArray <- array(data = NA, dim = length(sampleSizeArray))
  phiFactorArray <- array(data = NA, dim = c(length(sampleSizeArray),
                                             length(bCovArray)))

  for (bIndex in 1:length(sampleSizeArray)) {
    bCovArray[bIndex] <- computeBCov5(sampleSize = sampleSizeArray[bIndex])
    for (sampleIndex in 1:length(sampleSizeArray)) {
      bCov <- bCovArray[bIndex]
      phiFactor <- sqrt(getPHI_K_NORMAL_DIFF() / (sampleSizeArray[sampleIndex] * bCov))
      phiFactorArray[bIndex, sampleIndex] <- phiFactor
    }
  }

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output", recursive = TRUE)
  }

  fileNameCSV <- "output/CSVPhiFactorSampleSizeVsB.csv"
  write.csv(x = list(bCovArray = bCovArray, phiFactorArray = phiFactorArray),
            file = fileNameCSV, row.names = F)

  fileName2D <- "output/heatmapPhiFactorSampleSizeVsB.svg"
  svg(fileName2D)
  image(x = rev(bCovArray), y = sampleSizeArray, z = t(phiFactorArray),
        xlab = "b", ylab = "sample size")
  title("Heatmap of phiFactor vs independent b and sample size")
  dev.off()

  fileName3D <- paste0("output/3DPhiFactorSampleSizeVsB.svg")
  svg(fileName3D)
  print(wireframe(t(phiFactorArray), xlab = "b", ylab = "sample size",
                  zlab = "phiFactor", drape = T))
  dev.off()
}
