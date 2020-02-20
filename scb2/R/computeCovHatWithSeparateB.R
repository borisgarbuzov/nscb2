computeCovHatWithSeparateB <- function(tPar,
                                       sample,
                                       lag,
                                       bandWidth) {
  sampleSize <- length(sample)
  partialSum <- 0

  for (termIndex in 1:(sampleSize-lag))
  {
    term <- sample[termIndex] *
      sample[termIndex + lag] *
      customKernel((termIndex/sampleSize - tPar) / bandWidth)
    partialSum <- partialSum + term
  }

  covHat <- partialSum / (sampleSize * bandWidth)
  return (covHat)
}
