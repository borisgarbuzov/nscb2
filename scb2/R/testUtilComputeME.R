#'@export
testUtilComputeME <- function(tParArray,
                              lag,
                              lagCount,
                              sample,
                              bandwidth,
                              nonCoverageProbability,
                              allCorHats,
                              C_K = -1.978325,
                              PHI_K_NORMAL_DIFF = 0.4065)
{

  mySampleSize=length(sample)
  betaLRVHat = testUtilComputeBetaLRVHat(tParArray = tParArray,
                                        lag = lag,
                                        sample = sample,
                                        allCorHats = allCorHats,
                                        bandwidth = bandwidth)


  logSqrt <-  sqrt(-2 * log (bandwidth))
  cFactor <- logSqrt + (C_K - log (log (1 / sqrt (1 - nonCoverageProbability)))) / logSqrt

  sampleSize=length(sample)
  meByCovHat <- cFactor *
    betaLRVHat *
    sqrt(PHI_K_NORMAL_DIFF / (sampleSize * bandwidth))
}



