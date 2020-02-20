#'@export
testutilComputeBetaLRVArrayPsi0=function(size,mean,sigma)
{
  cat("\nTesting \'tests_23_ComputeBetaLRVArrayPsi0\' \n")
  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  start=Sys.time()
  betaLRV= computeBetaLRVArrayPsi0(size=size,mean = mean,sigma = sigma)
  End=Sys.time()
  duration=End-start

  cat("Duration =", duration, "\n")
  cat("ComputeBetaLRVArrayPsi0 =", betaLRV, "\n")
  cat("End of test ComputeBetaLRVArrayPsi0 ", "\n")

  cat("=====================\n")
}
