durationBySampleSizeComputeAndSaveBand5 <- function(fromSampleSize = 1000,
                                                    toSampleSize = 10000,
                                                    stepSampleSize = 1000,
                                                    tParCount = 11)
{
  sampleSizeArray = seq(fromSampleSize, toSampleSize, stepSampleSize)

  time <- array(data = NA, dim = length(sampleSizeArray))
  numberOfPoints <- length(sampleSizeArray)

  globalStart <- Sys.time()
  timeIndex <- 1
  for (sample in sampleSizeArray) {
    Start <- Sys.time()

    computeAndSaveBand5(sampleSize = sample,
                        isTrueLRV = T,
                        factorType = "NRF")

    End <- Sys.time()
    duration <- End - Start
    time[timeIndex] <- duration
    timeIndex <- timeIndex + 1
    cat(sample, " ")
    cat(duration, "\n")
  }
  sumDuration <- Sys.time() - globalStart

  svg(filename = "output/durationBySampleSizeComputeAndSaveBand5.svg")
  plot(x = sampleSizeArray, y = time, col = "red", xlab = "", ylab = "sec",
       type = "l", main = "Duration vs sampleSize for ComputeAndSaveBand5")
  par(mar = c(7, 4, 2, 2))
  subTitle <- paste0(" Sample size",
                     "\n fromSampleSize = ", fromSampleSize,
                     ", toSampleSize = ", toSampleSize,
                     ", numberOfPoints = ", numberOfPoints,
                     "\n stepSampleSize = ", stepSampleSize,
                     ", tParCount = ", tParCount,
                     ", sumDuration = ", sumDuration)
  title(sub = subTitle, line = 6)
  dev.off()

  write.csv(x = list(sampleSizeArray = sampleSizeArray,
                     time = time),
            file = "output/durationBySampleSizeComputeAndSaveBand5.csv", row.names = F)
}
