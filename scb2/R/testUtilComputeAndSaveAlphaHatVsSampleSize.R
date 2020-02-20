testUtilComputeAndSaveAlphaHatVsSampleSize <- function(minSampleSize,
                                                       maxSampleSize,
                                                       sampleSizeStep,
                                                       tParCount,
                                                       lag,
                                                       replicationCount,
                                                       nonCoverageProbability,
                                                       sigma,
                                                       mean,
                                                       noise,
                                                       type,
                                                       diagOrHoriz,
                                                       plotBand) {

  cat("\n Testing \'tests_scb2_209_computeAndSaveAlphaHatVsSampleSize\' \n")

  cat("\nTest parameters:", "\n")
  cat("minSampleSize =", minSampleSize, "\n")
  cat("maxSampleSize =", maxSampleSize, "\n")
  cat("sampleSizeStep =", sampleSizeStep, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("lag =", lag, "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("noise =", noise, "\n")
  cat("type =", type, "\n")
  cat("diagOrHoriz =", diagOrHoriz, "\n")
  cat("plotBand =", plotBand, "\n")

  Start <- Sys.time()

  snake <- computeAndSaveAlphaHatVsSampleSize(
    minSampleSize = minSampleSize,
    maxSampleSize = maxSampleSize,
    sampleSizeStep = sampleSizeStep,
    tParCount = tParCount,
    lag = lag,
    replicationCount = replicationCount,
    nonCoverageProbability = nonCoverageProbability,
    sigma = sigma,
    mean = mean,
    noise = noise,
    type = type,
    diagOrHoriz = diagOrHoriz,
    plotBand = plotBand,
    factorType = "NRF"
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test computeAndSaveAlphaHatVsSampleSize", "\n")
  cat("=====================\n")
}
