testUtilComputeIsCoveredArray5 <- function(bandsBrick,
                                           tParArray,
                                           replicationCount,
                                           parList) {

  cat("\n Testing \'tests_scb2_217_computeIsCoveredArray5\' \n")

  cat("\nTest parameters:", "\n")
  cat("bandsBrick =", bandsBrick, "\n")
  cat("tParArray =", tParArray, "\n")
  cat("replicationCount =", replicationCount, "\n")

  Start <- Sys.time()

  isCoveredArray <- computeIsCoveredArray5(
    bandsBrick = bandsBrick,
    tParArray = tParArray,
    replicationCount = replicationCount,
    parList = parList
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  expect_that(isCoveredArray , is_a("array"))
  testUtilObjectSize(isCoveredArray)

  cat("isCovered =", isCoveredArray, "\n")
  cat("End of test computeIsCoveredArray5", "\n")
  cat("=====================\n")
}
