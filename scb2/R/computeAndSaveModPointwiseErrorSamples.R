computeAndSaveModPointwiseErrorSamples <- function(fromSampleSize = 1000,
                                                   toSampleSize = 20000,
                                                   bySampleSize = 1000,
                                                   tPar = 0.5,
                                                   replicationCount = 1000,
                                                   lag = 2,
                                                   sigma = 2,
                                                   mean = 0)
{

  # create two arrays one for sample sizez and another
  # one empty for values of mod error and normed mod error
  sampleSizeArray <- seq(from = fromSampleSize, to = toSampleSize,
                         by = bySampleSize)
  modPointwiseError2dArray <- array(data = NA, dim = c(replicationCount,
                                                       length(sampleSizeArray)))
  modPointwiseErrorNormed2dArray <-
    array(data = NA, dim = c(replicationCount,
                             length(sampleSizeArray)))

  for (sampleSizeIndex in seq(sampleSizeArray)) {
    # compute mod error----
    sampleSize <- sampleSizeArray[sampleSizeIndex]
    unsortedModPointwiseErrorArray <- generateModPointwiseErrorStatisticArray(
      sampleSize = sampleSize,
      tPar = tPar,
      replicationCount = replicationCount,
      lag = lag,
      sigma = sigma,
      mean = mean)
    modPointwiseError2dArray[, sampleSizeIndex] <-
      sort(unsortedModPointwiseErrorArray)

    # compute mod error normed----
    bCov <- computeBCov5(sampleSize = sampleSize)
    multCoef <- sqrt((sampleSize * bCov) / getPHI_K(type = "normal"))
    modPointwiseErrorNormed2dArray[, sampleSizeIndex] <-
      multCoef * modPointwiseError2dArray[, sampleSizeIndex]

    cat("Sample sizes left =", length(sampleSizeArray) - sampleSizeIndex, "\n")
  }

  # give names to the columns
  prefix <- "sampleSize"
  myColNames <- c()
  for (i in sampleSizeArray) {
    tempName <- paste0(prefix, ".", i)
    myColNames <- c(myColNames, tempName)
  }

  colnames(modPointwiseError2dArray) <- myColNames
  colnames(modPointwiseErrorNormed2dArray) <- myColNames

  # check if "data" directory exist, if doesn't create it
  if (!dir.exists("data")) {
    dir.create("data/", recursive = T)
  }

  # write data to csv file
  write.csv(x = list(modPointwiseError2dArray),
            file = "data/modPointwiseErrorSamples2dArray.csv", row.names = F)
  write.csv(x = list(modPointwiseErrorNormed2dArray),
            file = "data/modPointwiseErrorSamplesNormed2dArray.csv",
            row.names = F)
}
