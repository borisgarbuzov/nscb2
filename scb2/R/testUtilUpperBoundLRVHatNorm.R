testUtilUpperBoundLRVHatNorm <- function(indexArray,
                                         sigma,
                                         type,
                                         batchSize)
{
  cat("\nTesting \'tests_26_upperBoundLRVHatNorm\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray : (",min(indexArray),":",max(indexArray),") \n")
  cat("sigma :",sigma,"\n")
  cat("type :",type, "\n")
  cat("batchSize :",batchSize,"\n")

  Start <- Sys.time()
  upperBound <- computeUpperBound(indexArray = indexArray,
                                  sigma = sigma,
                                  type = type,
                                  batchSize = batchSize
                                  )
  End <- Sys.time()
  duration <- End - Start

  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("upperBound = \n"); print(upperBound);cat("\n")
  cat("End of test upperBoundLRVHatNorm","\n")

  cat("=====================\n")
}
