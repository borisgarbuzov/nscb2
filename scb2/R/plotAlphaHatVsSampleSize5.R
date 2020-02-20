plotAlphaHatVsSampleSize5 <- function(alphaHatsArray,
                                      sampleSizeArray,
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
      "graph for alphaHat vs sampleSize",
      "ss =", parList$sampleSize,
      "tParCount =", parList$tParCount,
      "lag =", parList$lag,
      "rc =", parList$replicationCount,
      "sigma =", parList$sigma,
      "mean =", parList$mean,
      "type =", parList$type,
      "diagOrHoriz =", parList$diagOrHoriz
    )

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/", mockupFileName, ".svg")
  fileNameCSV <- paste0("output/", mockupFileName, ".csv")

  # write data to csv file
  write.csv(x = list(sampleSizeArray = sampleSizeArray,
                     alphaHatsArray = alphaHatsArray),
            file = fileNameCSV, row.names = F)

  svg(filename = fileNameGraph)

  par(mar = c(7, 4, 2, 2))

  alpha <- rep(parList$prob, times = length(sampleSizeArray))

  plot(alpha~sampleSizeArray, type="c", ylim = c(0,1), col="blue", xlab="",
       ylab = "alphaHat", main = "AlphaHat vs SampleSize")

  for (index in 1:parList$index) {
    points(alphaHatsArray[index]~sampleSizeArray[index], pch=20)
  }

  subTitle <- paste0("sampleSize\n",
                     "tParCount = ", parList$tParCount,
                     ", lag = ", parList$lag,
                     ", replicationCount = ", parList$replicationCount,
                     ", sigma = ", parList$sigma,
                     "\n mean = ", parList$mean,
                     ", prob = ", parList$prob,
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
