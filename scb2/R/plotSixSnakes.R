plotSixSnakes <- function(sampleSizeArray,
                          nrf2dArray,
                          zhou2dArray,
                          modErrorQuantile2dArray,
                          nrfMinusModErrorArray,
                          zhouMinusModErrorArray,
                          parList) {

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output/main"))
  {
    dir.create("output/main",recursive = TRUE)
  }

  bConst <- getBCovConst5()

  # cerate a mockup for file name
  mockupFileName <- paste("main snakes",
                          "minSs =", parList$minSampleSize,
                          "maxSs =", parList$maxSampleSize,
                          "ssStep =", parList$sampleSizeStep,
                          "bConst =", bConst,
                          "tParCount =", parList$tParCount,
                          "rc =", parList$replicationCount,
                          "lag =", parList$lag,
                          "sigma =", parList$sigma,
                          "mean =", parList$mean,
                          "alpha =", parList$nonCoverageProbability)

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/main/", mockupFileName, ".svg")
  fileNameCSV <- paste0("output/main/", mockupFileName, ".csv")

  # write data to csv file
  write.csv(x = list(nrf2dArray = nrf2dArray,
                     zhou2dArray = zhou2dArray,
                     modErrorQuantile2dArray = modErrorQuantile2dArray),
            file = fileNameCSV,
            row.names = F)

  svg(filename = fileNameGraph, width = 11, height = 10)

  par(mar = c(6, 4, 2, 10) + 0.1)

  min <- min(c(nrf2dArray, zhou2dArray, modErrorQuantile2dArray))
  max <- max(c(nrf2dArray, zhou2dArray, modErrorQuantile2dArray))

  plot(x = sampleSizeArray, y = nrf2dArray, main = "Main snakes",
       ylim = c(min, max), type = "b", pch = 16, col = "blue",
       xlab = "", ylab = "factors")

  lines(x = sampleSizeArray, y = zhou2dArray, type = "b", pch = 16,
        col = "red")
  lines(x = sampleSizeArray, y = modErrorQuantile2dArray, type = "b", pch = 16,
        col = "darkgreen")

  legend(par('usr')[2], par('usr')[4], xpd = NA, bty = "n",
         legend = c("NRF", "bootstrap", "modified error"),
         col = c("blue", "red", "darkgreen"), lty = 1:1)

  subTitle <- paste0("sample size",
                     "\n minSs = ", parList$minSampleSize,
                     ", maxSs = ", parList$maxSampleSize,
                     ", ssStep = ", parList$sampleSizeStep,
                     "\n tParCount = ", parList$tParCount,
                     ", rc = ", parList$replicationCount,
                     ", prob = ", parList$nonCoverageProbability,
                     ", bConst = ", bConst,
                     "\n lag = ", parList$lag,
                     ", sigma = ", parList$sigma,
                     ", mean = ", parList$mean,
                     ", process = TVMA1",
                     ", coef = (2-t)")

  title(sub = subTitle, line = 5)

  dev.off()

  #-----------------------------------------------------------------------------

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output/diffirence"))
  {
    dir.create("output/diffirence",recursive = TRUE)
  }

  # cerate a mockup for file name
  mockupFileName <- paste("diffirence snakes",
                          "minSs =", parList$minSampleSize,
                          "maxSs =", parList$maxSampleSize,
                          "ssStep =", parList$sampleSizeStep,
                          "bConst =", bConst,
                          "tParCount =", parList$tParCount,
                          "rc =", parList$replicationCount,
                          "lag =", parList$lag,
                          "sigma =", parList$sigma,
                          "mean =", parList$mean,
                          "alpha =", parList$nonCoverageProbability)

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/diffirence/", mockupFileName, ".svg")
  fileNameCSV <- paste0("output/diffirence/", mockupFileName, ".csv")

  # write data to csv file
  write.csv(x = list(nrfMinusModErrorArray = nrfMinusModErrorArray,
                     zhouMinusModErrorArray = zhouMinusModErrorArray),
            file = fileNameCSV,
            row.names = F)

  svg(filename = fileNameGraph, width = 11, height = 10)

  par(mar = c(6, 4, 2, 10) + 0.1)

  min <- min(c(nrfMinusModErrorArray, zhouMinusModErrorArray))
  max <- max(c(nrf2dArray, zhou2dArray, modErrorQuantile2dArray))

  plot(x = sampleSizeArray, y = nrfMinusModErrorArray, main = "Difference",
       ylim = c(min, max), type = "b", pch = 4, col = "black",
       xlab = "", ylab = "factors")

  lines(x = sampleSizeArray, y = zhouMinusModErrorArray, type = "b",
        pch = 4, col = "darkorchid4")

  abline(h = 0, col = "deeppink4", lty = 2, lwd = 2)

  legend(par('usr')[2], par('usr')[4], xpd = NA, bty = "n",
         legend = c("NRF - mod error", "bootstrap - mod"),
         col = c("black", "darkorchid4"), lty = 1:1)

  subTitle <- paste0("sample size",
                     "\n minSs = ", parList$minSampleSize,
                     ", maxSs = ", parList$maxSampleSize,
                     ", ssStep = ", parList$sampleSizeStep,
                     "\n tParCount = ", parList$tParCount,
                     ", rc = ", parList$replicationCount,
                     ", prob = ", parList$nonCoverageProbability,
                     ", bConst = ", bConst,
                     "\n lag = ", parList$lag,
                     ", sigma = ", parList$sigma,
                     ", mean = ", parList$mean,
                     ", process = TVMA1",
                     ", coef = (2-t)")

  title(sub = subTitle, line = 5)

  dev.off()
}
