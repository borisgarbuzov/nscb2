plotPdfAndCdfForNormedModPointwiseError <- function() {
  # read data in 2d array
  modPointwiseErrorNormedArray2d <-
    read.csv(file = "data/modPointwiseErrorSamplesNormed2dArray.csv",
             header = T)

  # check if "output" directory exists, if doesn't create it
  if (!dir.exists("output/")) {
    dir.create("output/", recursive = T)
    dir.create("output/cdf/", recursive = T)
    dir.create("output/density/", recursive = T)
  }

  fileMockup <- "output/cdf/normedSamplePointwiseEcdfAndPgumbel"
  fileMockupDensity <- "output/density/normedPointwiseHistogramAndDensity"

  replicationCount <- length(modPointwiseErrorNormedArray2d[,1])

  # go through all columns and plot each of them
  for (name in names(modPointwiseErrorNormedArray2d)) {
    # get sample size from column name with regexp help
    sampleSize <- sub("^.*\\.", "", name)

    sample <- modPointwiseErrorNormedArray2d[[name]]

    # create plot of ecdf and pgumbel ----
    empiricCdf <- ecdf(x = sample)
    probZhao <- pnorm(q = sample)

    # create new file name and plot
    fileName <- paste0(fileMockup, sampleSize, ".svg")
    svg(filename = fileName)

    plot(empiricCdf, xlab = "", ylab = "p",  col = "orange",
         main = paste("Asymptotic pivot for", sampleSize))

    lines(x = sample, y = probZhao, col = "blue")

    legend("bottomright", legend = c("ecdf", "probZhao"),
           col = c("orange", "blue"), lty = 1:1)

    dev.off()

    # create histogram for normed mod error sample ----
    # rescale counts in histogram by dividing it on 1000
    h <- hist(x = sample, plot = F)
    h$counts <- h$counts / replicationCount

    myPdf <- dnorm(x = sample)

    # create new file name and plot
    fileNameDensity <- paste0(fileMockupDensity, sampleSize, ".svg")
    svg(filename = fileNameDensity)

    ymax <- max(myPdf)

    plot(h, xlab = "quantile", ylab = "density", ylim = c(0, ymax),
         main = paste("Density of normed sample for", sampleSize))
    lines(x = sample, y = myPdf, type = "l", col = "blue")

    dev.off()
  }
}
