#'@export
testUtilComputeCovHat<- function(tParArray,
                                 lag,
                                 sample,
                                 bandwidth)
{
  kernel <- normalDifferenceKernel
  partialSum <- 0
  sampleSize <- length(sample)
  termCountSequence <- seq_len(sampleSize - lag)

  for (termIndex in termCountSequence)
  {
    term <- sample[termIndex] *
      sample[termIndex + lag] *
      kernel((termIndex/sampleSize - tParArray) / bandwidth)

    partialSum <- partialSum + term
  }
  covHat <- partialSum / (sampleSize * bandwidth)
  return (covHat)
}
