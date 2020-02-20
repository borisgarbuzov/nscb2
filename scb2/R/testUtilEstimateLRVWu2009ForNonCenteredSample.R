testUtilEstimateLRVWu2009ForNonCenteredSample<- function(size,
                                                         psi,
                                                         sigma,
                                                         mean)
{
  cat("\nTesting \'tests_45_EstimateLRVWu2009ForNonCenteredSample\' \n")

  Start <- Sys.time()

  original <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma,
                                mean = mean)
  lrv=estimateLRVWu2009(sample = original)

  End <- Sys.time()

  duration <- End - Start

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("original =", original[1:5], "\n")

  cat("Result:\n")
  cat("lrv =", lrv, "\n")

  cat("Duration =", duration, "\n")

  testUtilObjectSize(lrv)

  cat("End of test EstimateLRVWu2009ForNonCenteredSample","\n")
  cat("=====================\n")

}
