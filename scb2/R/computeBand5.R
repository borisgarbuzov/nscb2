computeBand5 <- function(sampleSize = 1000,
                         testSample = NULL,
                         tParCount = 11,
                         lag = 2,
                         sigma = 2,
                         mean = 0,
                         noise = NULL,
                         nonCoverageProbability = 0.2,
                         type = "ScaledNoise",
                         diagOrHoriz = "diag",
                         typeOfKernel = "gaussian",
                         parList) {

  # create tParArray
  tParArray <- createTParArray(tParCount = tParCount)

  # create diagonal or horizontal sample, it depends on diagOrHoriz parameter
  if (is.null(testSample)) {
    if (diagOrHoriz == "diag") {
      sample <- createDiagonalSampleTVMA1(
        sampleSize = sampleSize,
        mean = mean,
        sigma = sigma,
        noise = noise
      )
    } else if (diagOrHoriz == "horiz") {
      sample <- createHorizontalSampleTVMA1(
        sampleSize = sampleSize,
        tParCount = tParCount,
        mean = mean,
        sigma = sigma,
        noise = noise
      )
    }
  } else {
    sample <- testSample
  }

  # compute corHat with lenght tParArray
  corHat <- computeCorHatWithCovBArray(tParArray = tParArray,
                                       sample = sample,
                                       lag = lag,
                                       diagOrHoriz = diagOrHoriz)

  # compute our margin of error
  meByCovHat <- computeMEbyCovHat5(
    tParArray = tParArray,
    lag = lag,
    sample = sample,
    nonCoverageProbability = nonCoverageProbability,
    diagOrHoriz = diagOrHoriz,
    typeOfKernel = typeOfKernel,
    parList = parList
  )

  lower <- corHat - meByCovHat
  upper <- corHat + meByCovHat

  band <- cbind(lower, upper)

  return(band)
}
