testUtilComputeUpperBoundSumNorm <- function(sigma,
                                         sampleSize,
                                         minIndex,
                                         batchSize)
{
  cat("\nTesting \'tests_27_computeUpperBoundSumNorm\' \n")

  cat("Test parameters:", "\n")
  cat("sigma :",sigma,"\n")
  cat("sampleSize :",sampleSize,"\n")
  cat("batchSize :",batchSize,"\n")

  Start <- Sys.time()
  upperBound <- computeUpperBoundSumNorm(sigma = sigma,
                                         sampleSize = sampleSize,
                                         minIndex = minIndex,
                                         batchSize = batchSize)
  End <- Sys.time()
  duration <- End - Start

  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("upperBound = \n"); print(upperBound);cat("\n")
  cat("End of test computeUpperBoundSumNorm","\n")

  cat("=====================\n")
}
