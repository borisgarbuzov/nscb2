testUtilObmLRVHatVarUpperBoundGraphics3d <- function(sigma,
                                                          batchSizeArray,
                                                          minIndex,
                                                          maxIndexArray)
{
  cat("\nTesting \'tests_scb2_100_testUtilObmLRVHatVarUpperBoundGraphics3d\' \n")

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
      if(mIndex>=nIndex){next()}
      rhsMatrix[mIndex,nIndex] <- obmLRVHatVarUpperBound(sigma = sigma,
                                                           maxIndex = maxIndexArray[nIndex],
                                                           minIndex = minIndex,
                                                           batchSize = batchSizeArray[mIndex])

    }
    obmLRVHatVarUpperBoundGraphics2d(lockedVariable = maxIndexArray[nIndex],
                                   lockedVariableName = "Index",
                                   xArray = batchSizeArray,
                                   xLabel = "batchSize",
                                   rhsArray = rhsMatrix[,nIndex])

  }
  fileName <- "obmLRVHatVarUpperBound"
  fileName <- timestampGenerator(fileName = fileName)
  saveJpg(fileName = fileName,path = doPath())
  print(wireframe(rhsMatrix,row.values = maxIndexArray,column.values = batchSizeArray,
            xlab = "Index",
            ylab = "batchSize",
            main = "Upper bound of variance of OBM estimator of LRV for iid sample"))
  graphics.off()
  for (mIndex in 1:length(batchSizeArray))
  {
    obmLRVHatVarUpperBoundGraphics2d(lockedVariable =  batchSizeArray[mIndex],
                            lockedVariableName = "BatchSize",
                            xArray = maxIndexArray,
                            xLabel = "index",
                            rhsArray = rhsMatrix[mIndex,])
  }
  cat("End of test testUtilObmLRVHatVarUpperBoundGraphics3d","\n")

  cat("=====================\n")
  }
