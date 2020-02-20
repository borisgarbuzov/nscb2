plotBand5 <- function(band,
                      tParArray,
                      rhoArray,
                      parList) {

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output/band")) {
    dir.create("output/band", recursive = TRUE)
  }

  # compute bCov and get bCov degree, constant to insert in subtitle
  bCov <- computeBCov5(sampleSize = parList$sampleSize)

  bCovME5 <- computeBCovForME5(sampleSize = parList$sampleSize)

  # compute bOBM and get bOBM degree, constant to insert in subtitle
  bOBM <- computeBOBM5(sampleSize = parList$sampleSize)

  # compute batchSize and get degree, constant to insert in subtitle
  batchSize <- computeBatchSize5(sampleSize = parList$sampleSize)

  # create a mockup for file name
  mockupFileName <-
    paste(
      "Band and Correlation",
      "ss =", parList$sampleSize,
      "tParCount =", parList$tParCount,
      "lag =", parList$lag,
      "sigma =", parList$sigma,
      "mean =", parList$mean,
      "prob =", parList$prob,
      "type =", parList$type,
      "diagOrHoriz =", parList$diagOrHoriz
    )

  # if we plot this graph inside computeIsCovered5 we need to add to file name
  # current probability and replication index
  if (!is.null(parList$repIndex)) {
    mockupFileName <- paste("repIndex =", parList$repIndex, mockupFileName)
  }

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/band/", mockupFileName, ".svg")
  fileNameCSV <- paste0("output/band/", mockupFileName, ".csv")

  # compute middle bound
  lowerBound <- band[, 1]
  upperBound <- band[, 2]
  middleBound  <- (lowerBound + upperBound) / 2

  # write data to csv file
  write.csv(x = list(tParArray = tParArray,
                     lowerBound = lowerBound,
                     upperBound = upperBound,
                     middleBound = middleBound,
                     rhoArray = rhoArray),
            file = fileNameCSV, row.names = F)

  svg(filename = fileNameGraph)

  par(mar = c(7, 4, 2, 2))

  # plot rho
  plot(x = tParArray, y = rhoArray, type = "l", col = "red", xlab = "",
       ylab = "Correlation",
       main = "Simultaneous confidence band for autocorrelation")

  # plot our bandWidth
  abline(v = parList$bandWidthCov, lty = 5)
  abline(v = (1 - parList$bandWidthCov), lty = 5)

  # plot lower middle and upper band
  lines(x = tParArray, y = lowerBound, type = "l", col = "blue")
  lines(x = tParArray, y = middleBound, type = "l", col = "brown")
  lines(x = tParArray, y = upperBound, type = "l", col = "green")

  legend("topright",
         legend = c("Upper", "Middle", "Lower", "Correlation"),
         col = c("green", "brown", "blue", "red"),
         cex = 0.8,
         lty = 1:1,
         bg = "transparent")

  subTitle <- paste0("tPar\n",
                    "sampleSize = ", parList$sampleSize,
                    ", tParCount = ", parList$tParCount,
                    ", lag = ", parList$lag,
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
