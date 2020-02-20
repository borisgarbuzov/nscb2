testUtilSumSqBlockSumsVarUpperBoundGraphics3d <- function(sigma,
                                                            batchSizeArray,
                                                            minIndex,
                                                            maxIndexArray)
{
  cat("\nTesting \'tests_scb2_98_testUtilsumSqBlockSumsVarUpperBoundGraphics3d\' \n")

  cat("Test parameters:", "\n")
  cat("minIndex =",minIndex,"\n")
  cat("maxIndexArray ="); print(maxIndexArray[1:5]);cat("\n")
  cat("batchSizeArray ="); print(batchSizeArray[1:5]);cat("\n")
  cat("sigma =", sigma, "\n")

  rhsMatrix <- matrix(0,nrow = length(batchSizeArray),ncol = length(maxIndexArray))
  for(nIndex in 1:length(maxIndexArray))
  {

    for (mIndex in 1:length(batchSizeArray))
    {
      #if(mIndex>=nIndex){next()}
      indexArray <- minIndex:maxIndexArray[nIndex]
      rhsMatrix[mIndex,nIndex] <- computeUpperBound(indexArray = indexArray,
                                                    sigma = sigma,
                                                    type = "MA1BlockSum",
                                                    batchSize = batchSizeArray[mIndex])
    }
    sumSqBlockSumsVarUpperBoundGraphics2d(lockedVariable = maxIndexArray[nIndex],
                                          lockedVariableName = "Index",
                                          xArray = batchSizeArray,
                                          xLabel = "batchSize",
                                          sumNormArray = rhsMatrix[,nIndex])
  }

  fileName <- "sumSqBlockSumsVarUpperBound"
  fileName <- timestampGenerator(fileName = fileName)
  saveJpg(fileName = fileName,path = doPath())
  print(wireframe(rhsMatrix,row.values = maxIndexArray,column.values = batchSizeArray,
            xlab = "Index",
            ylab = "batchSize"
            , main = "Upper bound of variance of a sum of\n squared block sums for iid sample"))
  graphics.off()

  for (mIndex in 1:length(batchSizeArray))
  {
    sumSqBlockSumsVarUpperBoundGraphics2d(lockedVariable =  batchSizeArray[mIndex],
                                                          lockedVariableName = "BatchSize",
                                                          xArray = maxIndexArray,
                                                          xLabel = "index",
                                                          sumNormArray = rhsMatrix[mIndex,])
  }
  cat("End of test testUtilsumSqBlockSumsVarUpperBoundGraphics3d","\n")

  cat("=====================\n")
}
