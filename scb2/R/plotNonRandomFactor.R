plotNonRandomFactor <- function(minSampleSize = 100,
                                maxSampleSize = 10000,
                                sampleSizeStep = 100,
                                nonCoverageProbability = 0.2) {

  # create array of sampleSizes
  sampleSizeArray <- seq(from = minSampleSize, to = maxSampleSize, by = sampleSizeStep)

  nonRandomFactorArray <- array(data = NA, dim = length(sampleSizeArray))

  for (sampleSizeIndex in seq(sampleSizeArray)) {
    # compute bCov for phiFactor
    bCov <- computeBCov5(sampleSize = sampleSizeArray[sampleSizeIndex])

    # compute cFactor
    logSqrt <-  sqrt(-2 * log(bCov))
    cFactor <- logSqrt + (getC_K() - log(log(1 / sqrt (1 - nonCoverageProbability)))) / logSqrt
    phiFactor <- sqrt(getPHI_K_NORMAL_DIFF() / (sampleSizeArray[sampleSizeIndex] * bCov))
    nonRandomFactor <- cFactor * phiFactor
    nonRandomFactorArray[sampleSizeIndex] <- nonRandomFactor
  }

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output", recursive = TRUE)
  }

  fileName <- "output/nonRandomFactorVSSampleSize.svg"

  svg(filename = fileName)

  plot(x = sampleSizeArray, y = nonRandomFactorArray, type = "l", col = "blue",
       xlab = "sample size", ylab = "nonRandomFactor")

  title(main = "Sample size vs nonRandomFactor")

  dev.off()
}
