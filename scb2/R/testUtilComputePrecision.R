testUtilComputePrecision <- function(trueArray, hatDoubleArray) {

  cat("\nTesting \'tests_scb2_219_computePrecision\' \n")

  cat("Test parameters:", "\n")

  Start <- Sys.time()

  precisionList <- computePrecision(trueArray = trueArray,
                                    hatDoubleArray = hatDoubleArray)

  End <- Sys.time()

  duration <- End - Start

  cat("Result:\n")
  cat("Duration =", duration, "\n")

  expect_that(precisionList , is_a("list"))
  testUtilObjectSize(precisionList)

  cat("Duration =", duration, "\n")
  cat("End of test computePrecision ", "\n")

  cat("=====================\n")
}
