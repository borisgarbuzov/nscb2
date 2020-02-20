plotZhouStatistic <- function(zhouStatisticArray, parList) {

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  # compute bCov and get bCov degree, constant to insert in subtitle
  bCov <- computeBCov5(sampleSize = parList$sampleSize)

  # cerate a mockup for file name
  mockupFileName <-
    paste(
      "histogram of Zhou statistic",
      "ss =", parList$sampleSize,
      "tParCount =", parList$tParCount,
      "replicationCount =", parList$replicationCount
    )

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/", mockupFileName, ".svg")
  fileNameCSV <- paste0("output/", mockupFileName, ".csv")

  # write data to csv file
  write.csv(x = list(zhouStatisticArray = zhouStatisticArray), file = fileNameCSV,
            row.names = F)

  svg(filename = fileNameGraph)

  par(mar = c(7, 4, 2, 2))

  hist(x = zhouStatisticArray, main = "histogram of Zhou statistic", xlab = "",
       col = "blue")

  subTitle <- paste0("values\n",
                     "ss = ", parList$sampleSize,
                     ", tParCount = ", parList$tParCount,
                     ", rC = ", parList$replicationCount,
                     "\n bCov = ",  round(bCov, 2),
                     ", bCovConst = ", getBCovConst5(),
                     ", bCovDegree = ", getBCovDegree5(),
                     "\n minSs = ", parList$minSampleSize,
                     ", maxSs = ", parList$maxSampleSize,
                     ", stepSs = ", parList$sampleSizeStep)

  title(sub = subTitle, line = 6)

  dev.off()
}
