testUtilComputeNonRandomFactor <- function(sampleSize,
                                           nonCoverageProbability) {

  cat("\n Testing \'tests_scb2_232_computeNonRandomFactor\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("nonCoverageProbability =", nonCoverageProbability, "\n")

  Start <- Sys.time()

  NonRandomFactor <-
    computeNonRandomFactor(
      sampleSize = sampleSize,
      nonCoverageProbability = nonCoverageProbability
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", NonRandomFactor, "\n")

  cat("End of test computeNonRandomFactor", "\n")
  cat("=====================\n")
}
