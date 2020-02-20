drawLinearDependenceMeasures2d <- function(themeName,
                                           fileName,
                                           lockedVariable,
                                           lockedVariableName,
                                           xArray,
                                           xLabel,
                                           yArray)
{
  fileNameLocal <- paste0(fileName,"_",lockedVariableName,"_",lockedVariable)
  saveJpg(fileName = fileNameLocal,
          path = doPath(paste0(fileName,"2d","Fixed",lockedVariableName)))
  plot(x = xArray, y = yArray,xlab = xLabel,main = themeName)
  title(sub = paste0(lockedVariableName," =",lockedVariable))

}
