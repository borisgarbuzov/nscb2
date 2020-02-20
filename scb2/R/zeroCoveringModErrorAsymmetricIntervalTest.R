zeroCoveringModErrorAsymmetricIntervalTest <- function(sampleSize,
                                                       tParCount,
                                                       replicationCount,
                                                       lag,
                                                       sigma,
                                                       mean,
                                                       coverageProb) {
  alpha = 1 - coverageProb
  sample = generateModErrorStatisticArray(sampleSize, tParCount, replicationCount, lag, sigma, mean)

  quantile = getTabulatedQuantile(sampleSize, alpha)
  cat("quantile = ", quantile, "\n")


  leftArray = array(data = NA, dim = replicationCount)
  rightArray = array(data = NA, dim = replicationCount)

  for (obsIndex in 1 : replicationCount)
  {
    obs = sample[obsIndex]

    left = obs - quantile
    leftArray [obsIndex] = left
    right = 0
    rightArray [obsIndex] = right
  }

  isLess = leftArray <= 0
  cat("head(isLess) = ", head(isLess), "\n")

  isGreater =  rightArray >= 0
  cat("head(isGreater) = ", head(isGreater), "\n")

  isBetween = isLess & isGreater
  cat("head(isBetween) = ", head(isBetween), "\n")
  head(isBetween)

  indicatorBetween = as.numeric(isBetween)
  cat("head(indicatorBetween) = ", head(indicatorBetween), "\n")

  pHat = mean(indicatorBetween)
  cat("pHat = ", pHat, "\n")
  return(pHat)
}

# zeroCoveringModErrorAsymmetricIntervalTest(sampleSize=10000, tParCount = 11, replicationCount = 100, lag = 2, sigma = 2, mean = 0, coverageProb = 0.95)

