plotNonRandomAndZhouQuantileFactor <- function(minSampleSize = 10,
                                               maxSampleSize = 100,
                                               sampleSizeStep = 10,
                                               tParCount = 100,
                                               replicationCount = 100,
                                               nonCoverageProbability = 0.06) {

  # create array of sampleSizes
  sampleSizeArray <- seq(from = minSampleSize, to = maxSampleSize, by = sampleSizeStep)

  nonRandomFactorArray <- array(data = NA, dim = length(sampleSizeArray))
  bootstrapNRFArray <- array(data = NA, dim = length(sampleSizeArray))

  for (sampleSizeIndex in seq(sampleSizeArray)) {
    # compute bCov for phiFactor
    bCov <- computeBCov5(sampleSize = sampleSizeArray[sampleSizeIndex])

    # compute non-random factor for every sample size in array and add values to
    # array
    logSqrt <-  sqrt(-2 * log(bCov))
    cFactor <-
      logSqrt + (getC_K(type = "normal") - log(log(1 / sqrt (
        1 - nonCoverageProbability
      )))) / logSqrt
    phiFactor <-
      sqrt(getPHI_K(type = "normal") / (sampleSizeArray[sampleSizeIndex] * bCov))
    nonRandomFactor <- cFactor * phiFactor
    nonRandomFactorArray[sampleSizeIndex] <- nonRandomFactor

    # same thing for Zhou quantile
    zhouStatisticArray <-
      generateZhouStatisticArray(
        sampleSize = sampleSizeArray[sampleSizeIndex],
        tParCount = tParCount,
        replicationCount = replicationCount
      )
    bootstrapNRFArray[sampleSizeIndex] = quantile(x = zhouStatisticArray,
                                                  probs = 1 - nonCoverageProbability)
  }

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output", recursive = TRUE)
  }

  fileName <- "output/nonRandomFactorAndZhouQuantileVSSampleSize"
  fileNameCSV <- paste0(fileName, ".csv")
  fileNameGraph <- paste0(fileName, ".svg")
  # write data to csv file
  write.csv(x = list(sampleSizeArray = sampleSizeArray,
                     nonRandomFactorArray = nonRandomFactorArray,
                     bootstrapNRFArray = bootstrapNRFArray),
            file = fileNameCSV, row.names = F)

  svg(filename = fileNameGraph)

  min <- min(c(nonRandomFactorArray, bootstrapNRFArray))
  max <- max(c(nonRandomFactorArray, bootstrapNRFArray))

  plot(x = sampleSizeArray, y = nonRandomFactorArray, ylim = c(min, max),
       type = "b", col = "blue", xlab = "", ylab = "NRF and Zhou quantile")

  lines(x = sampleSizeArray, y = bootstrapNRFArray, type = "b", col = "red")

  diffirence <- nonRandomFactorArray / bootstrapNRFArray

  lines(x = sampleSizeArray, y = diffirence, type = "b", col = "green")

  legend("topright", legend = c("NRF", "Quantile", "NRF / Quantile"),
         col = c("blue", "red", "green"), lty = 1:1, bg = "transparent")

  subTitle <- paste0("sample size",
                     "\n minSampleSize = ", minSampleSize,
                     ", maxSampleSize = ", maxSampleSize,
                     "\n sampleSizeStep = ", sampleSizeStep,
                     ", prob = ", nonCoverageProbability)

  title(main = "Sample size vs non-random factor and Zhou quantile",
        sub = subTitle)

  dev.off()
}
