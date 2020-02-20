testUtilCutOB <- function(size,
                          psi,
                          sigma,
                          mean,
                          batchSize)
{
  cat("\nTesting \'tests_14_cutOb\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("batchSze",batchSize,"\n")
  cat("=====================\n")

  Start <- Sys.time()

  originalMA1 <- createOriginalMA1(size = size,
                                   psi = psi,
                                   sigma = sigma,
                                   mean = mean)



  matrixOB <- cutOB(original = originalMA1,batchSize = batchSize)

  End <- Sys.time()
  cat("Result:\n")
  cat("productCol = \n")
  print(matrixOB[1:5, 1:5])

  duration <- End - Start

  cat("Duration =", duration, "\n")
  testUtilObjectSize(matrixOB)
  cat("End of test cutOb","\n")
  cat("=====================\n")
}
