computeAndSaveAlphaHatVsSampleSize <- function(minSampleSize = 1000,
                                               maxSampleSize = 15000,
                                               sampleSizeStep = 1000,
                                               tParCount = 11,
                                               lag = 2,
                                               replicationCount = 1000,
                                               nonCoverageProbability = 0.05,
                                               sigma = 2,
                                               mean = 0,
                                               noise = NULL,
                                               type = "MA1",
                                               diagOrHoriz = "diag",
                                               plotBand = F,
                                               isTrueLRV = T,
                                               factorType = "tabulated mod error") {

  # create tParArray
  tParArray <- createTParArray(tParCount = tParCount)

  # create array with sample sizes
  sampleSizeArray = seq(from = minSampleSize, to = maxSampleSize,
                        by = sampleSizeStep)

  # create empty array for alpha hats
  alphaHatsArray <- array(data = NA, dim = length(sampleSizeArray))

  # create parList where we store all of additional arguments
  parList <- list(
    tParCount = tParCount,
    lag = lag,
    sigma = sigma,
    mean = mean,
    noise = noise,
    type = type,
    replicationCount = replicationCount,
    prob = nonCoverageProbability,
    diagOrHoriz = diagOrHoriz,
    plotBand = plotBand,
    isTrueLRV = isTrueLRV,
    factorType = factorType
  )

  # in cycle go through sampleSizes and compute non-coverage probability
  # for every sample size
  for (index in 1:length(sampleSizeArray)) {
    # update our parList with sample size on every iteration
    parList["sampleSize"] <- sampleSizeArray[index]
    parList["index"] <- index

    alphaHatsArray[index] <- computeNonCoverageFreq5(
      replicationCount = replicationCount,
      tParArray = tParArray,
      lag = lag,
      nonCoverageProbability = nonCoverageProbability,
      parList = parList)

    # call graphic function to plot graph and create csv
    plotAlphaHatVsSampleSize5(alphaHatsArray = alphaHatsArray,
                              sampleSizeArray = sampleSizeArray,
                              parList = parList)

    cat("sample sizes left", length(sampleSizeArray) - index, "\n")
  }
}
