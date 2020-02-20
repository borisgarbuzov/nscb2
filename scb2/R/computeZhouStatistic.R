computeZhouStatistic <- function(tParCount,
                                 sample,
                                 parList = NULL,
                                 isPlot = F) {

  sampleSize <- length(sample)

  # compute b covariance
  bCov <- computeBCov5(sampleSize = sampleSize)

  # create tParArray from -1 to 2 with lenght tParCount + 1
  tParMax <- 1
  tParMin <- 0
  tParStep <- (tParMax - tParMin) / (tParCount - 1)
  tParArray <- seq(from = tParMin, to = tParMax, by = tParStep)

  # empty array for our kernel sum
  kernelSumArray <- array(data = NA, dim = length(tParArray))

  for (tParIndex in 1:tParCount) {
    tPar <- tParArray[tParIndex]
    kernelSum <- 0
    for (termIndex in 1:sampleSize) {
      term <- customKernel((termIndex/sampleSize - tPar) / bCov) *
        sample[termIndex]
      kernelSum <- kernelSum + term
    }
    kernelSumArray[tParIndex] <- kernelSum
  }

  kernelSumArray <- kernelSumArray / (sampleSize * bCov)

  kernelSumArray <- zeroArraySidesByBandwidth(myArray = kernelSumArray,
                                              sampleSize = sampleSize)

  zhouStatistic <- max(abs(kernelSumArray))

  if (isPlot == T) {
    plotKernelSumArray(kernelSumArray = kernelSumArray,
                       tParArray = tParArray,
                       parList = parList)
  }

  return(zhouStatistic)
}
