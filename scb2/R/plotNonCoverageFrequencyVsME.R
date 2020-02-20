plotNonCoverageFrequencyVsME <- function(nonCoverageArray = nonCoverageArray,
                                         meArray = meArray,
                                         parList = parList) {

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  # cerate a mockup for file name
  mockupFileName <-
    paste(
      "graph for idealFactor vs alphaHat",
      "ss =", parList$sampleSize,
      "tParCount =", parList$tParCount,
      "lag =", parList$lag,
      "rc =", parList$replicationCount,
      "sigma =", parList$sigma,
      "mean =", parList$mean
    )

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/", mockupFileName, ".svg")
  fileNameCSV <- paste0("output/", mockupFileName, ".csv")

  # write data to csv file
  write.csv(x = list(nonCoverageArray = nonCoverageArray,
                     idealFactor = meArray), file = fileNameCSV, row.names = F)

  svg(filename = fileNameGraph)

  plot(x = nonCoverageArray, y = meArray, type = "b", col = "blue", xlab = "",
       ylab = "ideal factor")

  subTitle <- paste0("non-coverage frequency",
                     "\n sampleSize = ", parList$sampleSize,
                     ", tParCount = ", parList$tParCount,
                     ", lag = ", parList$lag,
                     "\n rc = ", parList$replicationCount,
                     ", sigma = ", parList$sigma,
                     ", mean = ", parList$mean)

  title(main = "Ideal factor vs non-coverage frequency", sub = subTitle)

  dev.off()
}
