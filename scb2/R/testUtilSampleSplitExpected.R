testUtilSampleSplitExpected <- function(sample,
                                batchSize,
                                expected) {

  cat("\n Testing \'tests_scb2_248_sampleSplit\' \n")

  cat("\nTest parameters:", "\n")
  cat("sample =", sample, "\n")
  cat("batchSize =", batchSize, "\n")
  cat("expected =", expected, "\n")

  Start <- Sys.time()

  sampleSplitArray <-
    sampleSplit(
      sample = sample,
      batchSize = batchSize
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  result = FALSE
  if (sampleSplitArray == expected)
    result = TRUE
  cat("result =", result, "\n")

  cat("End of test plotNonRandomAndZhouQuantileFactor", "\n")
  cat("=====================\n")
}
