#' export

testUtilCreateBetaArrayReplicated <- function(replicationCount,
                                              size,
                                              psi,
                                              sigma,
                                              mean) {
  cat("\nTesting \'tests_22_createBetaArrayReplicated\' \n")

  Start <- Sys.time()

  originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                    size = size,
                                                    psi = psi,
                                                    sigma = sigma,
                                                    mean = mean)
  betaArrayReplicated <- createBetaArrayReplicated(originalReplicated = originalReplicated,
                                                   psi = psi,
                                                   sigma = sigma)

  End <- Sys.time()
  duration <- End - Start
  cat("Test parameters:", "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("originalReplicated =", originalReplicated[1:5], "\n")

  cat("Result:\n")
  cat("betaArrayReplicated = \n")

  dimOfBetaArrayReplicated <- dim(betaArrayReplicated)
  dimShouldBe <- c(size - 1, size, replicationCount)
  expect_that(dimOfBetaArrayReplicated, equals(dimShouldBe))
  cat(" - dimensions of betaArrayReplicated are all right. \n")

  cat("Duration =", duration, "\n")

  cat("End of test createBetaArrayreplicated","\n")
  cat("=====================\n")
}
