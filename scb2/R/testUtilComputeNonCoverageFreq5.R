testUtilComputeNonCoverageFreq5 <- function(replicationCount,
                                            tParArray,
                                            lag,
                                            nonCoverageProbability,
                                            parList) {

  cat("\n Testing \'tests_scb2_218_computeNonCoverageFreq5\' \n")

  cat("\nTest parameters:", "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("tParArray =", tParArray, "\n")
  cat("lag =", lag, "\n")
  cat("nonCoverageProbability =", nonCoverageProbability, "\n")

  Start <- Sys.time()

  nonCoverageFreq <- computeNonCoverageFreq5(
    replicationCount = replicationCount,
    tParArray = tParArray,
    lag = lag,
    nonCoverageProbability = nonCoverageProbability,
    parList = parList
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  expect_that(nonCoverageFreq , is_a("numeric"))
  testUtilObjectSize(nonCoverageFreq)

  cat("nonCoverageFreq =", nonCoverageFreq, "\n")
  cat("End of test computeNonCoverageFreq5", "\n")
  cat("=====================\n")
}
