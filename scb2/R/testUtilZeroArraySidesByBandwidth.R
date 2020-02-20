testUtilZeroArraySidesByBandwidth <- function(myArray,
                                              sampleSize) {

  cat("\n Testing \'tests_scb2_245_testUtilZeroArraySidesByBandwidth\' \n")

  cat("\nTest parameters:", "\n")
  cat("myArray =", myArray, "\n")
  cat("sampleSize =", sampleSize, "\n")

  Start <- Sys.time()

  zeroArray <- zeroArraySidesByBandwidth(
    myArray = myArray,
    sampleSize = sampleSize
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", zeroArray, "\n")

  cat("End of test zeroArraySidesByBandwidth", "\n")
  cat("=====================\n")
}
