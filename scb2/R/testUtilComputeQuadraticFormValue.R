testUtilComputeQuadraticFormValue <-function(size,
                                             psi,
                                             sigma,
                                             mean,
                                             batchSize)
{
  cat("\nTesting \'tests_18_ComputeQuadraticFormValue\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("batchSze",batchSize,"\n")
  cat("=====================\n")

  originalMA1 <- createOriginalMA1(size,
                                   psi = psi,
                                   sigma = sigma,
                                   mean = mean)

  Start <- Sys.time()
  quadraticFormMatrix <- computeQuadraticFormMatrixFromNB(size = size,batchSize = batchSize)
  quadraticFormValue <-
    computeQuadraticFormValue(argumentVector = originalMA1,matrix = quadraticFormMatrix)
  End <- Sys.time()

  cat("Result:\n")
  cat("quadraticFormValue =",quadraticFormValue," \n")


  duration <- End - Start
  cat("duration = ",duration)

  cat("\n End of test ComputeQuadraticFormValue ")
}
