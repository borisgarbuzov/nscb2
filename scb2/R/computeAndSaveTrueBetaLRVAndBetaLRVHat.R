computeAndSaveTrueBetaLRVAndBetaLRVHat <- function(sampleSize = 1000,
                                                   tParCount = 11,
                                                   lag = 2,
                                                   betaLRVHatCount = 5,
                                                   sigma = 2,
                                                   mean = 0,
                                                   noise = NULL,
                                                   type = "MA1",
                                                   typeOfKernel = "gaussian",
                                                   diagOrHoriz = "diag") {

  # create tParArray
  tParArray <- createTParArray(tParCount = tParCount)

  # get b cov degree
  bCov <- computeBCov5(sampleSize = sampleSize)

  # calculate b and m for a given sample size
  bandWidthOBM <- computeBOBM5(sampleSize = sampleSize)
  batchSize <- computeBatchSize5(sampleSize = sampleSize)

  # compute true Beta LRV by calling function computeTrueLRV tParCount times
  trueBetaLRVArray <- array(data = NA, dim = tParCount)
  for (tIndex in 1:tParCount) {
    trueBetaLRVArray[tIndex] <- computeTrueBetaLrv(tPar = tParArray[tIndex],
                                                   type = type)
  }

  # create empty array for betaLRVHat
  betaLRVHatDoubleArray <- array(data = NA, dim = c(tParCount, betaLRVHatCount))

  # create parList where we store all of additional arguments
  parList <- list(
    sampleSize = sampleSize,
    tParCount = tParCount,
    tParArray = tParArray,
    lag = lag,
    betaLRVHatCount = betaLRVHatCount,
    sigma = sigma,
    mean = mean,
    type = type,
    typeOfKernel = typeOfKernel,
    diagOrHoriz = diagOrHoriz
  )

  # in cycle go through all betaLRVHatCount
  # and on every iteration we create new sample, diagonal or horizontal
  for (index in seq(betaLRVHatCount)) {
    if (diagOrHoriz == "diag") {
      sample <- createDiagonalSampleTVMA1(
        sampleSize = sampleSize,
        mean = mean,
        sigma = sigma,
        noise = noise
      )
    } else if (diagOrHoriz == "horiz") {
      horiz <- createHorizontalSampleTVMA1(
        sampleSize = sampleSize,
        tParCount = tParCount,
        mean = mean,
        sigma = sigma,
        noise = noise
      )
    }

    # in this cycle go thorugh tParArray
    # and for corresponding tPar compute betaLRVHat
    for (tIndex in seq(tParCount)) {
      if (diagOrHoriz == "horiz") {
        sample <- horiz[tIndex, ]
      }

      # create Beta Matrix
      betaColumn <- computeBetaMatrixColumnHat(
        sample = sample,
        lag = lag,
        tPar = tParArray[tIndex],
        bandWidthPowerForGamma = bCov
      )

      # count the squares of the block sums
      squaredBatchSumArray <- sampleSplit(sample = betaColumn,
                                          batchSize = batchSize)

      newSampleSize <- length(squaredBatchSumArray)

      # calculate the LRV for the sample
      betaLRVHatDoubleArray[tIndex, index] <-
        computeKernelLrvHatForSingleTPar(
          sampleSize = newSampleSize,
          squaredBatchSumArray = squaredBatchSumArray,
          tPar = tParArray[tIndex],
          batchSize = batchSize,
          bandWidth = bandWidthOBM,
          typeOfKernel = typeOfKernel
        )

      cat("There are", tParCount - tIndex,
          "tIndexes left until the end of the program\n")
    }
    # create graph and csv
    plotTrueBetaLRVAndBetaLRVHats5(
      tParArray = tParArray,
      trueBetaLRVArray = trueBetaLRVArray,
      betaLRVHatDoubleArray = betaLRVHatDoubleArray,
      index = index,
      parList = parList
    )

    cat("There are", betaLRVHatCount - index, "betaLRVHat left\n")
  }

  parList$name <- "betaLRV"
  computeAndSavePrecision(trueArray = trueBetaLRVArray,
                          hatDoubleArray = betaLRVHatDoubleArray,
                          parList = parList)
}
