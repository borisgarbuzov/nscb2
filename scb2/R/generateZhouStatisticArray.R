generateZhouStatisticArray <- function(sampleSize,
                                       tParCount,
                                       replicationCount,
                                       parList = NULL,
                                       isPlot = F) {

  zhouStatisticArray <- array(data = NA, dim = replicationCount)

  for (repIndex in 1:replicationCount) {
    sample <- rnorm(n = sampleSize)
    zhouStatisticArray[repIndex] <- computeZhouStatistic(
      tParCount = tParCount,
      sample = sample,
      parList = parList,
      isPlot = isPlot
    )
    cat(replicationCount - repIndex, "replications of Zhou statistic left\n")
  }
    return(zhouStatisticArray)
}
