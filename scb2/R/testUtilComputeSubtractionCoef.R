testUtilComputeSubtractionCoef <- function(sampleSize) {

  cat("\n Testing \'tests_scb2_244_testUtilComputeSubtractionCoef\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")

  Start <- Sys.time()

  subtractionCoef <- computeSubtractionCoef(
    sampleSize = sampleSize
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", subtractionCoef, "\n")

  cat("End of test computeSubtractionCoef", "\n")
  cat("=====================\n")
}
