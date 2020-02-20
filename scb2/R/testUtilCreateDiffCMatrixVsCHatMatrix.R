#' export

testUtilCreateDiffCMatrixVsCHatMatrix <- function(size,
                                                  sigma,
                                                  psi,
                                                  mean) {
  cat("\nTesting \'tests_51_CreateCMatrixVsCHatMatrix\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")

  Start = Sys.time()

  cMatrix <- createCMatrix(size = size,
                           sigma = sigma,
                           psi = psi)
  Start=Sys.time()
  original <- createOriginalMA1(size = size,
                                sigma = sigma,
                                psi = psi,
                                mean = mean)
  productCol <- createProductCol(original = original)
  cHatMatrix <- createCHatMatrix(productCol = productCol)
  diffMatrix <- createDiffCMatrixVsCHatMatrix(cMatrix = cMatrix,
                                              cHatMatrix = cHatMatrix)
  End=Sys.time()
  Duration=End-Start

  cat("Result:\n")
  cat("diffMatrix = \n")
  print(diffMatrix[1:3, 1:3])

  cat("Duration =",Duration,"\n")

  testUtilObjectSize(diffMatrix)

  cat("End of test CreateCMatrixVsCHatMatrix0","\n")

  cat("=====================\n")
}
