# this function returns sample from given file
getSampleFromCsv <- function(sampleSize,
                             fileName = "modErrorSamples2dArray.csv")
{
  # get 2 dimensional array
  pathFile <- file.path(system.file("data", package = "scb2"), fileName)
  array2d <- read.csv(file = pathFile, header = T)

  # get names of all columns
  columnNames <- names(array2d)
  columnSampleSizes <- sub("^.*\\.", "", columnNames)

  # get column for desired sample size
  columnLogical <- columnSampleSizes == sampleSize

  # check if sum of vector columnLogical equals zero if true stop execution
  if (sum(columnLogical) == 0) {
    stop("There is no sample for such sampleSize.")
  }
  else {
    columnIndex <- which(columnLogical == T)
    mySample <- array2d[[columnIndex]]

    return(mySample)
  }
}
