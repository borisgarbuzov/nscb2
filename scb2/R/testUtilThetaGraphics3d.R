testUtilThetaGraphics3d <- function(sigma,
                                    batchSize,
                                    indexArray)
{
  cat("\nTesting \'tests_90_ThetaGraphics3d\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray ="); print(indexArray[1:5]);cat("\n")
  cat("batchSize ="); print(batchSize[1:5]);cat("\n")
  cat("sigma =", sigma, "\n")
  thetaMatrix <- matrix(nrow = length(indexArray),ncol = length(batchSize))

  for (indexOfBatch in batchSize)
  {
    for (indexOfN in 1:length(indexArray)) {
      thetaMatrix[indexOfN,indexOfBatch] <- computeTheta(index = indexArray[indexOfN],
                                                         batchSize = indexOfBatch,
                                                         sigma = sigma)
    }
      createThetaGraphics2d(lockedVariable = indexOfBatch,
                            lockedVariableName = "BatchSize",
                            xArray = indexArray,
                            xLabel = "Index",
                            thetaArray = thetaMatrix[,indexOfBatch])
  }
  fileName <- "ThetaMatrix"
  fileName <- timestampGenerator(fileName = fileName)
  saveJpg(fileName = fileName, path = doPath())
  print(wireframe(x = thetaMatrix,row.values = indexArray,
            main = "Theta for squared block sums of iid sample",
            column.values = batchSize, ylab = "batchSize", xlab = "Index"))
  graphics.off()
  for(indexOfN in 1:length(indexArray))
  {
    createThetaGraphics2d(lockedVariable = indexArray[indexOfN],
                          lockedVariableName = "Index",
                          xArray = batchSize,
                          xLabel = "BatchSize",
                          thetaArray = thetaMatrix[indexOfN,])
  }
  cat("End of test ThetaGraphics3d","\n")

  cat("=====================\n")
}
