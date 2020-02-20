testUtilCreateLambdaArrayForOBiid <- function(indexArray,
                                              sigma,
                                              type,
                                              batchSize)
{
  cat("\nTesting \'tests_28_createLambdaArrayForOBiid\' \n")

  cat("Test parameters:", "\n")
  cat("sigma :",sigma,"\n")
  cat("batchSize :",batchSize,"\n")
  cat("type :",type, "\n")
  cat("indexArray :\n"); print(indexArray); cat("\n")

  Start <- Sys.time()
  upperBound <- computeLambdaArray(indexArray = indexArray,
                                   sigma = sigma,
                                   type = type,
                                   batchSize = batchSize)
  End <- Sys.time()
  duration <- End - Start

  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("upperBound = \n"); print(upperBound);cat("\n")
  cat("End of test createLambdaArrayForOBiid","\n")

  cat("=====================\n")
}
