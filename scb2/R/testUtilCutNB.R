testUtilCutNB <- function(size,
                          psi,
                          sigma,
                          mean,
                          batchSize)
{
  cat("\nTesting \'tests_15_cutNB\' \n")

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
  matrixNB <- cutNB(original = originalMA1,batchSize = batchSize)

  End <- Sys.time()
  cat("Result:\n")
  cat("productCol = \n")
  print(matrixNB)

  duration <- End - Start

  cat("Duration =", duration, "\n")
  testUtilObjectSize(matrixNB)
  cat("End of test cutNB","\n")
  cat("=====================\n")
}
