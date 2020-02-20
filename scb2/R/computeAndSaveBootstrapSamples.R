computeAndSaveBootstrapSamples <- function(fromSampleSize = 1000,
                                           toSampleSize = 20000,
                                           bySampleSize = 1000,
                                           tParCount = 11,
                                           replicationCount = 1000)
{
  # create two arrays one for sample sizez and another
  # one empty for values of bootstrap
  sampleSizeArray <- seq(from = fromSampleSize, to = toSampleSize,
                         by = bySampleSize)
  bootstrap2dArray <- array(data = NA, dim = c(replicationCount,
                                                   length(sampleSizeArray)))

  for (sampleSizeIndex in seq(sampleSizeArray)) {
    # compute bootstrap----
    sampleSize <- sampleSizeArray[sampleSizeIndex]
    unsortedbootstrap2dArray <- generateZhouStatisticArray(
      sampleSize = sampleSize,
      tParCount = tParCount,
      replicationCount = replicationCount
    )
    bootstrap2dArray[, sampleSizeIndex] <- sort(unsortedbootstrap2dArray)

    cat("Sample sizes left =", length(sampleSizeArray) - sampleSizeIndex, "\n")
  }

  # give names to the columns
  prefix <- "sampleSize"
  myColNames <- c()
  for (i in sampleSizeArray) {
    tempName <- paste0(prefix, ".", i)
    myColNames <- c(myColNames, tempName)
  }

  colnames(bootstrap2dArray) <- myColNames

  # check if "data" directory exist, if doesn't create it
  if (!dir.exists("data")) {
    dir.create("data/", recursive = T)
  }

  # write data to csv file
  write.csv(x = list(bootstrap2dArray), file = "data/bootstrap2dArray.csv",
            row.names = F)
}
