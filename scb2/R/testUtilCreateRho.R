#' export

testUtilCreateRho <- function(size,
                              psi) {
  cat("\nTesting \'tests_07_createRho\' \n")


  cat("Test parameters:", "\n")
  cat("psi =", psi, "\n")
  cat("size =", size, "\n")

  Start=Sys.time()

  rho <- createRho(size = size,
                   psi = psi)
  lengthOfRho <- length(rho)

  End=Sys.time()

  Duration=End-Start

  cat("Result:\n")
  cat("rho =", rho[1:5], "\n")

  lengthShouldBe <- size - 1
  expect_that(lengthOfRho, equals(lengthShouldBe))
  cat(" - length of rho array is correct. \n")

  cat("Duration =",Duration, "\n")

  cat("End of test createRho","\n")

  cat("=====================\n")

}
