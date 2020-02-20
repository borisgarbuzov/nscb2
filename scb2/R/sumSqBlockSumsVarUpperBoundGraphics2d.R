sumSqBlockSumsVarUpperBoundGraphics2d <- function(lockedVariable,
                                    lockedVariableName,
                                    xArray,
                                    xLabel,
                                    sumNormArray)
{
  fileName <- "sumSqBlockSumsVarUpperBound"
  themeName <- paste0("Upper bound of variance of a sum of\n squared block sums for iid sample.\n 2d section with fixed ",
                      lockedVariableName)
  drawLinearDependenceMeasures2d(themeName = themeName,
                                 fileName = fileName,
                                 lockedVariable = lockedVariable,
                                 lockedVariableName = lockedVariableName,
                                 xArray = xArray,
                                 xLabel = xLabel,
                                 yArray = sumNormArray)
  graphics.off()
}
