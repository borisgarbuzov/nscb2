plotPrecision <- function(precisions, trueArray, parList) {

  # check if "output" directory exist, if doesn't create one
  if (!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  # cerate a mockup for file name
  mockupFileName <-
    paste(
      parList$name,
      "ss =", parList$sampleSize,
      "tParCount =", parList$tParCount,
      "lag =", parList$lag,
      "sigma =", parList$sigma,
      "mean =", parList$mean,
      "type =", parList$type,
      "diagOrHoriz =", parList$diagOrHoriz
    )

  # construct filename csv
  fileNameCSV <- paste0("output/", mockupFileName, ".csv")

  # write data to csv file
  write.csv(x = list(tParArray = parList$tParArray,
                     mean = precisions$meanArray,
                     bias = precisions$biasArray,
                     variance = precisions$varianceArray,
                     MSE = precisions$mseArray,
                     trueArray = trueArray),
            file = fileNameCSV, row.names = F)

  # compute mean for all precision parametrs
  meansOverall <- array(c(mean(precisions$meanArray),
                        mean(precisions$biasArray),
                        mean(precisions$varianceArray),
                        mean(precisions$mseArray), "genral mean"))
  meansTruncated <- array(c(mean(precisions$meanArray[-c(1, parList$tParCount)]),
                          mean(precisions$biasArray[-c(1, parList$tParCount)]),
                          mean(precisions$varianceArray[-c(1, parList$tParCount)]),
                          mean(precisions$mseArray[-c(1, parList$tParCount)]),
                          "truncated mean"))

  cat("\n", meansOverall, append = T, sep = ",", file = fileNameCSV)
  cat("\n", meansTruncated, append = T, sep = ",", file = fileNameCSV)

  # here we start to create our graphics ----

  # compute tParArray again for x-axis on graphs
  tParArray <- createTParArray(tParCount = parList$tParCount)

  # compute bCov and get bCov degree, constant to insert in subtitle
  bCov <- computeBCov5(sampleSize = parList$sampleSize)

  # if we plot precisions for betaLRV
  # than we want to insert bOBM and batchSize values in subtitle
  if (parList$name == "betaLRV") {
    bOBM <- computeBOBM5(sampleSize = parList$sampleSize)
    batchSize <- computeBatchSize5(sampleSize = parList$sampleSize)
  }

  subTitle <- paste0("sampleSize = ", parList$sampleSize,
                     ", tParCount = ", parList$tParCount,
                     ", lag = ", parList$lag,
                     ", sigma = ", parList$sigma,
                     "\n mean = ", parList$mean,
                     ", type = ", parList$type,
                     ", diagOrHoriz = ", parList$diagOrHoriz,
                     ", bConst = ", getBCovConst5(),
                     "\n bCov = ", round(bCov, 2),
                     ", bCovDegree = ", round(getBCovDegree5(), 2))


  if (parList$name == "betaLRV") {
    subTitle <- paste0(subTitle, ", bOBM = ", round(bOBM, 2),
                       ", batchSize = ", round(batchSize, 2))
  }

  # create our mean graph ----
  fileNameMean <- paste0("output/", "mean ", mockupFileName, ".svg")

  svg(fileNameMean)

  par(mar = c(7, 4, 2, 2))

  min <- min(precisions$meanArray, trueArray)
  max <- max(precisions$meanArray, trueArray)

  plot(x = tParArray, y = precisions$meanArray, type = "l", col = "blue",
       xlab = "tPar", ylab = "mean", ylim = c(min, max),
       main = paste("mean for", parList$name))

  # plot our bandWidth
  abline(v = bCov, lty = 5)
  abline(v = (1 - bCov), lty = 5)

  lines(x = tParArray, y = trueArray, col = "red")

  title(sub = subTitle, line = 6)

  dev.off()

  # create our bias graph ----
  fileNameBias <- paste0("output/", "bias ", mockupFileName, ".svg")

  svg(fileNameBias)

  par(mar = c(7, 4, 2, 2))

  min <- min(precisions$biasArray, 0)
  max <- max(precisions$biasArray, 0)

  plot(x = tParArray, y = precisions$biasArray, type = "l", col = "blue",
       xlab = "tPar", ylab = "bias", ylim = c(min, max),
       main = paste("bias for", parList$name))

  # plot our bandWidth
  abline(v = bCov, lty = 5)
  abline(v = (1 - bCov), lty = 5)

  abline(h = 0, col = "red")

  title(sub = subTitle, line = 6)

  dev.off()

  # create our variance graph ----
  fileNameVariance <- paste0("output/", "variance ", mockupFileName, ".svg")

  svg(fileNameVariance)

  par(mar = c(7, 4, 2, 2))

  min <- min(precisions$varianceArray, 0)
  max <- max(precisions$varianceArray, 0)

  plot(x = tParArray, y = precisions$varianceArray, type = "l", col = "blue",
       xlab = "tPar", ylab = "variance", ylim = c(min, max),
       main = paste("variance for", parList$name))

  # plot our bandWidth
  abline(v = bCov, lty = 5)
  abline(v = (1 - bCov), lty = 5)

  abline(h = 0, col = "red")

  title(sub = subTitle, line = 6)

  dev.off()

  # create our MSE graph ----
  fileNameMSE <- paste0("output/", "MSE ", mockupFileName, ".svg")

  svg(fileNameMSE)

  par(mar = c(7, 4, 2, 2))

  min <- min(precisions$mseArray, 0)
  max <- max(precisions$mseArray, 0)

  plot(x = tParArray, y = precisions$mseArray, type = "l", col = "blue",
       xlab = "tPar", ylab = "MSE", ylim = c(min, max),
       main = paste("MSE for", parList$name))

  # plot our bandWidth
  abline(v = bCov, lty = 5)
  abline(v = (1 - bCov), lty = 5)

  abline(h = 0, col = "red")

  title(sub = subTitle, line = 6)

  dev.off()
}
