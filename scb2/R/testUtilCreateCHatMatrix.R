#' export

testUtilCreateCHatMatrix <- function(size,
                                     psi,
                                     sigma,
                                     mean) {
  cat("\nTesting \'tests_31_createCHatMatrix\' \n")

  Start <- Sys.time()
  original <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma,
                                mean = mean)
  productCol <- createProductCol(original)
  cHatMatrix <- createCHatMatrix(productCol)
  End <- Sys.time()
  duration <- End - Start
  # dimOfCHatMatrix <- dim(cHatMatrix)
  # dimShouldBe <- rep(x = size - 1, times = 2)
  # expect_that(dimOfCHatMatrix, equals(dimShouldBe))
  # cat(" - dimensions of cHatMatrix are correct. \n")
  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("productCol = \n")
  print(productCol[1:3, 1:3])

  cat("Result:\n")
  cat("cHatMatrix = \n")
  print(cHatMatrix[1:3, 1:3])

  cat("Duration =", duration, "\n")

  testUtilObjectSize(cHatMatrix)

  cat("End of test createCHatMatrix","\n")
  cat("=====================\n")
}
