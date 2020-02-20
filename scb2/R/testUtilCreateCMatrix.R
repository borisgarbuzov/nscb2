#' export

testUtilCreateCMatrix <- function(size,
                                  sigma,
                                  psi) {
  cat("\nTesting \'tests_01_createCMatrix\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")

  Start <- Sys.time()

  cMatrix <- createCMatrix(size = size,
                           sigma = sigma,
                           psi = psi)
  End <- Sys.time()

  duration <- End - Start

  cat("Result:\n")
  cat("cmatrix = \n")
  print(cMatrix[1:5, 1:5])

  dimOfCMatrix <- dim(cMatrix)
  dimShouldBe <- c(9, 9)
  expect_that(dimOfCMatrix, equals(dimShouldBe))
  cat(" - dimensions of cMatrix are correct. \n")

  cat("Duration =", duration, "\n")

  testUtilObjectSize(cMatrix)

  cat("End of test createCMatrix","\n")

  cat("=====================\n")

}
