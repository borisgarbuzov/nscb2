computeAndSaveTwoHists <- function(sampleSize = 1000,
                                   tParCount = 30,
                                   replicationCount = 1000,
                                   lag = 2,
                                   sigma = 2,
                                   mean = 0) {

  parList <- list(sampleSize = sampleSize,
                  tParCount = tParCount,
                  replicationCount = replicationCount,
                  lag = lag,
                  sigma = sigma,
                  mean = mean)

  # for RHS, Zhou statistic
  zhouStatisticArray <- generateZhouStatisticArray(
    sampleSize = sampleSize,
    tParCount = tParCount,
    replicationCount = replicationCount,
    parList = NULL,
    isPlot = F)

  modifiedErrorArray <- generateModErrorStatisticArray(
    sampleSize = sampleSize,
    tParCount = tParCount,
    replicationCount = replicationCount,
    lag = lag,
    sigma = sigma,
    mean = mean)

  plotTwoHists(zhouStatisticArray = zhouStatisticArray,
               modifiedErrorArray = modifiedErrorArray,
               parList = parList)
}
