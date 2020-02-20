generateModErrorStatisticArray <- function(sampleSize,
                                           tParCount,
                                           replicationCount,
                                           lag,
                                           sigma,
                                           mean) {

  tParArray <- createTParArray(tParCount = tParCount)

  modifiedErrorArray <- array(data = NA, dim = replicationCount)

  trueRhoArray <- array(data = NA, dim = tParCount)
  for (tIndex in 1:tParCount) {
    trueRhoArray[tIndex] <- computeRhoMA1(
      lag = lag,
      psi = customCoefFunction(tParArray[tIndex]))
  }

  trueRhoArray <- zeroArraySidesByBandwidth(myArray = trueRhoArray,
                                            sampleSize = sampleSize)

  trueBetaLrvArray <- array(data = NA, dim = tParCount)
  for (tIndex in 1:tParCount) {
    trueBetaLrvArray[tIndex] <- computeTrueBetaLrvMA1(tPar = tParArray[tIndex])
  }

  for (repIndex in 1:replicationCount) {
    sample <- createDiagonalSampleTVMA1(sampleSize = sampleSize,
                                        mean = mean,
                                        sigma = sigma,
                                        noise = NULL)

    rhoHatArray <- computeCorHatWithCovBArray(tParArray = tParArray,
                                              sample = sample,
                                              lag = lag,
                                              diagOrHoriz = "diag")

    rhoHatArray <- zeroArraySidesByBandwidth(myArray = rhoHatArray,
                                             sampleSize = sampleSize)

    modifiedErrorArray[repIndex] <- computeModError(
      trueRhoArray = trueRhoArray,
      trueBetaLrvArray = trueBetaLrvArray,
      rhoHatArray = rhoHatArray
    )
    cat(replicationCount - repIndex, "replications of modified error left\n")
  }
  return(modifiedErrorArray)
}
