plotKernelSumArray <- function(kernelSumArray, tParArray, parList) {

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output/kernelSum"))
  {
    dir.create("output/kernelSum",recursive = TRUE)
  }

  # compute bCov and get bCov degree, constant to insert in subtitle
  bCov <- computeBCov5(sampleSize = parList$sampleSize)

  # cerate a mockup for file name
  mockupFileName <-
    paste(
      "plot of kernelSum",
      "ss =", parList$sampleSize,
      "tParCount =", length(tParArray),
      "replicationCount =", parList$currentRepIndex
    )

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/kernelSum/", mockupFileName, ".svg")
  fileNameCSV <- paste0("output/kernelSum/", mockupFileName, ".csv")

  # write data to csv file
  write.csv(x = list(tParArray = tParArray, kernelSumArray = kernelSumArray),
            file = fileNameCSV, row.names = F)

  svg(filename = fileNameGraph)

  min <- min(kernelSumArray, abs(kernelSumArray))
  max <- max(kernelSumArray, abs(kernelSumArray))

  plot(x = tParArray, y = abs(kernelSumArray), type = "l",
       main = "plot of kernel sum", ylim = c(min, max), xlab = "",
       ylab = "kernel sum", col = "blue")

  lines(x = tParArray, y = kernelSumArray, col = "red")

  legend("topleft", legend = c("Before abs", "After abs"),
         col = c("red", "blue"), cex = 0.8, lty = 1:1, bg = "transparent")

  subTitle <- paste0("tPar\n",
                     "ss = ", parList$sampleSize,
                     ", tParCount = ", length(tParArray),
                     ", repIndex = ", parList$currentRepIndex,
                     "\n bCov = ",  round(bCov, 2),
                     ", bCovConst = ", getBCovConst5(),
                     ", bCovDegree = ", getBCovDegree5())

  title(sub = subTitle)

  dev.off()
}
