zeroCoveringNormalSymmetricIntervalTest <- function(replicationCount,
                                                    coverageProb) {
  alpha = 1 - coverageProb
  newP = 1 - alpha/2
  cat("newP = ", newP, "\n")

  normalQuantile = qnorm(p = newP)
  cat("normalQuantile = ", normalQuantile, "\n")

  normalSample = rnorm(n=replicationCount)
  hist(normalSample)

  leftArray = array(data = NA, dim = replicationCount)
  rightArray = array(data = NA, dim = replicationCount)

  for (obsIndex in 1 : replicationCount)
  {
    obs = normalSample [obsIndex]
    left = obs - normalQuantile
    leftArray [obsIndex] = left
    right = obs + normalQuantile
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

  return (pHat)
}
