computeAndSaveGammaAndGammaHats <- function(sampleSize = 1000,
                                            tParCount = 11,
                                            lag = 2,
                                            gammaHatCount = 5,
                                            sigma = 2,
                                            mean = 0,
                                            noise = NULL,
                                            type = "MA1",
                                            diagOrHoriz = "diag",
                                            isPrecision = F) {

  # create tParArray
  tParArray <- createTParArray(tParCount = tParCount)

  # get bandWidth for b cov
  bCov <- computeBCov5(sampleSize = sampleSize)

  # create empty array for gammaTrue
  trueGammaArray <- array(data = NA, dim = tParCount)

  # create empty array for rhoHat
  gammaHatDoubleArray <- array(data = NA, dim = c(tParCount, gammaHatCount))

  for (tIndex in 1:tParCount) {
    trueGammaArray[tIndex] <- computeGamma(
      psi = customCoefFunction(tParArray[tIndex]), sigma = sigma, lag = lag,
      type = type)
  }

  # in cycle go through all rhoHatCount
  # and on every iteration we create new sample, diagonal or horizontal
  for (index in seq(gammaHatCount)) {
    if (diagOrHoriz == "diag") {
      sample <- createDiagonalSampleTVMA1(
        sampleSize = sampleSize,
        mean = mean,
        sigma = sigma,
        noise = noise
      )
    } else if (diagOrHoriz == "horiz") {
      horiz <- createHorizontalSampleTVMA1(
        sampleSize = sampleSize,
        tParCount = tParCount,
        mean = mean,
        sigma = sigma,
        noise = noise
      )
    }

    # compute gammaHat
    for (tIndex in 1:tParCount) {
      if (diagOrHoriz == "horiz") {
        sample <- horiz[tIndex,]
      }

      gammaHatDoubleArray[tIndex, index] <- computeCovHatWithCovB(
        tPar = tParArray[tIndex],
        sample = sample,
        lag = lag,
        bCov = bCov)
    }
  }

  # create parList where we store all of additional arguments
  parList <- list(
    sampleSize = sampleSize,
    tParCount = tParCount,
    tParArray = tParArray,
    lag = lag,
    gammaHatCount = gammaHatCount,
    sigma = sigma,
    mean = mean,
    noise = noise,
    type = type,
    diagOrHoriz = diagOrHoriz
  )

  parList$name <- "Covariance"
  if(isPrecision){
    computeAndSavePrecision(trueArray = trueGammaArray,
                            hatDoubleArray = gammaHatDoubleArray,
                            parList = parList)
  }


  # create graph and csv
  plotGammaAndGammaHats(
   tParArray = tParArray,
   trueGammaArray = trueGammaArray,
   gammaHatDoubleArray = gammaHatDoubleArray,
   parList = parList)
}
