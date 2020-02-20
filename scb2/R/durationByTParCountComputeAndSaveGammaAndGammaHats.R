durationByTParCountComputeAndSaveGammaAndGammaHats <-
  function(sampleSize = 1000,
           minTParCount = 11,
           maxTParCount = 32,
           tParCountStep = 2,
           gammaHatCount = 1)
  {
    tParCountArray = seq(minTParCount, maxTParCount, tParCountStep)

    time <- array(data = NA, dim = length(tParCountArray))
    numberOfPoints <- length(tParCountArray)

    globalStart <- Sys.time()
    timeIndex <- 1
    for (tParCount in tParCountArray)
    {
      Start <- Sys.time()

      computeAndSaveGammaAndGammaHats(sampleSize = sampleSize, tParCount = tParCount,
                                      gammaHatCount = gammaHatCount)

      End <- Sys.time()
      duration <- End - Start
      time[timeIndex] <- duration
      timeIndex <- timeIndex + 1
      cat(tParCount, " ")
      cat(duration, "\n")
    }
    sumDuration <- Sys.time() - globalStart

    svg(filename = "output/durationBySampleSizeComputeAndSaveGammaAndGammaHats.svg")
    plot(x = tParCountArray, y = time, col = "red", xlab = "", type = "l",
         ylab = "sec", main = "Duration vs tParCount for ComputeAndSaveGammaAndGammaHats")
    par(mar = c(7, 4, 2, 2))
    subTitle <- paste0(" tParCount",
                       "\n minTParCount = ", minTParCount,
                       ", maxTParCount = ", maxTParCount,
                       ", numberOfPoints = ", numberOfPoints,
                       "\n tParCountStep = ", tParCountStep,
                       ", sampleSize = ", sampleSize,
                       ", sumDuration = ", sumDuration)
    title(sub = subTitle, line = 6)
    dev.off()

    write.csv(x = list(tParCountArray = tParCountArray,
                       time = time),
              file = "output/durationByTParCountComputeAndSaveGammaAndGammaHats.csv", row.names = F)
  }
