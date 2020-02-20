# Функция запускает testUtilTabulatedQuantileCrossValidationTest 20 раз с sampleSize (от 1000 до 20000)
testUtilTabulatedQuantileCrossValidationSampleSizeToCsv <- function(from = 1000,
                                                                    to = 10000,
                                                                    by = 1000,
                                                                    tParCount = 11,
                                                                    replicationCount = 1000,
                                                                    lag = 2,
                                                                    sigma = 2,
                                                                    mean = 0,
                                                                    p = 0.95) {
  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output", recursive = TRUE)
  }

  sampleSizeArray <- seq(from = from, to = to, by = by)
  sampleSizeArrayToCsv = array(data = NA, dim = length(sampleSizeArray))
  pDiffArrayToCsv = array(data = NA, dim = length(sampleSizeArray))
  qDiffArrayToCsv = array(data = NA, dim = length(sampleSizeArray))
  durationArrayToCsv = array(data = NA, dim = length(sampleSizeArray))

  for (sampleSizeIndex in 1 : length(sampleSizeArray)) {
    sampleSize = sampleSizeArray[sampleSizeIndex]
    cat("\n=================\nsampleSize = ", sampleSize, "\n=================\n")
    listToCsv <- testUtilTabulatedQuantileCrossValidationTest(sampleSize = sampleSize,
                                                              tParCount = tParCount,
                                                              replicationCount = replicationCount,
                                                              lag = lag,
                                                              sigma = sigma,
                                                              mean = mean,
                                                              p = p)
    sampleSizeArrayToCsv[sampleSizeIndex] = listToCsv[1]
    pDiffArrayToCsv[sampleSizeIndex] = listToCsv[3]
    qDiffArrayToCsv[sampleSizeIndex] = listToCsv[4]
    durationArrayToCsv[sampleSizeIndex] = listToCsv[5]
  }
  cat(sampleSizeArrayToCsv, "\n")
  cat(pDiffArrayToCsv, "\n")
  cat(qDiffArrayToCsv, "\n")
  cat(durationArrayToCsv, "\n")

  forFileName = paste0(from, "-", to, "_rc", replicationCount)

  # write data to csv file
  write.csv(x = list(sampleSize = sampleSizeArrayToCsv,
                     pDiff = pDiffArrayToCsv,
                     qDiff = qDiffArrayToCsv,
                     duration = durationArrayToCsv),
            file = paste0("output/tabulatedQuantileWithChangeableSampleSize", forFileName, ".csv"),
            row.names = F)

  minY = min(c(pDiffArrayToCsv, qDiffArrayToCsv))
  maxY = max(c(pDiffArrayToCsv, qDiffArrayToCsv))

  fileName = paste0("output/pAndQDifferenceWithChangeableSampleSize", forFileName, ".svg")
  svg(filename = fileName)
  plot(x = sampleSizeArray, y = pDiffArrayToCsv, type = "b", col = "blue",
       main = "P and Q difference", xlab = "sample size", ylab = "value",
       ylim = c(minY, maxY))
  lines(x = sampleSizeArray, y = qDiffArrayToCsv, type = "b", col = "red")
  abline(h = 0, col = "red")

  legend(
    "topright",
    legend = c("P difference", "Q difference"),
    col = c("blue", "red"),
    lty = 1:1,
    cex = 0.8,
    bg = "transparent"
  )
  dev.off()

  fileName = paste0("output/durationPAndQDifferenceWithChangeableSampleSize", forFileName, ".svg")
  svg(filename = fileName)
  plot(x = sampleSizeArray, y = durationArrayToCsv, type = "b", col = "blue",
       main = "Duration of P and Q difference", xlab = "sample size", ylab = "minutes")
  dev.off()
}
