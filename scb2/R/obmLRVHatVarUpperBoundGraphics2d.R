obmLRVHatVarUpperBoundGraphics2d <- function(lockedVariable,
                                          lockedVariableName,
                                          xArray,
                                          xLabel,
                                          rhsArray)
{
  fileName <- "obmLRVHatVarUpperBound"
  themeName <- paste0("Upper bound of variance of a sum of\n squared block sums for iid sample.\n 2d section with fixed ",
                      lockedVariableName)
  drawLinearDependenceMeasures2d(themeName = themeName,
                                 fileName = fileName,
                                 lockedVariable = lockedVariable,
                                 lockedVariableName = lockedVariableName,
                                 xArray = xArray,
                                 xLabel = xLabel,
                                 yArray = rhsArray)
  graphics.off()
}
