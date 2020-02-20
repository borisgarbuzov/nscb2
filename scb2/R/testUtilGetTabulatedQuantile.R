testUtilGetTabulatedQuantile <- function(sampleSize,
                                         nonCoverageProbability) {

  cat("\n Testing \'tests_scb2_246_testUtilGetTabulatedQuantile\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("nonCoverageProbability =", nonCoverageProbability, "\n")

  Start <- Sys.time()

  quantile <-
    getTabulatedQuantile(
      sampleSize = sampleSize,
      nonCoverageProbability = nonCoverageProbability
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", quantile, "\n")

  cat("End of test getTabulatedQuantile", "\n")
  cat("=====================\n")
}
