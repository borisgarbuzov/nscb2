testUtilComputeBCovForME5 <- function(sampleSize) {
  cat("\n Testing \'tests_scb2_222_computeBCovForME5\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")

  Start <- Sys.time()

  bCov <- computeBCovForME5(sampleSize = sampleSize)

  End <- Sys.time()

  duration <- End - Start

  testUtilObjectSize(bCov)
  expect_that(bCov, is_a("numeric"))

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", bCov, "\n")

  cat("End of test computeBCovForME5", "\n")
  cat("=====================\n")
}
