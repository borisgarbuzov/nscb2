computeNonRandomFactor <- function(sampleSize,
                                   nonCoverageProbability) {
  # compute bCov for phiFactor
  bCov <- computeBCov5(sampleSize = sampleSize)

  logSqrt <- sqrt(-2 * log(bCov))
  cFactor <- logSqrt + (getC_K(type = "normal") - log(log(1 / sqrt (
    1 - nonCoverageProbability
  )))) / logSqrt
  phiFactor <- sqrt(getPHI_K(type = "normal") / (sampleSize * bCov))
  nonRandomFactor <- cFactor * phiFactor

  return(nonRandomFactor)
}
