testUtilEstimateLRVWu2009ForCenteredSample<- function(size,
                                                      replicationCount,
                                                      psi,
                                                      sigma,
                                                      mean)
{
  cat("\nTesting \'tests_44_EstimateLRVWu2009ForCenteredSample\' \n")

  Start <- Sys.time()

  original <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma,
                                mean = mean)
  LVR=estimateLRVWu2009(sample = original, type = "centered")

  End <- Sys.time()

  duration <- End - Start

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("original =", original[1:5], "\n")

  cat("Result:\n")
  cat("LVR =", LVR, "\n")

  cat("Duration =", duration, "\n")

  testUtilObjectSize(LVR)

  cat("End of test EstimateLRVWu2009ForCenteredSample","\n")
  cat("=====================\n")

}
