testUtilLambdaGraphics3d <- function(sigma,
                                     batchSizeArray,
                                     index)
{
  cat("\nTesting \'tests_scb2_94_LambdaGraphics3d\' \n")

  cat("Test parameters:", "\n")
  cat("batchSizeArray ="); print(batchSizeArray[1:5]);cat("\n")
  cat("index ="); print(index[1:5]);cat("\n")
  cat("sigma =", sigma, "\n")
  #batchSizeArray <- seq(1,50)
  #index <- -5:44
  lambdaMatrix <- matrix(nrow = length(index),ncol = length(batchSizeArray))

  for(indexBatch in 1:length(batchSizeArray))
  {
    lambda <- computeLambdaArray(indexArray = index,
                                 sigma = sigma,
                                 type = "MA1BlockSum",
                                 batchSize = batchSizeArray[indexBatch])

    createLambdaGraphics2d(lockedVariable = indexBatch,
                           lockedVariableName = "batchSize",
                           xArray = index,
                           xLabel = "index",
                           lambdaArray = lambda)
    lambdaMatrix[,indexBatch] <- lambda
  }
  fileName <- "LambdaArray"
  fileName <- timestampGenerator(fileName = fileName)
  saveJpg(fileName = fileName, path = doPath())
  print(wireframe(x = lambdaMatrix,row.values = index,
            main = "Lambda for squared block sums of iid sample",
            column.values = batchSizeArray, ylab = "batchSize", xlab = "index"))
  graphics.off()
}
