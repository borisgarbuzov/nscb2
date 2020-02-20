testUtilLambdaGraphics2dFixedBatchSize <- function(sigma,
                                                   batchSize,
                                                   index)
{
  cat("\nTesting \'tests_scb2_95_LambdaGraphics2dFixedBatchSize\' \n")

  cat("Test parameters:", "\n")
  cat("batchSize ="); print(batchSize[1:5]);cat("\n")
  cat("index ="); print(index[1:5]);cat("\n")
  cat("sigma =", sigma, "\n")
  lambda <- computeLambdaArray(indexArray = index,
                               sigma = 0.5,
                               type = "MA1BlockSum",
                               batchSize = batchSize)

  createLambdaGraphics2d(lockedVariable = batchSize,
                         lockedVariableName = "batchSize",
                         xArray = index,
                         xLabel = "index",
                         lambdaArray = lambda)

  cat("End of test LambdaGraphics2dFixedBatchSize","\n")

  cat("=====================\n")
}
