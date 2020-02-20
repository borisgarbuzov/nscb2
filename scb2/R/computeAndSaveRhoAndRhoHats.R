computeAndSaveRhoAndRhoHats <- function(sampleSize = 1000,
                                        tParCount = 11,
                                        lag = 2,
                                        rhoHatCount = 5,
                                        sigma = 2,
                                        mean = 0,
                                        noise = NULL,
                                        type = "MA1",
                                        diagOrHoriz = "diag",
                                        isPrecision = F) {

  # create tParArray
  tParArray <- createTParArray(tParCount = tParCount)

  #compute trueRhoArray by calling function computeRho tParCount times
  trueRhoArray <- array(data = NA, dim = tParCount)

  for (tIndex in 1:tParCount) {
    trueRhoArray[tIndex] <- computeRho(type = type,
                                       lag = lag,
                                       psi = customCoefFunction(tParArray[tIndex]))
  }

  # create empty array for rhoHat
  rhoHatDoubleArray <- array(data = NA, dim = c(tParCount, rhoHatCount))

  # in cycle go through all rhoHatCount
  # and on every iteration we create new sample, diagonal or horizontal
  for (index in seq(rhoHatCount)) {
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

    # compute rhoHat
    rhoHatDoubleArray[, index] <- computeCorHatWithCovBArray(
      tParArray = tParArray,
      sample = sample,
      lag = lag,
      diagOrHoriz = diagOrHoriz)
  }

  # create parList where we store all of additional arguments
  parList <- list(
    sampleSize = sampleSize,
    tParCount = tParCount,
    tParArray = tParArray,
    lag = lag,
    rhoHatCount = rhoHatCount,
    sigma = sigma,
    mean = mean,
    noise = noise,
    type = type,
    diagOrHoriz = diagOrHoriz
  )

  parList$name <- "Correlation"
  if(isPrecision){
    computeAndSavePrecision(trueArray = trueRhoArray,
                           hatDoubleArray = rhoHatDoubleArray,
                           parList = parList)
  }



  # create graph and csv
  plotRhoAndRhoHats5(
   tParArray = tParArray,
   trueRhoArray = trueRhoArray,
   rhoHatDoubleArray = rhoHatDoubleArray,
   parList = parList
  )
}
