durationBySampleSizeComputeBetaLrvHat5 <-
  function(fromSampleSize = 1000,
           toSampleSize = 10000,
           stepSampleSize = 1000,
           tParCount = 11)
  {
    sampleSizeArray = seq(fromSampleSize, toSampleSize, stepSampleSize)
    tParArray = createTParArray(tParCount = tParCount)

    time <- array(data = NA, dim = length(sampleSizeArray))
    numberOfPoints <- length(sampleSizeArray)

    globalStart <- Sys.time()
    timeIndex <- 1
    for (sample in sampleSizeArray)
    {
      Start <- Sys.time()

      diagonalSample = createDiagonalSampleTVMA1(sampleSize = sample, mean = 0, sigma = 2)
      computeBetaLrvHat5(sample = diagonalSample, lag = 2, tParArray = tParArray,
                         diagOrHoriz = "diag", typeOfKernel = "gaussian")

      End <- Sys.time()
      duration <- End - Start
      time[timeIndex] <- duration
      timeIndex <- timeIndex + 1
      cat(sample, " ")
      cat(duration, "\n")
    }
    sumDuration <- Sys.time() - globalStart

    svg(filename = "output/durationBySampleSizeComputeBetaLrvHat5.svg")
    plot(x = sampleSizeArray, y = time, col = "red", xlab = "", type = "l",
         ylab = "sec", main = "Duration vs sampleSize for ComputeBetaLrvHat5")
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
              file = "output/durationBySampleSizeComputeBetaLrvHat5.csv", row.names = F)
  }
