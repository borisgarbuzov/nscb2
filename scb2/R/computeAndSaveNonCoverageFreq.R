computeAndSaveNonCoverageFreq <- function(sampleSize = 1000,
                                          tParCount = 11,
                                          lag = 2,
                                          replicationCount = 1000,
                                          nonCoverageProbabilities =
                                            c(0.01, 0.02, 0.05, 0.07, 0.1, 0.15,
                                              0.2, 0.25),
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

  # empty array for non coverage frequencies
  alphaHats <- array(data = NA, dim = length(nonCoverageProbabilities))

  # create parList where we store all of additional arguments
  parList <- list(
    sampleSize = sampleSize,
    tParCount = tParCount,
    lag = lag,
    sigma = sigma,
    mean = mean,
    noise = noise,
    type = type,
    replicationCount = replicationCount,
    diagOrHoriz = diagOrHoriz,
    plotBand = plotBand,
    isTrueLRV = isTrueLRV,
    factorType = factorType
  )

  # in cycle go through all nonCoverageProbabilities
  for (index in seq(nonCoverageProbabilities)) {
    parList["prob"] <- nonCoverageProbabilities[index]
    parList["index"] <- index

    alphaHats[index] <- computeNonCoverageFreq5(
      replicationCount = replicationCount,
      tParArray = tParArray,
      lag = lag,
      nonCoverageProbability = nonCoverageProbabilities[index],
      parList = parList)

    # create graph and csv
    plotNonCoverageFrequency5(
      alphaHats = alphaHats,
      nonCoverageProbabilities = nonCoverageProbabilities,
      parList = parList)

    cat("probabilities left", length(nonCoverageProbabilities) - index, "\n")
  }
}
