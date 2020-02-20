computeAndSaveNonCoverageFreqVsME <- function(sampleSize = 1000,
                                              tParCount = 11,
                                              replicationCount = 100,
                                              meMin = 0,
                                              meMax = 1,
                                              meStep = 0.01,
                                              sigma = 2,
                                              mean = 0,
                                              lag = 2) {

  # create empty arrays for alpha hat and cor hat
  # and arrays with t and me
  tParArray <- createTParArray(tParCount = tParCount)
  meArray <- seq(from = meMin, to = meMax, by = meStep)
  nonCoverageArray <- array(data = NA, dim = length(meArray))
  corHatArray <- array(data = NA, dim = c(replicationCount, tParCount))

  # parameter list for graphic function and computeIsCovered
  parList <- list(
    sampleSize = sampleSize,
    tParCount = tParCount,
    lag = lag,
    sigma = sigma,
    mean = mean,
    replicationCount = replicationCount,
    type = "MA1",
    plotBand = F)

  # compute our double array (r x n) for correlation
  for (replication in 1:replicationCount) {
    sample <- createDiagonalSampleTVMA1(sampleSize = sampleSize,
                                        mean = mean,
                                        sigma = sigma)
    corHatArray[replication,] <-
      computeCorHatWithCovBArray(
        tParArray = tParArray,
        sample = sample,
        lag = lag,
        diagOrHoriz = "diag"
      )
    cat("CorHats left", replicationCount - replication, "\n")
  }

  # here in two cycles compute alpha hat for every me in array
  for (meIndex in 1:length(meArray)) {
    isCoveredArray <- array(data = NA, dim = replicationCount)
    for (replication in 1:replicationCount) {
      corHat <- corHatArray[replication,]
      lower <- corHat - meArray[meIndex]
      upper <- corHat + meArray[meIndex]
      band <- cbind(lower, upper)

      isCoveredArray[replication] <- computeIsCovered5(band = band,
                                                       tParArray = tParArray,
                                                       parList = parList)

      cat("Replications left", replicationCount - replication, "\n")
    }

    zeroCount = 0
    for (i in 1:replicationCount) {
      if (isCoveredArray[i] == 0) {
        zeroCount <- zeroCount + 1
      }
    }
    nonCoverageFreq <- zeroCount / replicationCount
    nonCoverageArray[meIndex] <- nonCoverageFreq

    cat("ME left", length(meArray) - meIndex, "\n")
  }

  # compute true beta LRV
  betaLrvHat <- array(data = NA, dim = length(tParArray))
  for (tIndex in 1:length(tParArray)) {
    betaLrvHat[tIndex] <- computeTrueBetaLrvMA1(tPar = tParArray[tIndex])
  }

  betaLrvHatMean <- mean(betaLrvHat)

  # create so-called ideal factor
  idealFactor <- meArray / betaLrvHatMean

  plotNonCoverageFrequencyVsME(nonCoverageArray = nonCoverageArray,
                               meArray = idealFactor,
                               parList = parList)
}
