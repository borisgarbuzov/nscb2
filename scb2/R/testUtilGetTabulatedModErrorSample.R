testUtilGetTabulatedModErrorSample <- function(sampleSize) {

  cat("\n Testing \'tests_scb2_247_testUtilGetTabulatedModErrorSample\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")

  Start <- Sys.time()

  tabulatedModErrorSample <-
    getTabulatedModErrorSample(
      sampleSize = sampleSize
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  # cat("result =", tabulatedModErrorSample, "\n")

  cat("End of test getTabulatedModErrorSample", "\n")
  cat("=====================\n")
}
