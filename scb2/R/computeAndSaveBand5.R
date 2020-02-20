computeAndSaveBand5 <- function(sampleSize = 2000,
                                testSample = NULL,
                                tParCount = 11,
                                lag = 2,
                                sigma = 2,
                                mean = 0,
                                noise = NULL,
                                nonCoverageProbability = 0.05,
                                type = "MA1",
                                diagOrHoriz = "diag",
                                typeOfKernel = "gaussian",
                                isTrueLRV = T,
                                factorType = "tabulated mod error") {

  # compute trueRhoArray by calling function computeRho tParCount times
  trueRhoArray <- array(data = NA, dim = tParCount)

  for (tIndex in 1:tParCount) {
    trueRhoArray[tIndex] <- computeRho(type = type, psi = tParArray[tIndex],
                                       lag = lag)
  }

  # compute tParArray
  tParArray <- createTParArray(tParCount = tParCount)

  # compute BOBM bandwidth
  bandWidthCov <- computeBCov5(sampleSize = sampleSize)

  # create parList where we store all of additional arguments
  parList <- list(
    sampleSize = sampleSize,
    tParCount = tParCount,
    lag = lag,
    sigma = sigma,
    mean = mean,
    prob = nonCoverageProbability,
    bandWidthCov = bandWidthCov,
    type = type,
    diagOrHoriz = diagOrHoriz,
    isTrueLRV = isTrueLRV,
    factorType = factorType
  )


  # compute band
  band <- computeBand5(sampleSize = sampleSize,
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
                       parList = parList)

  # create graph and csv
  plotBand5(band = band,
            tParArray = tParArray,
            rhoArray = trueRhoArray,
            parList = parList)
}
