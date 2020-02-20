computeAndSaveSnakes3D <- function(minSampleSize = 1000,
                                   maxSampleSize = 11000,
                                   sampleSizeStep = 1000,
                                   bConstMin = 1,
                                   bConstMax = 0.1,
                                   bConstStep = -0.1,
                                   tParCount = 11,
                                   replicationCount = 100,
                                   lag = 2,
                                   sigma = 2,
                                   mean = 0,
                                   nonCoverageProbability = 0.05) {

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output/"))
  {
    dir.create("output/",recursive = TRUE)
  }

  # create sequences for sample sizes and bCov constants
  sampleSizeArray <- seq(from = minSampleSize, to = maxSampleSize,
                         by = sampleSizeStep)
  bCovConstArray <- seq(from = bConstMin, to = bConstMax, by = bConstStep)

  # empty 2d arrays for factors
  nrf2dArray <- array(data = NA, dim = c(length(sampleSizeArray),
                                         length(bCovConstArray)))
  zhou2dArray <- array(data = NA, dim = c(length(sampleSizeArray),
                                          length(bCovConstArray)))
  modErrorQuantile2dArray <- array(data = NA, dim = c(length(sampleSizeArray),
                                                      length(bCovConstArray)))

  # give names to the columns
  prefix <- "sampleSize"
  myColNames <- c()
  for (i in sampleSizeArray) {
    tempName <- paste0(prefix, ".", i)
    myColNames <- c(myColNames, tempName)
  }

  # parList for all parameters of our function so we can add them in subtitle of graph
  parList <- list(minSampleSize = minSampleSize,
                  maxSampleSize = maxSampleSize,
                  sampleSizeStep = sampleSizeStep,
                  bConstMin = bConstMin,
                  bConstMax = bConstMax,
                  bConstStep = bConstStep,
                  tParCount = tParCount,
                  replicationCount = replicationCount,
                  lag = lag,
                  sigma = sigma,
                  mean = mean,
                  nonCoverageProbability = nonCoverageProbability)

  # first of two cycles that goes through bCov constants
  for (bCovConstIndex in seq(bCovConstArray)) {
    modError2dArray <- array(data = NA, dim = c(replicationCount,
                                                length(sampleSizeArray)))

    bootstap2dArray <- array(data = NA, dim = c(replicationCount,
                                                length(sampleSizeArray)))

    # create variable 'value' visible for all functions in scb2 package
    assign("value", bCovConstArray[bCovConstIndex],
           envir = parent.env(environment()))
    # replace returned value in 'getBCovConst5' function with our bCovConst
    trace(getBCovConst5, quote(bCovConst <- value), at = 3, print = F)

    # second cycle that goes through all sample sizes
    for (sampleSizeIndex in seq(sampleSizeArray)) {
      # compute non-random factor for every sample size in array and add values to
      # array
      nrf2dArray[sampleSizeIndex, bCovConstIndex] <-
        computeNonRandomFactor(sampleSize = sampleSizeArray[sampleSizeIndex],
                               nonCoverageProbability = nonCoverageProbability)

      # first compute Zhou statistic and then compute quantile out of it
      zhouStatisticArrayUnsorted <-
        generateZhouStatisticArray(
          sampleSize = sampleSizeArray[sampleSizeIndex],
          tParCount = tParCount,
          replicationCount = replicationCount)
      bootstap2dArray[, sampleSizeIndex] <- sort(zhouStatisticArrayUnsorted)
      zhou2dArray[sampleSizeIndex, bCovConstIndex] <-
        quantile(x = zhouStatisticArrayUnsorted,
                 probs = 1 - nonCoverageProbability)

      # same procedure as for Zhou statistic
      modifiedErrorArrayUnsorted <- generateModErrorStatisticArray(
        sampleSize = sampleSizeArray[sampleSizeIndex],
        tParCount = tParCount,
        replicationCount = replicationCount,
        lag = lag,
        sigma = sigma,
        mean = mean)
      modError2dArray[, sampleSizeIndex] <- sort(modifiedErrorArrayUnsorted)
      modErrorQuantile2dArray[sampleSizeIndex, bCovConstIndex] <-
        quantile(x = modifiedErrorArrayUnsorted,
                 probs = 1 - nonCoverageProbability)

      cat("There are", length(sampleSizeArray) - sampleSizeIndex,
          "sample sizes left\n")
    }

    colnames(modError2dArray) <- myColNames
    colnames(bootstap2dArray) <- myColNames

    write.csv(x = list(bootstap2dArray),
              file = paste0("output/bootstrapSample=", getBCovConst5(), ".csv"),
              row.names = F)

    write.csv(x = list(modError2dArray),
              file = paste0("output/modErrorSample=", getBCovConst5(), ".csv"),
              row.names = F)


    # additional computations
    nrfMinusModErrorArray <-
      nrf2dArray[, bCovConstIndex] - modErrorQuantile2dArray[, bCovConstIndex]
    zhouMinusModErrorArray <-
      zhou2dArray[, bCovConstIndex] - modErrorQuantile2dArray[, bCovConstIndex]

    # plot two 2D graphics and save two csvs
    plotSixSnakes(sampleSizeArray = sampleSizeArray,
                  nrf2dArray = nrf2dArray[, bCovConstIndex],
                  zhou2dArray = zhou2dArray[, bCovConstIndex],
                  modErrorQuantile2dArray = modErrorQuantile2dArray[, bCovConstIndex],
                  nrfMinusModErrorArray = nrfMinusModErrorArray,
                  zhouMinusModErrorArray = zhouMinusModErrorArray,
                  parList = parList)

    cat("There are", length(bCovConstArray) - bCovConstIndex, "bCovConsts left\n")
  }

  # return original value of function 'computeBCov5'
  untrace(computeBCov5)

  # plot 3D graphs
  plotSnakes3D(sampleSizeArray = sampleSizeArray,
               bCovConstArray = bCovConstArray,
               nrf2dArray = nrf2dArray,
               zhou2dArray = zhou2dArray,
               modErrorQuantile2dArray = modErrorQuantile2dArray,
               parList = parList)
}
