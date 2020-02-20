testUtilComputeAndSaveNonCoverageFreq <- function(sampleSize,
                                                  tParCount,
                                                  lag,
                                                  replicationCount,
                                                  nonCoverageProbabilities,
                                                  sigma,
                                                  mean,
                                                  noise,
                                                  type,
                                                  diagOrHoriz,
                                                  plotBand,
                                                  isTrueLRV,
                                                  factorType) {

  cat("\n Testing \'tests_scb2_210_computeAndSaveNonCoverageFreq\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("lag =", lag, "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("nonCoverageProbabilities =", nonCoverageProbabilities, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("noise =", noise, "\n")
  cat("type =", type, "\n")
  cat("diagOrHoriz =", diagOrHoriz, "\n")
  cat("plotBand =", plotBand, "\n")
  cat("isTrueLRV =", isTrueLRV, "\n")
  cat("factorType =", factorType, "\n")

  Start <- Sys.time()

  square <- computeAndSaveNonCoverageFreq(
    sampleSize = sampleSize,
    tParCount = tParCount,
    lag = lag,
    replicationCount = replicationCount,
    nonCoverageProbabilities = nonCoverageProbabilities,
    sigma = sigma,
    mean = mean,
    noise = noise,
    type = type,
    diagOrHoriz = diagOrHoriz,
    plotBand = plotBand,
    isTrueLRV = isTrueLRV,
    factorType = factorType
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test computeAndSaveNonCoverageFreq", "\n")
  cat("=====================\n")
}
