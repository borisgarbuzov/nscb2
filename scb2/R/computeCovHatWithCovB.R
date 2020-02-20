computeCovHatWithCovB <- function(tPar,
                                  sample,
                                  lag,
                                  bCov) {
  sampleSize <- length(sample)
  partialSum <- 0

  for (termIndex in 1:(sampleSize-lag))
  {
    term <- sample[termIndex] *
      sample[termIndex + lag] *
      customKernel((termIndex/sampleSize - tPar) / bCov)
    partialSum <- partialSum + term
  }

  covHat <- partialSum / (sampleSize * bCov)
  return (covHat)
}
