testUtilComputeAndSaveBand5 <- function(sampleSize,
                                        testSample,
                                        tParCount,
                                        lag,
                                        sigma,
                                        mean,
                                        noise,
                                        nonCoverageProbability,
                                        type,
                                        diagOrHoriz,
                                        typeOfKernel,
                                        isTrueLRV,
                                        factorType) {

  cat("\n Testing \'tests_scb2_211_computeAndSaveBand5\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("testSample =", testSample, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("lag =", lag, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("noise =", noise, "\n")
  cat("nonCoverageProbability =", nonCoverageProbability, "\n")
  cat("type =", type, "\n")
  cat("diagOrHoriz =", diagOrHoriz, "\n")
  cat("typeOfKernel =", typeOfKernel, "\n")
  cat("isTrueLRV =", isTrueLRV, "\n")
  cat("factorType =", factorType, "\n")

  Start <- Sys.time()

  band <- computeAndSaveBand5(
    sampleSize = sampleSize,
    testSample = testSample,
    tParCount = tParCount,
    lag = lag,
    sigma = sigma,
    mean = mean,
    noise = noise,
    nonCoverageProbability = nonCoverageProbability,
    type = type,
    diagOrHoriz = diagOrHoriz,
    typeOfKernel = typeOfKernel,
    isTrueLRV = isTrueLRV,
    factorType = factorType
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test computeAndSaveBand5", "\n")
  cat("=====================\n")
}
