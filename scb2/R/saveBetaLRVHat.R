saveBetaLRVHat <- function(sampleSizeMin = 11000,
                           sampleSizeMax = 20000,
                           sampleSizeStep= 1000,
                           tParCount = 11,
                           lag = 2,
                           mean = 0,
                           sigma = 2,
                           typeOfKernel = "gaussian")
{
  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output/"))
  {
    dir.create("output/",recursive = TRUE)
  }

  sampleSizeArray <- seq(from = sampleSizeMin, to = sampleSizeMax,
                         by = sampleSizeStep)
  betaLRVArray <- array(data = NA, dim = c(tParCount, length(sampleSizeArray)))

  tParArray <- createTParArray(tParCount = tParCount)

  # give names to the columns
  prefix <- "sampleSize"
  myColNames <- c()
  for (i in sampleSizeArray) {
    tempName <- paste0(prefix, ".", i)
    myColNames <- c(myColNames, tempName)
  }

  colnames(betaLRVArray) <- myColNames

  for (sampleSizeIndex in seq(sampleSizeArray)) {
    sampleSize <- sampleSizeArray[sampleSizeIndex]
    sample <- createDiagonalSampleTVMA1(sampleSize = sampleSize,
                                        mean = mean,
                                        sigma = sigma,
                                        noise = NULL)

    betaLRVArray[, sampleSizeIndex] <- computeBetaLrvHat5(sample = sample,
                                                          lag = lag,
                                                          tParArray = tParArray,
                                                          diagOrHoriz = "diag",
                                                          typeOfKernel = typeOfKernel)

    write.csv(x = list(betaLRVArray),
              file = paste0("output/betLRVSamples sampleSize=", sampleSize,
                            ".csv"), row.names = F)

    cat("Sample sizes left", length(sampleSizeArray) - sampleSizeIndex, "\n")
  }
}
