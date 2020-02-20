#' export

testUtilCreateDHatMatrix <- function(size,
                                     psi,
                                     sigma,
                                     mean,
                                     maxLag) {
  cat("\nTesting \'tests_32_createDHatMatrix\' \n")

  Start <- Sys.time()

  original <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma,
                                mean = mean)

  betaArray <- createBetaMatrix(sample = original,
                               psi = psi,
                               sigma = sigma,
                               maxLag = maxLag)
  dHatMatrix <- createDHatMatrix(betaArray = betaArray)
  End <- Sys.time()

  duration <- End - Start

  # dimOfCHatMatrix <- dim(dHatMatrix)
  # dimShouldBe <- rep(x = size - 1, times = 2)
  # expect_that(dimOfCHatMatrix, equals(dimShouldBe))
  # cat(" - dimensions of cHatMatrix are correct. \n")
  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("betaArray = \n")
  print(betaArray[1:3, 1:3])

  cat("Result:\n")
  cat("dHatMatrix = \n")
  print(dHatMatrix[1:3, 1:3])

  cat("Duration =", duration, "\n")

  testUtilObjectSize(dHatMatrix)

  cat("End of test createDHatMatrix","\n")
  cat("=====================\n")
}
