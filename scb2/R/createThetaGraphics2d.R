createThetaGraphics2d <- function(lockedVariable,
                                  lockedVariableName,
                                  xArray,
                                  xLabel,
                                  thetaArray)
{
  fileName <- "Theta"
  themeName <- paste0("theta 2d with fixed ", lockedVariableName," for squared\n block sums of iid sample")
  drawLinearDependenceMeasures2d(themeName = themeName,
                                 fileName = fileName,
                                 lockedVariable = lockedVariable,
                                 lockedVariableName = lockedVariableName,
                                 xArray = xArray,
                                 xLabel = xLabel,
                                 yArray = thetaArray)
  abline(v = lockedVariable,col="red",lty="dashed")
  abline(v = 0,col="blue",lty="dashed")
  graphics.off()
}
