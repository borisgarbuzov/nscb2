#' export

testUtilCreateGamma <- function(sigma,
                                psi) {
  cat("\nTesting \'tests_06_createGamma\' \n")
  cat("Test parameters:", "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")

  Start=Sys.time()

  gamma <- createGamma(sigma = sigma,
                       psi = psi)

  End=Sys.time()

  Duration=End-Start

  cat("Result:\n")
  cat("gamma =", gamma, "\n")

  lengthOfGamma <- length(gamma)
  lengthShouldBe <- 2
  expect_that(lengthOfGamma, equals(lengthShouldBe))
  cat(" - length of gamma array is correct. \n")

  cat("Duration =",Duration, "\n")

  cat("End of test createGamma","\n")

  cat("=====================\n")

}
