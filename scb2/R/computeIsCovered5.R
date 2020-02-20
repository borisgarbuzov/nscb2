computeIsCovered5 <- function(band,
                              tParArray,
                              parList) {

  # get tParCount from list with parametrs
  tParCount <- parList$tParCount

  # calculate bandWidthOBM for a given sample size
  bandWidthCov <- computeBCov5(sampleSize = parList$sampleSize)

  # save bandWidthOBM in parList
  parList["bandWidthCov"] <- bandWidthCov

  # compute trueRhoArray by calling function computeRho tParCount times
  rhoArray <- array(data = NA, dim = parList$tParCount)

  for (tIndex in 1:parList$tParCount) {
    rhoArray[tIndex] <- computeRho(type = parList$type, psi = tParArray[tIndex],
                                   lag = parList$lag)
  }

  # check if we want to plot each band in our brick
  if (parList$plotBand == T) {
    plotBand5(band = band,
              tParArray = tParArray,
              rhoArray = rhoArray,
              parList = parList)
  }

  isCoveredArrayByT <- array(data = 0, dim = tParCount)

  # get lower and upper bounds
  upperBound <- band[, 2]
  lowerBound <- band[, 1]

  # compute coverage for each tPar
  for (tParIndex in seq(tParCount)) {
    if (tParArray[tParIndex] < bandWidthCov |
        tParArray[tParIndex] > (1 - bandWidthCov)) {
      isCoveredArrayByT[tParIndex] <- 1
    }
    if (rhoArray[tParIndex] <= upperBound[tParIndex] &
        rhoArray[tParIndex] >= lowerBound[tParIndex]) {
      isCoveredArrayByT[tParIndex] <- 1
    }
  }

  isCovered <- prod(isCoveredArrayByT)

  return(isCovered)
}
