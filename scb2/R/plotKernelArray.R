plotKernelArray <- function(sampleSize = 5000,
                            bOBMMin = 0.01,
                            bOBMMax = 0.1,
                            bOBMStep = 0.01,
                            tPar = 0.5) {

  bandWidthArray <- seq(from = bOBMMin, to = bOBMMax, by = bOBMStep)

  for(bandWidthOBM in bandWidthArray) {
    kernelArray <- computeKernelArray(sampleSize = sampleSize,
                                      tPar = tPar,
                                      bandWidth = bandWidthOBM)

    # check if "output" directory exist, if doesn't create one
    if(!dir.exists("output"))
    {
      dir.create("output",recursive = TRUE)
    }

    # cerate a mockup for file name
    mockupFileName <- paste("kernel array",
                            "sampleSize =", sampleSize,
                            "tPar =", tPar,
                            "bandWidth =", round(bandWidthOBM, 2))

    # construct two filenames with diffirent extensions for csv and svg
    fileNameGraph <- paste0("output/", mockupFileName, ".svg")
    fileNameCSV <- paste0("output/", mockupFileName, ".csv")

    # write data to csv file
    write.csv(x = list(kernelArray = kernelArray),
              file = fileNameCSV, row.names = F)

    svg(filename = fileNameGraph)

    plot(x = seq(sampleSize), y = kernelArray, main = "Kernel array",
         type = "l", col = "blue", xlab = "", ylab = "values")

    subTitle <- paste0("sample size",
                       "\n sampleSize = ", sampleSize,
                       ", tPar = ", tPar,
                       ", bandWidth = ", round(bandWidthOBM, 2))

    title(sub = subTitle)

    dev.off()
  }
}
