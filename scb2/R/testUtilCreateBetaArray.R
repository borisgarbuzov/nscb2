#' export

testUtilCreateBetaArray <- function(size,
                                    psi,
                                    sigma,
                                    mean,
                                    maxLag)
{
  cat("\nTesting \'tests_21_createBetaArray\' \n")

  Start <- Sys.time()

  original <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma,
                                mean = mean)

  betaArray <- createBetaMatrix(sample = original,
                               psi = psi,
                               sigma = sigma,
                               maxLag = maxLag)

  End <- Sys.time()
  duration <- End - Start

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("maxLag =", maxLag, "\n")
  cat("original =", original[1:5], "\n")
  cat("Result:\n")
  cat("betaArray = \n")
  print(betaArray)

  dimOfBetaArray <- dim(betaArray)
  dimShouldBe <- c(size - 1, maxLag+1)
  expect_that(dimOfBetaArray, equals(dimShouldBe))
  cat(" - dimensions of betaArray are correct. \n")
 cat("Duration =",duration,"\n")
  cat("End of test createBetaArray","\n")

  cat("=====================\n")
}
