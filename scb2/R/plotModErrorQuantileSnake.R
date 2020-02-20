plotModErrorQuantileSnake <- function(p = 0.50) {
  # read data in 2d array
  modErrorArray2d <- read.csv(file = "data/modErrorSamples2dArray.csv",
                              header = T)
  modErrorNormedArray2d <- read.csv(file = "data/modErrorSamplesNormed2dArray.csv",
                                    header = T)

  sampleSizeArray <- array(data = NA, dim = length(modErrorArray2d[1, ]))
  quantileArray <- array(data = NA, dim = length(modErrorArray2d[1, ]))
  quantileNormedArray <- array(data = NA,
                               dim = length(modErrorNormedArray2d[1, ]))

  for (sampleSizeIndex in 1:length(names(modErrorArray2d))) {
    # get sample size from column name with regexp help
    sampleSizeArray[sampleSizeIndex] <- as.numeric(sub("^.*\\.", "",
                                                       names(modErrorArray2d)[sampleSizeIndex]))
  }

  for (index in 1:length(names(modErrorArray2d))) {
    quantileArray[index] <- quantile(x = modErrorArray2d[[index]], probs = p)

    quantileNormedArray[index] <- quantile(x = modErrorNormedArray2d[[index]],
                                           probs = p)
  }

  # check if "output" directory exists, if doesn't create it
  if (!dir.exists("output/")) {
    dir.create("output/", recursive = T)
  }

  fileMockup <- paste("output/modErrorQuantile for p = ", p)
  fileNameCsv <- paste0(fileMockup, ".csv")
  fileNameSvg <- paste0(fileMockup, ".svg")

  write.csv(x = list(sampleSizeArray = sampleSizeArray,
                     quantileArray = quantileArray,
                     quantileNormedArray = quantileNormedArray),
            file = fileNameCsv,
            row.names = F)

  minY <- min(c(quantileArray, quantileNormedArray))
  maxY <- max(c(quantileArray, quantileNormedArray))

  svg(filename = fileNameSvg)

  plot(x = sampleSizeArray, y = quantileArray, type = "b",
       main = paste("Quantiles plot for p =", p), xlab = "sample size",
       col = "green", ylab = "quantile", ylim = c(minY, maxY))
  lines(x = sampleSizeArray, y = quantileNormedArray, type = "b",
        col = "orange")

  legend("topleft", bg = "transparent",
         legend = c("mod error", "normed mod error"),
         col = c("green", "orange"), lty = 1:1)

  dev.off()
}
