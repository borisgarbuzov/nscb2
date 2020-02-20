testcomputeLRVofOB2dArray <- function(size,
                                      psi,
                                      sigma,
                                      mean,
                                      batchSize)
{
  cat("\nTesting \'tests_43_computeLRVofOB2dArray\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("batchSze",batchSize,"\n")
  cat("=====================\n")

  Start <- Sys.time()

  originalMA1 <- createOriginalMA1(size = size,
                                   psi = psi,
                                   sigma = sigma,
                                   mean = mean)
  lrv <- computeLRVofOB2dArray(original = originalMA1,batchSize = batchSize)

  End <- Sys.time()
  cat("Result:\n")
  cat("productCol = \n")
  print(lrv)

  duration <- End - Start

  cat("Duration =", duration, "\n")
  testUtilObjectSize(lrv)
  cat("End of test computeLRVofOB2dArray","\n")
  cat("=====================\n")
}
