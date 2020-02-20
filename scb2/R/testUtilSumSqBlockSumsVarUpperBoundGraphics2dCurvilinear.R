testUtilSumSqBlockSumsVarUpperBoundGraphics2dCurvilinear <- function(sigma,
                                                                      minIndex,
                                                                      maxIndexArray)
{
  cat("\nTesting \'tests_scb2_99_SumSqBlockSumsVarUpperBoundGraphics2dCurvilinear\' \n")

  cat("Test parameters:", "\n")
  cat("minIndex = ",minIndex,"\n")
  cat("maxIndexArray ="); print(maxIndexArray[1:5]);cat("\n")
  cat("sigma =", sigma, "\n")

  fileName <- "sumNorm"
  rhsArray <- array(dim = length(maxIndexArray))
  for (indexIndex in 1:length(maxIndexArray))
  {
    batchSize <- round(sqrt(maxIndexArray[indexIndex]))
    indexArray <- minIndex:maxIndexArray[indexIndex]
    rhsArray[indexIndex] <- computeUpperBound(indexArray = indexArray,
                                                  sigma = sigma,
                                                  type = "MA1BlockSum",
                                                  batchSize = batchSize)
  }
  print(rhsArray)
  saveJpg(fileName = "sumSqBlockSumsVarUpperBoundCurvilinear",
          path = doPath(directory = "sumSqBlockSumsVarUpperBound2dCurvilinear"))
  plot(x=maxIndexArray,y=rhsArray,
       main = "Upper bound of variance of a sum of\n squared block sums for iid sample.\n Curvilinear 2d section ")
  title(sub = "batchSize = sqrt(index)")
  graphics.off()

  cat("End of test SumSqBlockSumsVarUpperBoundGraphics2dCurvilinear","\n")

  cat("=====================\n")
}
