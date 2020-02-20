plotCoefVsSampleSize <- function(fromSampleSize = 1000,
                                 toSampleSize = 20000,
                                 bySampleSize = 1000) {
  # create sample size array and two empty arrays for coefs
  sampleSizeArray <- seq(from = fromSampleSize, to = toSampleSize,
                         by = bySampleSize)
  multCoefArray <- array(data = NA, dim = length(sampleSizeArray))
  subtractCoefArray <- array(data = NA, dim = length(sampleSizeArray))

  # go in cycle through all sample sizes and compute coefficients then store
  # them in arrays
  for (sampleSizeIndex in seq(sampleSizeArray)) {
    sampleSize <- sampleSizeArray[sampleSizeIndex]

    multCoefArray[sampleSizeIndex] <-
      computeMultiplicationCoef(sampleSize = sampleSize)
    subtractCoefArray[sampleSizeIndex] <-
      computeSubtractionCoef(sampleSize = sampleSize)
  }

  # check if "output" directory exists, if doesn't create it
  if (!dir.exists("output/")) {
    dir.create("output/", recursive = T)
  }

  # create file names for csv table and svg plot
  fileNameSvg <- "output/coefsVsSampleSize.svg"
  fileNameCsv <- "output/coeffVsSampleSize.csv"

  write.csv(x = list(multCoefArray = multCoefArray,
                     subtractCoefArray = subtractCoefArray),
            file = fileNameCsv, row.names = F)

  # get minimal and maximal value in two array
  minY <- min(c(multCoefArray, subtractCoefArray))
  maxY <- max(c(multCoefArray, subtractCoefArray))

  # plot two coefficients
  svg(filename = file_name_svg)

  plot(x = sampleSizeArray, y = multCoefArray, ylim = c(minY, maxY), type = "l",
       xlab = "sample size", ylab = "value", col = "blue",
       main = "Coefficients against sample sizes")
  lines(x = sampleSizeArray, y = subtractCoefArray, col = "red")

  legend("topleft", legend = c("multiplication", "subtraction"),
         col = c("blue", "red"), lty = 1:1)

  dev.off()
}
