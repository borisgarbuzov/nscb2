testUtilLambdaGraphics2dCurvilinear <- function(sigma,
                                                batchSizeArray,
                                                index)
{
  cat("\nTesting \'tests_scb2_99_LambdaGraphics2dCurvilinear\' \n")

  cat("Test parameters:", "\n")
  cat("batchSizeArray ="); print(batchSizeArray[1:5]);cat("\n")
  cat("index ="); print(index[1:5]);cat("\n")
  cat("sigma =", sigma, "\n")

  batchSizeArray <- seq(1,50)
  index <- 1:50
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
  for (indexIndex in 1:length(index)) {
    batchSize <- round(sqrt(indexIndex))
    lambdaArray[indexIndex] <- lambdaMatrix[batchSize,indexIndex]

  }
  saveJpg(fileName = "lambda2dGraphicsCurvilinear",path = doPath(directory = "Lambda2dCurvilinear"))
  plot(x=index,y=lambdaArray)
  title(main = "Lambda 2d with curvilinear batchSize dependence on index\n for squared block sums of iid sample",
        sub = "batchSize = sqrt(index)")
  graphics.off()
  cat("End of test LambdaGraphics2dCurvilinear","\n")

  cat("=====================\n")
}
