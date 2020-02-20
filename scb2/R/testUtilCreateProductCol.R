#' @export

testUtilCreateProductCol <- function(size,
                                     psi,
                                     sigma,
                                     mean) {
  cat("\nTesting \'tests_11_createProductCol\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("=====================\n")

  Start <- Sys.time()

  originalMA1 <- createOriginalMA1(size = size,
                                   psi = psi,
                                   sigma = sigma,
                                   mean = mean)
  productCol <- createProductCol(originalMA1)

  End <- Sys.time()

  cat("Result:\n")
  cat("productCol = \n")
  print(productCol[1:5, 1:5])

  duration <- End - Start

  expect_that(dim(productCol), equals(c(size, size)))
  cat(" - dimensions of productCol are all right. \n")
  cat("Duration =", duration, "\n")
  testUtilObjectSize(productCol)
  cat("End of test createProductCol","\n")
  cat("=====================\n")
}
