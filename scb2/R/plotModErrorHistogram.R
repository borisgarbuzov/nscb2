plotModErrorHistogram <- function() {
  # read data in 2d array
  modErrorArray2d <- read.csv(file = "data/modErrorSamples2dArray.csv",
                              header = T)
  modErrorNormedArray2d <- read.csv(file = "data/modErrorSamplesNormed2dArray.csv",
                                    header = T)

  # check if "output" directory exists, if doesn't create it
  if (!dir.exists("output/")) {
    dir.create("output/sample/", recursive = T)
    dir.create("output/normedSample", recursive = T)
  }

  fileMockup <- "output/sample/modErrorHistogram"
  fileMockupNormed <- "output/normedSample/normedModErrorHistogram"

  # go through all columns and plot each of them
  for (name in names(modErrorArray2d)) {
    # get sample size from column name with regexp help
    sampleSizeString <- sub("^.*\\.", "", name)

    # create histogram for mod error sample ----
    # create new file name
    fileName <- paste0(fileMockup, sampleSizeString, ".svg")
    svg(filename = fileName)
    hist(x = modErrorArray2d[[name]], xlab = "values",
         main = paste("Histogram of original sample for sample size",
                      sampleSizeString))
    dev.off()

    # create histogram for normed mod error sample ----
    fileNameNormed <- paste0(fileMockupNormed, sampleSizeString, ".svg")
    svg(filename = fileNameNormed)
    hist(x = modErrorNormedArray2d[[name]], xlab = "values",
         main = paste("Histogram of normed sample for sample size", sampleSizeString))
    dev.off()
  }
}
