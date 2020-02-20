testUtilThetaGraphics2dFixedIndex <- function(sigma,
                                              batchSizeArray,
                                              index)
{
  cat("\nTesting \'tests_scb2_92_ThetaGraphics2dFixedIndex\' \n")

  cat("Test parameters:", "\n")
  cat("batchSizeArray ="); print(batchSizeArray[1:5]);cat("\n")
  cat("index ="); print(index);cat("\n")
  cat("sigma =", sigma, "\n")

  thetaArray <- array(dim = length(batchSizeArray))
  for (indexOfM in 1:length(batchSizeArray)) {
    thetaArray[indexOfM] <- computeTheta(index = index,
                                         batchSize = batchSizeArray[indexOfM],
                                         sigma = sigma)
  }
  createThetaGraphics2d(lockedVariable = index,
                        lockedVariableName = "index",
                        xArray = batchSizeArray,
                        xLabel = "BatchSize",
                        thetaArray = thetaArray)
  cat("End of test ThetaGraphics2dFixedIndex","\n")

  cat("=====================\n")
}
