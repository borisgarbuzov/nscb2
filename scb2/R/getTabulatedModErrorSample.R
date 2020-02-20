# this function returns sample of lenght = replicationCount
# currently = 1000
getTabulatedModErrorSample <- function(sampleSize)
{
  # get 2 dimensional array of precomputed samples for mod error
  pathFile <- file.path(system.file("data", package = "scb2"),
                        "modErrorSamples2dArray.csv")
  modErrorArray2d <- read.csv(file = pathFile, header = T)

  # get names of all columns
  columnNames <- names(modErrorArray2d)
  columnSampleSizes <- sub("^.*\\.", "", columnNames)

  # get column for desired sample size
  columnLogical <- columnSampleSizes == sampleSize

  # check if sum of vector columnLogical equals zero if true stop execution
  if (sum(columnLogical) == 0) {
    stop("There is no mod error sample for such sampleSize.")
  }
  else {
    columnIndex <- which(columnLogical == T)
    mySample <- modErrorArray2d[[columnIndex]]

    return(mySample)
  }
}
