testUtilComputeSqareRootBatchSizeUpperBound <- function(indexArray,
                                                        sigma,
                                                        type)
 {
  cat("\nTesting \'tests_25_computeSqareRootBatchSizeUpperBound\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray : (",min(indexArray),":",max(indexArray),") \n")
  cat("sigma :",sigma,"\n")
  cat("type :",type, "\n")


  Start <- Sys.time()
  upperBound <- computeSqareRootBatchSizeUpperBound(indexArray,
                                                    sigma,
                                                    type)
  End <- Sys.time()
  duration <- End - Start

  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("upperBound = \n"); print(upperBound);cat("\n")
  cat("End of test computeSqareRootBatchSizeUpperBound","\n")

  cat("=====================\n")
}
