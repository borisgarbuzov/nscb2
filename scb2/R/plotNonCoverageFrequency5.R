plotNonCoverageFrequency5 <- function(alphaHats,
                                      nonCoverageProbabilities,
                                      parList) {
  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  # compute bCov and get bCov degree, constant to insert in subtitle
  bCov <- computeBCov5(sampleSize = parList$sampleSize)

  bCovME5 <- computeBCovForME5(sampleSize = parList$sampleSize)

  # compute bOBM and get bOBM degree, constant to insert in subtitle
  bOBM <- computeBOBM5(sampleSize = parList$sampleSize)

  # compute batchSize and get degree, constant to insert in subtitle
  batchSize <- computeBatchSize5(sampleSize = parList$sampleSize)

  # cerate a mockup for file name
  mockupFileName <-
    paste(
      "graph for alphas and alphaHats",
      "ss =", parList$sampleSize,
      "tParCount =", parList$tParCount,
      "lag =", parList$lag,
      "rc =", parList$replicationCount,
      "sigma =", parList$sigma,
      "mean =", parList$mean,
      "index =", parList$index,
      "type =", parList$type,
      "diagOrHoriz =", parList$diagOrHoriz
    )

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/", mockupFileName, ".svg")
  fileNameCSV <- paste0("output/", mockupFileName, ".csv")

  # write data to csv file
  write.csv(x = list(nonCoverageProbabilities = nonCoverageProbabilities,
                     alphaHats = alphaHats), file = fileNameCSV, row.names = F)

  svg(filename = fileNameGraph)

  par(mar = c(7, 4, 2, 2))

  plot(x = c(0, 1), y = c(0, 1), type = "n",
       xlab = "", ylab = "Non-coverage Frequency",
       main = "Alphas and AlphaHats")

  abline(a = 0, b = 1)

  for(i in 1:parList$index)
  {
    points(x = nonCoverageProbabilities[i], y = 0, col = "blue")
    points(x = nonCoverageProbabilities[i], y = alphaHats[i], col = "red")
  }

  legend("topright",
         legend = c("alphaHats", "nonCoverageProbabilities"),
         col = c("red", "blue"),
         lty = 1:1,
         cex = 0.8,
         bg = "transparent"
  )

  subTitle <- paste0("Non-coverage probabilities\n",
                     "sampleSize = ", parList$sampleSize,
                     ", tParCount = ", parList$tParCount,
                     ", lag = ", parList$lag,
                     ", replicationCount = ", parList$replicationCount,
                     "\n sigma = ", parList$sigma,
                     ", mean = ", parList$mean,
                     ", bCov = ",  round(bCov, 2),
                     ", bCovConst = ", getBCovConst5(),
                     "\n bCovME5 = ", round(bCovME5, 2),
                     ", bCovConstME5 = ", getBCovConstForME5(),
                     ", bOBM = ", round(bOBM, 2),
                     ", bOBMConst = ", getBOBMConst5(),
                     "\n batchSize = ", round(batchSize, 2),
                     ", mConst = ", getBatchSizeConst5(),
                     ", type = ", parList$type,
                     ", diagOrHoriz = ", parList$diagOrHoriz)

  title(sub = subTitle, line = 6)

  dev.off()

  # ----------------------------------------

  svg(filename = "output/graph for alphas and alphaHats cropped.svg")

  par(mar = c(7, 4, 2, 2))

  plot(x = c(0, max(nonCoverageProbabilities)), y = c(0, 1), type = "n",
       xlab = "", ylab = "Non-coverage Frequency",
       main = "Alphas and AlphaHats cropped")

  abline(a = 0, b = 1)

  for(i in 1:parList$index)
  {
    points(x = nonCoverageProbabilities[i], y = 0, col = "blue")
    points(x = nonCoverageProbabilities[i], y = alphaHats[i], col = "red")
  }

  legend("topright",
         legend = c("alphaHats", "nonCoverageProbabilities"),
         col = c("red", "blue"),
         lty = 1:1,
         cex = 0.8,
         bg = "transparent"
  )

  subTitle <- paste0("Non-coverage probabilities\n",
                     "sampleSize = ", parList$sampleSize,
                     ", tParCount = ", parList$tParCount,
                     ", lag = ", parList$lag,
                     ", replicationCount = ", parList$replicationCount,
                     "\n sigma = ", parList$sigma,
                     ", mean = ", parList$mean,
                     ", bCov = ",  round(bCov, 2),
                     ", bCovConst = ", getBCovConst5(),
                     "\n bCovME5 = ", round(bCovME5, 2),
                     ", bCovConstME5 = ", getBCovConstForME5(),
                     ", bOBM = ", round(bOBM, 2),
                     ", bOBMConst = ", getBOBMConst5(),
                     "\n batchSize = ", round(batchSize, 2),
                     ", mConst = ", getBatchSizeConst5(),
                     ", type = ", parList$type,
                     ", diagOrHoriz = ", parList$diagOrHoriz)

  title(sub = subTitle, line = 6)

  dev.off()

}
