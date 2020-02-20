testUtilLambdaGraphics2dFixedIndex <- function(sigma,
                                               batchSizeArray,
                                                   index)
{
  cat("\nTesting \'tests_scb2_96_LambdaGraphics2dFixedIndex\' \n")

  cat("Test parameters:", "\n")
  cat("batchSizeArray ="); print(batchSizeArray[1:5]);cat("\n")
  cat("index ="); print(index[1:5]);cat("\n")
  cat("sigma =", sigma, "\n")


  lambdaMatrix <- matrix(nrow = length(index),ncol = length(batchSizeArray))
  for(indexBatch in 1:length(batchSizeArray))
  {
    lambda <- computeLambdaArray(indexArray = index,
                                 sigma = sigma,
                                 type = "MA1BlockSum",
                                 batchSize = batchSizeArray[indexBatch])

    lambdaMatrix[,indexBatch] <- lambda
  }
  lambdaArray <- array(dim = length(index))
  for(indexOfN in 1:length(index))
  {
    createLambdaGraphics2d(lockedVariable = index[indexOfN],
                          lockedVariableName = "Index",
                          xArray = batchSizeArray,
                          xLabel = "BatchSize",
                          lambdaArray = lambdaMatrix[indexOfN,])
  }
  cat("End of test LambdaGraphics2dFixedIndex","\n")

  cat("=====================\n")
}
