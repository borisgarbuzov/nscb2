#' export

testUtilCreateDMatrix <- function(size,
                                  sigma,
                                  psi) {
  cat("\nTesting \'tests_02_createDMatrix\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")

  Start <- Sys.time()
  dMatrix <- createDMatrix(size = size,
                           sigma = sigma,
                           psi = psi)
  End <- Sys.time()

  duration <- End - Start

  cat("Result:\n")
  cat("dMatrix = \n")
  print(dMatrix[1:5, 1:5])

  dimOfDMatrix <- dim(dMatrix)
  dimShouldBe <- c(size - 1, size - 1)

  expect_that(dimOfDMatrix, equals(dimShouldBe))
  cat(" - dimensions of dMatrix are correct. \n")

  cat("Duration =", duration, "\n")

  testUtilObjectSize(dMatrix)

  cat("End of test createDMatrix","\n")

  cat("=====================\n")


}
