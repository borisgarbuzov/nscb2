computeAndSaveModErrorSamples <- function(fromSampleSize = 1000,
                                          toSampleSize = 20000,
                                          bySampleSize = 1000,
                                          tParCount = 11,
                                          replicationCount = 1000,
                                          lag = 2,
                                          sigma = 2,
                                          mean = 0)
{
  # create two arrays one for sample sizez and another
  # one empty for values of mod error and normed mod error
  sampleSizeArray <- seq(from = fromSampleSize, to = toSampleSize,
                         by = bySampleSize)
  modError2dArray <- array(data = NA, dim = c(replicationCount,
                                              length(sampleSizeArray)))
  modErrorNormed2dArray <- array(data = NA, dim = c(replicationCount,
                                                    length(sampleSizeArray)))

  for (sampleSizeIndex in seq(sampleSizeArray)) {
    # compute mod error----
    sampleSize <- sampleSizeArray[sampleSizeIndex]
    unsortedModErrorArray <- generateModErrorStatisticArray(
      sampleSize = sampleSize,
      tParCount = tParCount,
      replicationCount = replicationCount,
      lag = lag,
      sigma = sigma,
      mean = mean)
    modError2dArray[, sampleSizeIndex] <- sort(unsortedModErrorArray)

    # compute mod error normed----
    multCoef <- computeMultiplicationCoef(sampleSize = sampleSize)
    subtractCoef <- computeSubtractionCoef(sampleSize = sampleSize)
    modErrorNormed2dArray[, sampleSizeIndex] <-
      multCoef * modError2dArray[, sampleSizeIndex] - subtractCoef

    cat("Sample sizes left =", length(sampleSizeArray) - sampleSizeIndex, "\n")
  }

  # give names to the columns
  prefix <- "sampleSize"
  myColNames <- c()
  for (i in sampleSizeArray) {
    tempName <- paste0(prefix, ".", i)
    myColNames <- c(myColNames, tempName)
  }

  colnames(modError2dArray) <- myColNames
  colnames(modErrorNormed2dArray) <- myColNames

  # check if "data" directory exist, if doesn't create it
  if (!dir.exists("data")) {
    dir.create("data/", recursive = T)
  }

  # write data to csv file
  write.csv(x = list(modError2dArray), file = "data/modErrorSamples2dArray.csv",
            row.names = F)
  write.csv(x = list(modErrorNormed2dArray),
            file = "data/modErrorSamplesNormed2dArray.csv", row.names = F)
}
