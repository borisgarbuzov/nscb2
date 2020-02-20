#' @export

testUtilCreateOriginalMA1Replicated <- function(replicationCount,
                                                size,
                                                psi,
                                                sigma,
                                                mean) {
  cat("\nTesting \'tests_05_createOriginalMA1Replicated\' \n")

  cat("Test parameters:", "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")

  Start <- Sys.time()

  originalMA1Replicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                       size = size,
                                                       psi = psi,
                                                       sigma = sigma,
                                                       mean = mean)
  End <- Sys.time()

  duration <- End - Start

  cat("Result:\n")
  cat("OriginalMa1Replicated = \n")
  print(originalMA1Replicated[1:5, 1:5])

  expect_that(dim(originalMA1Replicated), equals(c(replicationCount, size)))
  cat(" - dimensions of originalMA1Replicated array are all right. \n")
  cat("Duration =", duration, "\n")
  testUtilObjectSize(originalMA1Replicated)

  cat("End of test createOriginalMA1Replicated","\n")
  cat("=====================\n")

}
