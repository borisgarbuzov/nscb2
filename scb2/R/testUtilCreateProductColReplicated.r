#' @export

testUtilCreateProductColReplicated <- function(replicationCount,
                                               size,
                                               psi,
                                               sigma,
                                               mean) {
  cat("\nTesting \'tests_12_createProductColReplicated\' \n")


  cat("Test parameters:", "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("=====================\n")

  Start <- Sys.time()

  originalMA1Replicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                       size = size,
                                                       psi = psi,
                                                       sigma = sigma,
                                                       mean = mean)
  productColReplicated <- createProductColReplicated(originalMA1Replicated)

  End <- Sys.time()

  duration <- End - Start

  cat("Result:\n")
  cat("createProductColReplicated:\n")
  print(productColReplicated[1:3, 1:3, 1:3])

  expect_that(dim(productColReplicated), equals(c(size, size, replicationCount)))
  cat(" - dimensions of productColReplicated are all right. \n")

  testUtilObjectSize(productColReplicated)
  cat("Duration =", duration, "\n")
  cat("End of test createProductColReplicated","\n")
  cat("=====================\n")


}
