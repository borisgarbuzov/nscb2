testUtilMultipleZeroCoveringNormalAsymmetricIntervalTest <- function(iterationCount = 10,
                                                                    replicationCount = 1000,
                                                                    coverageProb = 0.95) {
  Start <- Sys.time()

  arrayOfP = array(data = NA, dim = iterationCount)

  for (index in 1 : iterationCount) {
    cat("====================\nIteration number = ", index, "\n====================\n")
    arrayOfP[index] <- zeroCoveringNormalAsymmetricIntervalTest(replicationCount = replicationCount,
                                                                coverageProb = coverageProb)
  }
  End <- Sys.time()
  duration <- End - Start
  cat("Duration =", duration, "\n")

  # write data to csv file
  write.csv(x = list(replicationCount = replicationCount,
                     arrayOfP = arrayOfP),
            file = paste0("output/testUtilMultipleZeroCoveringNormalAsymmetricIntervalTest_", iterationCount, "iterations.csv"),
            row.names = F)

  # make plot
  fileName <- paste0("output/testUtilMultipleZeroCoveringNormalAsymmetricIntervalTest_", iterationCount, "iterations.svg")
  svg(filename = fileName)
  plot(x = seq(from = 1, to = iterationCount, by = 1), y = arrayOfP, type = "b", col = "blue",
       main = "P", xlab = "iteration", ylab = "value")
  abline(h = 0.95, col = "red", lwd = 2)
  dev.off()

  # make histogram
  fileName <- paste0("output/testUtilMultipleZeroCoveringNormalAsymmetricIntervalTestHist_", iterationCount, "iterations.svg")
  svg(filename = fileName)
  hist(x = arrayOfP, xlab = "values",
       main = paste("Histogram of zero covering asymmetric interval"))
  dev.off()
}
