plotPhiFactor <- function(minSampleSize = 100,
                          maxSampleSize = 10000,
                          sampleSizeStep = 100) {

  # create array of sampleSizes
  sampleSizeArray <- seq(from = minSampleSize, to = maxSampleSize, by = sampleSizeStep)

  phiFactorArray <- array(data = NA, dim = length(sampleSizeArray))

  for (sampleSizeIndex in seq(sampleSizeArray)) {
    # compute bCov for phiFactor
    bCov <- computeBCov5(sampleSize = sampleSizeArray[sampleSizeIndex])

    # compute phiFactor
    phiFactor <- sqrt(getPHI_K_NORMAL_DIFF() / (sampleSizeArray[sampleSizeIndex] * bCov))
    phiFactorArray[sampleSizeIndex] <- phiFactor
  }

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output", recursive = TRUE)
  }

  fileName <- "output/phiFactorVSSampleSize.svg"

  svg(filename = fileName)

  plot(x = sampleSizeArray, y = phiFactorArray, type = "l", col = "blue",
       xlab = "sample size", ylab = "phiFactor")

  title(main = "Sample size vs phiFactor")

  dev.off()
}
