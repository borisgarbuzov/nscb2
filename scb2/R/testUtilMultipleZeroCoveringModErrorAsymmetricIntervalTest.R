testUtilMultipleZeroCoveringModErrorAsymmetricIntervalTest <- function(iterationCount = 5,
                                                                       sampleSize = 1000,
                                                                       tParCount = 11,
                                                                       replicationCount = 100,
                                                                       lag = 2,
                                                                       sigma = 2,
                                                                       mean = 0,
                                                                       coverageProb= 0.95) {
  Start <- Sys.time()

  arrayOfP = array(data = NA, dim = iterationCount)

  for (index in 1 : iterationCount) {
    cat("====================\nIteration number = ", index, "\n====================\n")
    arrayOfP[index] = zeroCoveringModErrorAsymmetricIntervalTest(sampleSize = sampleSize,
                                                                 tParCount = tParCount,
                                                                 replicationCount = replicationCount,
                                                                 lag = lag,
                                                                 sigma = sigma,
                                                                 mean = mean,
                                                                 coverageProb= coverageProb)
  }
  End <- Sys.time()
  duration <- End - Start
  cat("Duration =", duration, "\n")

  # write data to csv file
  write.csv(x = list(sampleSize = sampleSize,
                     replicationCount = replicationCount,
                     arrayOfP = arrayOfP),
            file = paste0("output/multipleZeroCoveringModErrorAsymmetricInterval_", iterationCount, "iterations.csv"),
            row.names = F)

  # make plot
  fileName <- paste0("output/multipleZeroCoveringModErrorAsymmetricInterval_", iterationCount, "iterations.svg")
  svg(filename = fileName)
  plot(x = seq(from = 1, to = iterationCount, by = 1), y = arrayOfP, type = "p", col = "blue",
       main = "P", xlab = "iteration", ylab = "value")
  abline(h = 0.95, col = "red", lwd = 2)
  dev.off()

  # make histogram
  fileName <- paste0("output/multipleZeroCoveringModErrorAsymmetricIntervalHistogram_", iterationCount, "iterations.svg")
  svg(filename = fileName)
  hist(x = arrayOfP, xlab = "values",
       main = paste("Histogram of zero covering interval for mod error"))
  dev.off()
}
