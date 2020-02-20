testUtilObmLRVHatVarUpperBoundGraphics2dCurvilinear <- function(sigma,
                                                                     minIndex,
                                                                     maxIndexArray)
{
  cat("\nTesting \'tests_scb2_101_ObmLRVHatVarUpperBoundGraphics2dCurvilinear\' \n")

  cat("Test parameters:", "\n")
  cat("minIndex = ",minIndex,"\n")
  cat("maxIndexArray ="); print(maxIndexArray[1:5]);cat("\n")
  cat("sigma =", sigma, "\n")
  sigma <- 0.5
  minIndex <- -5
  maxIndexArray <- seq(50, 500, 10)
  #batchSizeArray <- seq(5, 250, 5)
  fileName <- "sumNorm"
  rhsArray <- array(dim = length(maxIndexArray))
  for (indexIndex in 1:length(maxIndexArray))
  {
    batchSize <- round(sqrt(maxIndexArray[indexIndex]))
    rhsArray[indexIndex] <- obmLRVHatVarUpperBound(sigma = sigma,
                                                    minIndex = minIndex,
                                                    maxIndex = maxIndexArray[indexIndex],
                                                    batchSize = batchSize)
  }
  saveJpg(fileName = "obmLRVHatVarUpperBound2dGraphicsCurvilinear",
          path = doPath(directory = "obmLRVHatVarUpperBound2dCurvilinear"))
  plot(x=maxIndexArray,y=rhsArray,main = "Upper bound of variance of OBM estimator of\n LRV for iid sample. \nCurvilinear 2d section")
  title(sub = "batchSize = sqrt(index)")
  graphics.off()
  cat("End of test ObmLRVHatVarUpperBoundGraphics2dCurvilinear","\n")

  cat("=====================\n")
}
