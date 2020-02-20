plotMESingleN <- function(sampleSize = 1000,
                          testSample = NULL,
                          tParCount = 11,
                          lag = 2,
                          sigma = 2,
                          mean = 0,
                          noise = NULL,
                          nonCoverageProbability = 0.2,
                          diagOrHoriz = "diag",
                          typeOfKernel = "gaussian") {

  # create diagonal or horizontal sample, it depends on diagOrHoriz parameter
  if (is.null(testSample)) {
    if (diagOrHoriz == "diag") {
      sample <- createDiagonalSampleScaledNoise(
        sampleSize = sampleSize,
        mean = mean,
        sigma = sigma,
        noise = noise
      )
    } else if (diagOrHoriz == "horiz") {
      sample <- createHorizontalSampleScaledNoise(
        sampleSize = sampleSize,
        tParCount = tParCount,
        mean = mean,
        sigma = sigma,
        noise = noise
      )
    }
  } else {
    sample <- testSample
  }

  tParArray <- createTParArray(tParCount = tParCount)

  meByCovHat <- computeMEbyCovHat5(tParArray = tParArray,
                                   lag = lag,
                                   sample = sample,
                                   nonCoverageProbability = nonCoverageProbability,
                                   diagOrHoriz = diagOrHoriz,
                                   typeOfKernel = typeOfKernel)

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output", recursive = TRUE)
  }

  fileName <- "output/MESingleN.svg"

  svg(filename = fileName)

  plot(x = tParArray, y = meByCovHat, type = "l", col = "blue",
       xlab = "", ylab = "ME")

  subTitle <- paste0("tPar\n",
                     "sampleSize = ", sampleSize,
                     ", tParCount = ", tParCount,
                     ", lag = ", lag,
                     ", sigma = ", sigma,
                     "\nmean = ", mean,
                     ", diagOrHoriz = ", diagOrHoriz,
                     ", typeOfKernel = ", typeOfKernel)

  title(main = "ME single n", sub = subTitle)

  dev.off()
}
