computeAndSaveZhouStatisticArrays <- function(tParCount = 30,
                                              replicationCount = 100,
                                              minSampleSize = 1000,
                                              maxSampleSize = 10000,
                                              sampleSizeStep = 1000,
                                              isPlot = T) {

  # generate sample size array
  sampleSizeArray <- seq(from = minSampleSize, to = maxSampleSize,
                         by = sampleSizeStep)

  # create parList to generate filename and subtitle for graphic
  parList <- list(tParCount = tParCount,
                  replicationCount = replicationCount,
                  minSampleSize = minSampleSize,
                  maxSampleSize = maxSampleSize,
                  sampleSizeStep = sampleSizeStep)

  sampleSizeQuantile <- array(data = NA, dim = length(sampleSizeArray))

  for (sampleSize in sampleSizeArray) {
    # empty array for computed statistic
    zhouStatisticArray <- array(data = NA, dim = replicationCount)
    parList$sampleSize <- sampleSize
    for (repIndex in 1:replicationCount) {
      sample <- rnorm(n = sampleSize)
      parList$currentRepIndex <- repIndex
      zhouStatisticArray[repIndex] <- computeZhouStatistic(
        tParCount = tParCount,
        sample = sample,
        parList = parList,
        isPlot = isPlot
      )
      cat(replicationCount - repIndex, "replications left\n")
    }
    plotZhouStatistic(zhouStatisticArray = zhouStatisticArray, parList = parList)
    cat(length(sampleSizeArray) - match(sampleSize, sampleSizeArray),
        "sample sizes left\n")
  }
}
