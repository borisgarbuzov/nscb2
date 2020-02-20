testUtilCreateLRVof2dArrayForOriginalRC <- function(size,
                                       replicationCount,
                                       psi,
                                       sigma,
                                       mean) {
  cat("\nTesting \'tests_41_CreateLRVof2dArray\' \n")

  Start <- Sys.time()

  original <- createOriginalMA1Replicated(size = size,
                                          replicationCount = replicationCount,
                                          psi = psi,
                                          sigma = sigma,
                                          mean = mean)
  LVR2DArray=createLRVof2dArray(original)

  End <- Sys.time()

  duration <- End - Start

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("original =", original[1:5], "\n")

  cat("Result:\n")
  cat("LRV2DArray =", LVR2DArray, "\n")

  cat("Duration =", duration, "\n")

  testUtilObjectSize(LVR2DArray)

  cat("End of test CreateLRVof2dArray","\n")
  cat("=====================\n")
}
