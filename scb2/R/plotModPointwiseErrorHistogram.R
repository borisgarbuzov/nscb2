plotModPointwiseErrorHistogram <- function() {
  # read data in 2d array
  modPointwiseErrorArray2d <-
    read.csv(file = "data/modPointwiseErrorSamples2dArray.csv",
             header = T)
  modPointwiseErrorNormedArray2d <-
    read.csv(file = "data/modPointwiseErrorSamplesNormed2dArray.csv",
             header = T)

  # check if "output" directory exists, if doesn't create it
  if (!dir.exists("output/")) {
    dir.create("output/sample/", recursive = T)
    dir.create("output/normedSample", recursive = T)
  }

  fileMockup <- "output/sample/modPointwiseErrorHistogram"
  fileMockupNormed <- "output/normedSample/normedModPointwiseErrorHistogram"

  # go through all columns and plot each of them
  for (name in names(modPointwiseErrorArray2d)) {
    # get sample size from column name with regexp help
    sampleSizeString <- sub("^.*\\.", "", name)

    # create histogram for mod error sample ----
    # create new file name
    fileName <- paste0(fileMockup, sampleSizeString, ".svg")
    svg(filename = fileName)
    hist(x = modPointwiseErrorArray2d[[name]], xlab = "values",
         main = paste("Original pointwise sample for sample size",
                      sampleSizeString))
    dev.off()

    # create histogram for normed mod error sample ----
    fileNameNormed <- paste0(fileMockupNormed, sampleSizeString, ".svg")
    svg(filename = fileNameNormed)
    hist(x = modPointwiseErrorNormedArray2d[[name]], xlab = "values",
         main = paste("Normed pointwise sample for sample size",
                      sampleSizeString))
    dev.off()
  }
}
