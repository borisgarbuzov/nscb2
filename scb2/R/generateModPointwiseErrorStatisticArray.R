generateModPointwiseErrorStatisticArray <- function(sampleSize,
                                                    tPar,
                                                    replicationCount,
                                                    lag,
                                                    sigma,
                                                    mean) {

  modifiedPointwiseErrorArray <- array(data = NA, dim = replicationCount)

  bCov <- computeBCov5(sampleSize = sampleSize)

  trueRho <- computeRhoMA1(lag = lag,
                           psi = customCoefFunction(tPar))

  trueBetaLrv <- computeTrueBetaLrvMA1(tPar = tPar)

  for (repIndex in 1:replicationCount) {
    sample <- createDiagonalSampleTVMA1(sampleSize = sampleSize,
                                        mean = mean,
                                        sigma = sigma,
                                        noise = NULL)

    rhoHat <- computeCorHatWithCovB(tPar = tPar,
                                    sample = sample,
                                    lag = lag,
                                    bCov = bCov)

    modifiedPointwiseErrorArray[repIndex] <-
      (rhoHat - trueRho) / sqrt(trueBetaLrv)
    cat(replicationCount - repIndex, "replications of modified error left\n")
  }
  return(modifiedPointwiseErrorArray)
}
