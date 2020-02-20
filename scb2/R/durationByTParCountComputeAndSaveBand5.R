durationByTParCountComputeAndSaveBand5 <- function(sampleSize = 1000,
                                                   minTParCount = 10,
                                                   maxTParCount = 20,
                                                   tParCountStep = 2)
{
  tParCountArray = seq(minTParCount, maxTParCount, tParCountStep)

  time <- array(data = NA, dim = length(tParCountArray))
  numberOfPoints <- length(tParCountArray)

  globalStart <- Sys.time()
  timeIndex <- 1
  for (tParCount in tParCountArray) {
    Start <- Sys.time()

    computeAndSaveBand5(sampleSize = sampleSize,
                        tParCount = tParCount,
                        isTrueLRV = T,
                        factorType = "NRF")

    End <- Sys.time()
    duration <- End - Start
    time[timeIndex] <- duration
    timeIndex <- timeIndex + 1
    cat(tParCount, " ")
    cat(duration, "\n")
  }
  sumDuration <- Sys.time() - globalStart

  svg(filename = "output/durationByTParCountComputeAndSaveBand5.svg")
  plot(x = tParCountArray, y = time, col = "red", xlab = "", type = "l",
       ylab = "sec", main = "Duration vs tParCount for ComputeAndSaveBand5")
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
            file = "output/durationByTParCountComputeAndSaveBand5.csv", row.names = F)
  }
