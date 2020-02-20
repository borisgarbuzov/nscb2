testUtilThetaGraphics2dFixedBatchSize <- function(sigma,
                                                batchSize,
                                                indexArray){

  cat("\nTesting \'tests_scb2_91_ThetaGraphics2dFixedBatchSize\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray ="); print(indexArray[1:5]);cat("\n")
  cat("batchSize =",batchSize,"\n")
  cat("sigma =", sigma, "\n")

  thetaArray <- array(dim = length(indexArray))
  for (indexOfN in 1:length(indexArray)) {
    thetaArray[indexOfN] <- computeTheta(index = indexArray[indexOfN],
                                         batchSize = batchSize,
                                         sigma = sigma)
  }
  createThetaGraphics2d(lockedVariable = batchSize,
                        lockedVariableName = "batchSize",
                        xArray = indexArray,
                        xLabel = "index",
                        thetaArray = thetaArray)

  cat("End of test ThetaGraphics3d","\n")

  cat("=====================\n")
}
