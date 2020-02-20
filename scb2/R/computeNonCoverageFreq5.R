computeNonCoverageFreq5 <- function(replicationCount,
                                    tParArray,
                                    lag,
                                    nonCoverageProbability,
                                    parList) {
  # create brick of bands
  bandsBrick <-
    createBandsBrick5(
      replicationCount = replicationCount,
      tParCount = parList$tParCount,
      lag = lag,
      nonCoverageProbability = nonCoverageProbability,
      parList = parList
    )

  # call a function that will return array with 1 if we covered and 0 if we
  # didn't
  isCoveredArray <- computeIsCoveredArray5(
    bandsBrick = bandsBrick,
    tParArray = tParArray,
    replicationCount = replicationCount,
    parList = parList
  )

  # compute frequency of non-coverage
  zeroCount = 0

  for (i in 1:length(isCoveredArray)) {
    if (isCoveredArray[i] == 0) {
      zeroCount <- zeroCount + 1
    }
  }

  nonCoverageFreq <- zeroCount / replicationCount

  return(nonCoverageFreq)
}
