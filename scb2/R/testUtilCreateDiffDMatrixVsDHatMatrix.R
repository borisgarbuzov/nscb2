#' export

testUtilCreateDiffDMatrixVsDHatMatrix <- function(size,
                                                  sigma,
                                                  psi,
                                                  mean) {
  cat("\nTesting \'tests_52_testUtilCreateDMatrixVsDHatMatrix\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")

  Start=Sys.time()

  dMatrix <- createDMatrix(size = size,
                           psi = psi,
                           sigma = sigma)
  original <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma,
                                mean = mean)
  betaArray <- createBetaMatrix(sample = original,
                               psi = psi,
                               sigma = sigma,
                               maxLag = floor(size/2))
  dHatMatrix <- createDHatMatrix(betaArray = betaArray)
  diffMatrix <- createDiffDMatrixVsDHatMatrix(dMatrix = dMatrix,
                                              dHatMatrix = dHatMatrix)
  End=Sys.time()

  Duration=End-Start

  cat("Result:\n")
  cat("diffMatrix = \n")
  print(diffMatrix[1:3, 1:3])
  cat("Duration =",Duration,"\n")
  testUtilObjectSize(diffMatrix)
  cat("End of test createDiffDMatrixVsDHatMatrix","\n")

  cat("=====================\n")
}
