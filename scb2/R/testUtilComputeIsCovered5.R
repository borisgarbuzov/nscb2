testUtilComputeIsCovered5 <- function(band,
                                      tParArray,
                                      parList) {

  cat("\n Testing \'tests_scb2_215_computeIsCovered5\' \n")

  cat("\nTest parameters:", "\n")
  cat("band =", band, "\n")
  cat("tParArray =", tParArray, "\n")

  Start <- Sys.time()

  isCovered <- computeIsCovered5(
    band = band,
    tParArray = tParArray,
    parList = parList
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  expect_that(isCovered , is_a("numeric"))
  testUtilObjectSize(isCovered)

  cat("isCovered =", isCovered, "\n")
  cat("End of test computeMEbyCovHat5", "\n")
  cat("=====================\n")
}
