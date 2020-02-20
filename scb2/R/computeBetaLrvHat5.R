"Function return array of betaLrvHat"
computeBetaLrvHat5 <- function(sample,
                               lag = lag,
                               tParArray,
                               diagOrHoriz,
                               typeOfKernel){

  if (diagOrHoriz == "horiz") {
    horiz <- sample
    sampleSize <- length(horiz[1, ])
  } else {
    sampleSize <- length(sample)
  }

  # get b cov degree and bandwidth
  bOBM <- computeBOBM5(sampleSize = sampleSize)
  bCov <- computeBCov5(sampleSize = sampleSize)
  batchSize <- computeBatchSize5(sampleSize = sampleSize)

  tParCount <- length(tParArray)

  betaLrvHat <- array(data = NA, dim = tParCount)

  for(tIndex in seq(tParCount)){
    if (diagOrHoriz == "horiz") {
      sample <- horiz[tIndex,]
    }

    "Create Beta Matrix column"
    betaColumn <- computeBetaMatrixColumnHat(sample = sample,
                                             lag = lag,
                                             tPar = tParArray[tIndex],
                                             bandWidthPowerForGamma = bCov)

    "Count the squares of the block sums"
    squaredBatchSumArray <- sampleSplit(sample = betaColumn,
                                        batchSize = batchSize)

    newSampleSize <- length(squaredBatchSumArray)

    "Calculate the LRV for the diagonal sample"
    betaLrvHat[tIndex] <- computeKernelLrvHatForSingleTPar(
      sampleSize = newSampleSize,
      squaredBatchSumArray = squaredBatchSumArray,
      tPar = tParArray[tIndex],
      batchSize = batchSize,
      bandWidth = bOBM,
      typeOfKernel = typeOfKernel
    )

    cat("There are", tParCount - tIndex,
        "tPar for beta LRV left until the end of the cycle\n")
  }

  return(betaLrvHat)
}
