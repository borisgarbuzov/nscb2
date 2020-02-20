testUtilComputeAndSaveSnakes3D <- function(minSampleSize,
                                           maxSampleSize,
                                           sampleSizeStep,
                                           bConstMin,
                                           bConstMax,
                                           bConstStep,
                                           tParCount,
                                           replicationCount,
                                           lag,
                                           sigma,
                                           mean,
                                           nonCoverageProbability) {

  cat("\n Testing \'tests_scb2_231_computeAndSaveSnakes3D.R\' \n")

  cat("\nTest parameters:", "\n")
  cat("minSampleSize =", minSampleSize, "\n")
  cat("maxSampleSize =", maxSampleSize, "\n")
  cat("sampleSizeStep =", sampleSizeStep, "\n")
  cat("bConstMin =", bConstMin, "\n")
  cat("bConstMax =", bConstMax, "\n")
  cat("bConstStep =", bConstStep, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("lag =", lag, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("nonCoverageProbability =", nonCoverageProbability, "\n")

  Start <- Sys.time()

  computeAndSaveSnakes3D(
    minSampleSize = minSampleSize,
    maxSampleSize = maxSampleSize,
    sampleSizeStep = sampleSizeStep,
    bConstMin = bConstMin,
    bConstMax = bConstMax,
    bConstStep = bConstStep,
    tParCount = tParCount,
    replicationCount = replicationCount,
    lag = lag,
    sigma = sigma,
    mean = mean,
    nonCoverageProbability = nonCoverageProbability
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test computeAndSaveSnakes3D", "\n")
  cat("=====================\n")
}
