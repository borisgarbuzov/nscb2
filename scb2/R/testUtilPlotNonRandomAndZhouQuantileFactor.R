testUtilPlotNonRandomAndZhouQuantileFactor <- function(minSampleSize,
                                                       maxSampleSize,
                                                       sampleSizeStep,
                                                       tParCount,
                                                       replicationCount,
                                                       nonCoverageProbability) {

  cat("\n Testing \'tests_scb2_227_plotNonRandomAndZhouQuantileFactor\' \n")

  cat("\nTest parameters:", "\n")
  cat("minSampleSize =", minSampleSize, "\n")
  cat("maxSampleSize =", maxSampleSize, "\n")
  cat("sampleSizeStep =", sampleSizeStep, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("nonCoverageProbability =", nonCoverageProbability, "\n")

  Start <- Sys.time()

  plotNonRandomAndZhouQuantileFactor(
    minSampleSize = minSampleSize,
    maxSampleSize = maxSampleSize,
    sampleSizeStep = sampleSizeStep,
    tParCount = tParCount,
    replicationCount = replicationCount,
    nonCoverageProbability = nonCoverageProbability
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test plotNonRandomAndZhouQuantileFactor", "\n")
  cat("=====================\n")
}
