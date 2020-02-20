plotTwoHists <- function(zhouStatisticArray,
                         modifiedErrorArray,
                         parList) {
  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  # cerate a mockup for file name
  mockupFileName <- paste("histogram of Zhou statistic",
                          "ss =", parList$sampleSize,
                          "tParCount =", parList$tParCount,
                          "rc =", parList$replicationCount,
                          "lag =", parList$lag,
                          "sigma =", parList$sigma,
                          "mean =", parList$mean)

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/", mockupFileName, ".svg")
  fileNameCSV <- paste0("output/", mockupFileName, ".csv")

  # write data to csv file
  write.csv(x = list(zhouStatisticArray = zhouStatisticArray,
                     modifiedErrorArray = modifiedErrorArray),
            file = fileNameCSV,
            row.names = F)

  svg(filename = fileNameGraph)

  min <- min(c(zhouStatisticArray, modifiedErrorArray))
  max <- max(c(zhouStatisticArray, modifiedErrorArray))

  zhouHist <- hist(x = zhouStatisticArray, breaks = 20, plot = F)
  modifiedHist <- hist(x = modifiedErrorArray, breaks = 20, plot = F)

  plot(modifiedHist, xlab = "", ylab = "", main = "", col = rgb(1,0,0,1/4),
       xlim = c(min, max))

  plot(zhouHist, xlab = "", ylab = "", main = "", col = rgb(0,0,1,1/4),
       add = T)

  legend("topright", legend = c("Zhou statistic", "Mod error statistic"),
         col = c(rgb(0,0,1,1/4), rgb(1,0,0,1/4)), pch = 15:15,
         bg = "transparent")

  subTitle <- paste0("values\n",
                     "ss = ", parList$sampleSize,
                     ", tParCount = ", parList$tParCount,
                     ", rc = ", parList$replicationCount,
                     "\n lag = ", parList$lag,
                     ", sigma = ", parList$sigma,
                     ", mean = ", parList$mean)

  title(sub = subTitle, main = "Two hists", ylab = "frequency")

  dev.off()
}
