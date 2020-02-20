plotTrueBetaLRVAndBetaLRVHats5 <- function(tParArray,
                                           trueBetaLRVArray,
                                           betaLRVHatDoubleArray,
                                           index,
                                           parList) {
  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  # compute bCov and get bCov degree, constant to insert in subtitle
  bCov <- computeBCov5(sampleSize = parList$sampleSize)

  # compute bOBM and get bOBM degree, constant to insert in subtitle
  bOBM <- computeBOBM5(sampleSize = parList$sampleSize)

  # compute batchSize and get degree, constant to insert in subtitle
  batchSize <- computeBatchSize5(sampleSize = parList$sampleSize)

  # cerate a mockup for file name
  mockupFileName <-
    paste(
      "graph for trueBetaLRV and betaLRVHats",
      "ss =", parList$sampleSize,
      "tParCount =", parList$tParCount,
      "lag =", parList$lag,
      "betaLRVHatCount =", index,
      "sigma =", parList$sigma,
      "mean =", parList$mean,
      "type =", parList$type,
      "typeOfKernel =", parList$typeOfKernel,
      "diagOrHoriz =", parList$diagOrHoriz
    )

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/", mockupFileName, ".svg")
  fileNameCSV <- paste0("output/", mockupFileName, ".csv")

  # make headers for csv
  prefix <- "betaLRVHat"
  myColNames <- c()
  for (i in seq(parList$betaLRVHatCount)) {
    tempName <- paste0(prefix, i)
    myColNames <- c(myColNames, tempName)
  }

  colnames(betaLRVHatDoubleArray) <- myColNames

  # write data to csv file
  write.csv(x = list(tParArray = tParArray,
                     trueBetaLRVArray = trueBetaLRVArray,
                     betaLRVHatDoubleArray),
            file = fileNameCSV, row.names = F)

  svg(filename = fileNameGraph)

  par(mar = c(7, 4, 2, 2))

  min <- min(betaLRVHatDoubleArray, na.rm = T)
  max <- max(10)

  matplot(
    x = tParArray,
    y = betaLRVHatDoubleArray,
    type = "l",
    col = "blue",
    xlab = "",
    ylab = "value",
    ylim = c(min, max),
    main = "True beta LRV and beta LRV hats"
  )

  # plot our bandWidth
  abline(v = bCov, lty = 5)
  abline(v = (1 - bCov), lty = 5)

  lines(trueBetaLRVArray ~ tParArray, type = "l", col = "red")

  legend(
    "topright",
    legend = c("true beta LRV", "beta LRV hat"),
    col = c("red", "blue"),
    lty = 1:1,
    cex = 0.8
  )

  subTitle <- paste0("tPar\n",
                     "sampleSize = ", parList$sampleSize,
                     ", tParCount = ", parList$tParCount,
                     ", lag = ", parList$lag,
                     ", betaLRVHatCount = ", index,
                     "\n sigma = ", parList$sigma,
                     ", mean = ", parList$mean,
                     ", bCov = ",  round(bCov, 2),
                     ", bOBM = ", round(bOBM, 2),
                     ", batchSize = ", round(batchSize, 2),
                     "\n mConst = ", getBatchSizeConst5(),
                     ", bOBMConst = ", getBOBMConst5(),
                     ", bCovConst = ", getBCovConst5(),
                     "\n type = ", parList$type,
                     ", typeOfKernel = ", parList$typeOfKernel,
                     ", diagOrHoriz = ", parList$diagOrHoriz)

  title(sub = subTitle, line = 6)

  dev.off()
}
