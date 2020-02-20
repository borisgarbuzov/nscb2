#' @export

testUtilCreateLRVof3dArray <- function(replicationCount,
                                       size,
                                       psi,
                                       sigma,
                                       mean) {
  cat("\nTesting \'tests_42_CreateLRVof3dArray\' \n")

  Start <- Sys.time()

  originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                    size = size,
                                                    psi = psi,
                                                    sigma = sigma,
                                                    mean = mean)
  productColReplicated <- createProductColReplicated(originalReplicated)
  LRV3dArray <- createLRVof3dArray(productColReplicated)

  End <- Sys.time()

  duration <- End - Start

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("originalREplicated =", originalReplicated[1:5], "\n")

  cat("Result:\n")
  cat("LRV3dArray = ")
  print(LRV3dArray[1:5])

  cat("originalREplicated =", originalReplicated[1:5], "\n")

  cat("Duration =", duration, "\n")

  testUtilObjectSize(LRV3dArray)

  cat("End of test CreateLRVof3dArray", "\n")

  cat("=====================\n")
}
