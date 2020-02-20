#'@export
testUtilSaveProductCol = function(size, psi, sigma,mean) {
  cat("\nTesting \'tests_71_saveProductCol\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  start=Sys.time()
  original <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma,
                                mean = mean)
  productCol <- createProductCol(original)
  saveProductCol(productCol)
  end=Sys.time()
  duration <- end - start
  cat("Duration =", duration, "\n")
  cat("End of test saveProductCol","\n")
  cat("=====================\n")



}
