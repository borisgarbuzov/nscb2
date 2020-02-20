# Функция запускает testUtilTabulatedQuantileCrossValidationTest 10 раз с replicationCount (от 1000 до 20000)
testUtilTabulatedQuantileCrossValidationReplicationCountToCsv <- function(sampleSize = 1000,
                                                                          rFrom = 1000,
                                                                          rTo = 10000,
                                                                          rBy = 1000,
                                                                          tParCount = 11,
                                                                          lag = 2,
                                                                          sigma = 2,
                                                                          mean = 0,
                                                                          p = 0.95) {
  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output", recursive = TRUE)
  }

  replicationCountArray <- seq(from = rFrom, to = rTo, by = rBy)

  replicationCountArrayToCsv = array(data = NA, dim = length(replicationCountArray))
  pDiffArrayToCsv = array(data = NA, dim = length(replicationCountArray))
  qDiffArrayToCsv = array(data = NA, dim = length(replicationCountArray))
  durationArrayToCsv = array(data = NA, dim = length(replicationCountArray))

  for (replicationCountIndex in 1 : length(replicationCountArray)) {
    replicationCount = replicationCountArray[replicationCountIndex]
    cat("\n=================\nreplicationCount = ", replicationCount, "\n=================\n")
    listToCsv <- testUtilTabulatedQuantileCrossValidationTest(sampleSize = sampleSize,
                                                              tParCount = tParCount,
                                                              replicationCount = replicationCount,
                                                              lag = lag,
                                                              sigma = sigma,
                                                              mean = mean,
                                                              p = p)
    replicationCountArrayToCsv[replicationCountIndex] = listToCsv[2]
    pDiffArrayToCsv[replicationCountIndex] = listToCsv[3]
    qDiffArrayToCsv[replicationCountIndex] = listToCsv[4]
    durationArrayToCsv[replicationCountIndex] = listToCsv[5]
  }
  cat(replicationCountArrayToCsv, "\n")
  cat(pDiffArrayToCsv, "\n")
  cat(qDiffArrayToCsv, "\n")
  cat(durationArrayToCsv, "\n")

  forFileName = paste0(rFrom, "-", rTo, "_ss", sampleSize)

  # write data to csv file
  write.csv(x = list(replicationCount = replicationCountArrayToCsv,
                     pDiff = pDiffArrayToCsv,
                     qDiff = qDiffArrayToCsv,
                     duration = durationArrayToCsv),
            file = paste0("output/tabulatedQuantileWithChangeableReplicationCount", forFileName, ".csv"),
            row.names = F)

  minY = min(c(pDiffArrayToCsv, qDiffArrayToCsv))
  maxY = max(c(pDiffArrayToCsv, qDiffArrayToCsv))

  fileName = paste0("output/pAndQDifferenceWithChangeableReplicationCount", forFileName, ".svg")
  svg(filename = fileName)
  plot(x = replicationCountArrayToCsv, y = pDiffArrayToCsv, type = "b", col = "blue",
       main = "P and Q difference", xlab = "replication count", ylab = "value",
       ylim = c(minY, maxY))
  lines(x = replicationCountArrayToCsv, y = qDiffArrayToCsv, type = "b", col = "red")
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

  fileName = paste0("output/durationPAndQDifferenceWithChangeableReplicationCount", forFileName, ".svg")
  svg(filename = fileName)
  plot(x = replicationCountArrayToCsv, y = durationArrayToCsv, type = "b", col = "blue",
       main = "Duration of P and Q difference", xlab = "replication count", ylab = "minutes")
  dev.off()
}
