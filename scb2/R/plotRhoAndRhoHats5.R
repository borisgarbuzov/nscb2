plotRhoAndRhoHats5 <- function(tParArray,
                               trueRhoArray,
                               rhoHatDoubleArray,
                               parList) {
  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  # compute bCov and get bCov degree, constant to insert in subtitle
  bCov <- computeBCov5(sampleSize = parList$sampleSize)
  bCovDegree <- getBCovDegree5()
  bCovConst <- getBCovConst5()

  # cerate a mockup for file name
  mockupFileName <-
    paste(
      "graph for rho and rhoHats",
      "ss =", parList$sampleSize,
      "tParCount =", parList$tParCount,
      "lag =", parList$lag,
      "rhoHatCount =", parList$rhoHatCount,
      "sigma =", parList$sigma,
      "mean =", parList$mean,
      "noise =", parList$noise,
      "type =", parList$type,
      "diagOrHoriz =", parList$diagOrHoriz
    )


  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/", mockupFileName, ".svg")
  fileNameCSV <- paste0("output/", mockupFileName, ".csv")

  # make headers for csv
  prefix <- "rhoHat"
  myColNames <- c()
  for (i in seq(parList$rhoHatCount)) {
    tempName <- paste0(prefix, i)
    myColNames <- c(myColNames, tempName)
  }

  colnames(rhoHatDoubleArray) <- myColNames

  # write data to csv file
  write.csv(x = list(tParArray = tParArray,
                     trueRhoArray = trueRhoArray,
                     rhoHatDoubleArray), file = fileNameCSV, row.names = F)

  svg(filename = fileNameGraph)

  par(mar = c(6, 4, 2, 2))

  matplot(
    x = tParArray,
    y = rhoHatDoubleArray,
    type = "l",
    col = "blue",
    xlab = "",
    ylab = "value",
    main = "Autocorrelation"
  )
  lines(x = tParArray, y = trueRhoArray, col = "red")

  legend(
    "topright",
    legend = c("true cor", "cor hat"),
    col = c("red", "blue"),
    lty = 1:1,
    cex = 0.8,
    bg = "transparent"
  )

  subTitle <- paste0("tPar",
                    "\nsampleSize = ", parList$sampleSize,
                    ", tParCount = ", parList$tParCount,
                    ", lag = ", parList$lag,
                    ", rhoHatCount = ", parList$rhoHatCount,
                    "\nsigma = ", parList$sigma,
                    ", mean = ", parList$mean,
                    ", bCov = ", round(bCov, 2),
                    ", bCovDegree = ", bCovDegree,
                    "\nbCovConst = ", bCovConst,
                    ", type = ", parList$type,
                    ", diagOrHoriz = ", parList$diagOrHoriz)

  title(sub = subTitle, line = 5)

  dev.off()
}
