testUtilCreateBandsBrick5 <- function(replicationCount,
                                      tParCount,
                                      lag,
                                      nonCoverageProbability,
                                      parList) {

  cat("\n Testing \'tests_scb2_216_createBandsBrick5\' \n")

  cat("\nTest parameters:", "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("lag =", lag, "\n")
  cat("nonCoverageProbability =", nonCoverageProbability, "\n")

  Start <- Sys.time()

  bandsBrick <- createBandsBrick5(
    replicationCount = replicationCount,
    tParCount = tParCount,
    lag = lag,
    nonCoverageProbability = nonCoverageProbability,
    parList = parList
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  expect_that(bandsBrick , is_a("array"))
  testUtilObjectSize(bandsBrick)

  cat("bandsBrick =", bandsBrick, "\n")
  cat("End of test createBandsBrick5", "\n")
  cat("=====================\n")
}
