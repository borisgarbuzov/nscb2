testUtilComputeBand5 <- function(sampleSize,
                                 testSample,
                                 tParCount,
                                 lag,
                                 sigma,
                                 mean,
                                 noise,
                                 nonCoverageProbability,
                                 type,
                                 diagOrHoriz,
                                 typeOfKernel) {

  cat("\n Testing \'tests_scb2_212_computeBand5\' \n")

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

  Start <- Sys.time()

  parList <- list(isTrueLRV = T,
                  factorType = "NRF")

  band <- computeBand5(
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
    parList = parList
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  expect_that(band , is_a("matrix"))
  testUtilObjectSize(band)

  cat("band =", band, "\n")
  cat("End of test computeBand5", "\n")
  cat("=====================\n")
}
