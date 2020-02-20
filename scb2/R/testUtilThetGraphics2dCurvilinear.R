testUtilThetGraphics2dCurvilinear <- function(sigma,
                                              batchSize,
                                              indexArray)
{
  cat("\nTesting \'tests_scb2_93_ThetaGraphics2dCurvilinear\' \n")

  cat("Test parameters:", "\n")
  cat("batchSize ="); print(batchSize[1:5]);cat("\n")
  cat("indexArray ="); print(indexArray[1:5]);cat("\n")
  cat("sigma =", sigma, "\n")
  thetaArray <- array(dim = length(indexArray))
  for (indexOfN in 1:length(indexArray)) {
    batchSize <- round(sqrt(indexArray[indexOfN]))
    thetaArray[indexOfN] <- computeTheta(index = indexArray[indexOfN],
                                         batchSize = batchSize,
                                         sigma = sigma)
  }
  saveJpg(fileName = "theta2dGraphicsCurvilinear",path = doPath(directory = "theta2dCurvilinear"))
  plot(x=indexArray,y=thetaArray)
  title(main = " theta 2d with curvilinear batchSize dependence on index for\n squared block sums of iid sample")
  graphics.off()
  cat("End of test ThetaGraphics2dCurvilinear","\n")

  cat("=====================\n")
}
