getTabulatedQuantile <- function(sampleSize, nonCoverageProbability)
{
  mySample <- getSampleFromCsv(sampleSize = sampleSize)

  # take column with desired sample size and compute quantile for desired alpha
  tabulatedQuantile <- quantile(x = mySample,
                                probs = 1 - nonCoverageProbability)
  return(tabulatedQuantile)
}
