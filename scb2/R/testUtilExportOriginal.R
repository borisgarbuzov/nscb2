#'@export
testUtilExportOriginal = function(replicationCount, size, psi, sigma, mean) {
  cat("\nTesting \'tests_73_ExportOriginal\' \n")
  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")
  cat("replicationCount =", replicationCount, "\n")
  Start = Sys.time()
  original1d <-
    createOriginalMA1(size = size,
                      psi = psi,
                      sigma = sigma,mean = mean)
  exportOriginal(size = size,psi=psi,sigma = sigma,original1d)
  original2d <-
    createOriginalMA1Replicated(
      replicationCount = replicationCount,
      size = size,
      psi = psi ,
      sigma = sigma,
      mean = mean
    )
  exportOriginal(size = size,psi=psi,sigma = sigma,original = original2d)
  End = Sys.time()
  duration = End - Start
  cat("Duration =", duration, "\n")

  cat("End of test exportOriginal", "\n")

  cat("=====================\n")


}
