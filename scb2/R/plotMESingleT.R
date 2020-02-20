plotMESingleT <- function(minSampleSize = 100,
                          maxSampleSize = 1000,
                          sampleSizeStep = 100,
                          testSample = NULL,
                          tParCount = 11,
                          tIndex = 6,
                          lag = 2,
                          sigma = 2,
                          mean = 0,
                          noise = NULL,
                          nonCoverageProbability = 0.2,
                          diagOrHoriz = "diag",
                          typeOfKernel = "gaussian") {

  tParArray <- createTParArray(tParCount = tParCount)

  sampleSizeArray = seq(from = minSampleSize, to = maxSampleSize, by = sampleSizeStep)

  meByCovArray <- array(data = NA, dim = length(sampleSizeArray))

  for (sampleSizeIndex in seq(sampleSizeArray)) {
    # create diagonal or horizontal sample, it depends on diagOrHoriz parameter
    if (is.null(testSample)) {
      if (diagOrHoriz == "diag") {
        sample <- createDiagonalSampleScaledNoise(
          sampleSize = sampleSizeArray[sampleSizeIndex],
          mean = mean,
          sigma = sigma,
          noise = noise
        )
      } else if (diagOrHoriz == "horiz") {
        sample <- createHorizontalSampleScaledNoise(
          sampleSize = sampleSizeArray[sampleSizeIndex],
          tParCount = tParCount,
          mean = mean,
          sigma = sigma,
          noise = noise
        )
      }
    } else {
      sample <- testSample
    }

    # get b cov degree and bandwidth
    bOBM <- computeBOBM5(sampleSize = sampleSizeArray[sampleSizeIndex])
    bCov <- computeBCov5(sampleSize = sampleSizeArray[sampleSizeIndex])
    batchSize <- computeBatchSize5(sampleSize = sampleSizeArray[sampleSizeIndex])

    if (diagOrHoriz == "horiz") {
      horiz <- sample
    }

    if (diagOrHoriz == "horiz") {
        sample <- horiz[tIndex,]
    }

    "Create Beta Matrix column"
    betaColumn <- computeBetaMatrixColumnHat(sample = sample,
                                             lag = lag,
                                             tPar = tParArray[tIndex],
                                             bandWidthPowerForGamma = bCov)

    "Count the squares of the block sums"
    squaredBatchSumArray <- sampleSplit(sample = betaColumn,
                                        batchSize = batchSize)

    newSampleSize <- length(squaredBatchSumArray)

    "Calculate the LRV for the diagonal sample"
    betaLrvHat <- computeKernelLrvHatForSingleTPar(
      sampleSize = newSampleSize,
      squaredBatchSumArray = squaredBatchSumArray,
      tPar = tParArray[tIndex],
      batchSize = batchSize,
      bandWidth = bOBM,
      typeOfKernel = typeOfKernel
    )

    logSqrt <-  sqrt(-2 * log(bCov))
    cFactor <- logSqrt + (getC_K() - log(log(1 / sqrt (1 - nonCoverageProbability)))) / logSqrt
    phiFactor <- sqrt(getPHI_K_NORMAL_DIFF() / (sampleSizeArray[sampleSizeIndex] * bCov))
    meByCovHat <- cFactor * betaLrvHat * phiFactor
    meByCovArray[sampleSizeIndex] <- meByCovHat

    cat("There are (", length(sampleSizeArray) - sampleSizeIndex,
        ") sample sizes left until the end of the program\n")
  }

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output", recursive = TRUE)
  }

  fileName <- "output/MESingleT.svg"

  svg(filename = fileName)

  plot(x = sampleSizeArray, y = meByCovArray, type = "l", col = "blue",
       xlab = "", ylab = "ME")

  subTitle <- paste0("sampleSize\n",
                     "minSampleSize = ", minSampleSize,
                     " maxSampleSize ", maxSampleSize,
                     ", sampleSizeStep ", sampleSizeStep,
                     "\b tParCount = ", tParCount,
                     ", tIndex = ", tIndex,
                     ", lag = ", lag,
                     ", sigma = ", sigma,
                     "\n mean = ", mean,
                     ", diagOrHoriz = ", diagOrHoriz,
                     ", typeOfKernel = ", typeOfKernel)

  title(main = "ME single T")

  mtext(side = 1, line = 4, subTitle)

  dev.off()
}
