createLambdaGraphics2d <- function(lockedVariable,
                                   lockedVariableName,
                                   xArray,
                                   xLabel,
                                   lambdaArray)
{
  fileName <- "lambda"
  themeName <- paste0("Lambda 2d with fixed ",
                      lockedVariableName ,
                      " for \nsquared block sums of iid sample")
  drawLinearDependenceMeasures2d(themeName = themeName,
                                 fileName = fileName,
                                 lockedVariable = lockedVariable,
                                 lockedVariableName = lockedVariableName,
                                 xArray = xArray,
                                 xLabel = xLabel,
                                 yArray = lambdaArray)
  abline(v = lockedVariable,col="red",lty="dashed")
  abline(v = 0,col="blue",lty="dashed")
  abline(h =max(lambdaArray),col="red",lty="dashed")
  graphics.off()
}
