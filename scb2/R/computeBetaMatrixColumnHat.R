computeBetaMatrixColumnHat <- function(sample,
                                       lag,
                                       tPar,
                                       bandWidthPowerForGamma)
  {
  betaMatrixColumnHat <- array(data = NA, dim = length(sample))

  gammaHat0 <- computeCovHatWithCovB(tPar, sample, 0, bandWidthPowerForGamma)

  for (betaMatrixIndex in 1:length(betaMatrixColumnHat)) {
    gammaHat <- computeCovHatWithCovB(tPar, sample, lag, bandWidthPowerForGamma)

    rhoHat <- computeCorHatWithCovB(tPar, sample, lag, bandWidthPowerForGamma)
    betaMatrixColumnHat[betaMatrixIndex] <- computeBetaCell(sample[betaMatrixIndex],
                                                            sample[betaMatrixIndex + lag],
                                                            rhoHat,
                                                            gammaHat0)
  }
  return(betaMatrixColumnHat)
}
