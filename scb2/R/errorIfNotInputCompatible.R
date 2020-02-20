#' @title errorIfNotInputCompatible
#
#' @name errorIfNotInputCompatible
#'
#' @aliases errorIfNotInputCompatible
#'
#' @description Drawing a barplot of side-by-side values of \code{dMatrix} and \code{dHatMatrix} values. Exporting it to a JPEG file saved to \code{"./plots"} directory.
#'
#' @param dMatrix A dMatrix
#' @param dHatMatrix A dHatMatrix
#'
#' @return No data structures returned. Saving JPEG file located at \code{"./plots"} directory.
#'
#' @examples
#' dMatrix <- createDMatrix(size = 10, sigma = 1, psi = 0.5)
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' betaArray <- createBetaArray <- function(original, rho = 0.5)
#' dHatMatrix <- createDHatMatrix(betaArray, size = 10)
#' drawDvsDHat(dMatrix, dHatMatrix)
#'
#' @export

errorIfNotInputCompatible <- function (alpha, lag, sampleSize)
{
  isAlphaCompatible = isAlphaCompatibleWithSampleSize (
    alpha = alpha, sampleSize = sampleSize)
  isLagCompatible = isLagCompatibleWithSampleSize (
    lag = lag, sampleSize = sampleSize)
  isBandwidthCompatible = isBandwidthCompatibleWithSampleSize(sampleSize = sampleSize)
  isCompatible = isAlphaCompatible & isLagCompatible & isBandwidthCompatible

  isLagZeroCompatibl <- isLagZeroCompatible(lag = lag)

  if(! isLagZeroCompatibl)
  {
    warning("\nLag 0 is a special mode with correlations=1 and bands of zero width, with full coverage.")
  }

  if (! isCompatible)
  {
    alphaErrorMessage = ""
    if(!isAlphaCompatible)
    {
            minRequireSamplasize <- paste("\nMin sampleSize you can use with that alpha is=",
                                         computeMinSampleSizeForAlpha(alpha), sep = " ")
      alphaErrorMessage <- "\nsampleSize is not compatible with alpha: \n"
            alphaErrorMessage<- paste(alphaErrorMessage, "alpha = " ,alpha,
                                       minRequireSamplasize,sep = "")
    }
    lagErrorMessage <- ""
    if(!isLagCompatible)
    {
            maxRequiredLag <-paste("\nMax lag you can use with this sampleSize is = ",
                                    computeMaxLagForSampleSize(sampleSize = sampleSize),
                                    sep = " ")
            lagErrorMessage <- "\nSampleSize is not compatible with lag:\n"
            lagErrorMessage <- paste(lagErrorMessage, "lag = ",lag,maxRequiredLag,sep = "")
    }
    bandwidthErrorMessage <- ""
    if(!isBandwidthCompatible)
    {
            minRequiredSampleSize <- paste("\nMin sampleSize you can use with this bandwidth is =",
                                      computeMinSampleSizeForBandwidth(),sep=" ")
            bandwidthErrorMessage <- "\nSampleSize is not compatible with bandwidth:\n"
            bandwidthErrorMessage <- paste(bandwidthErrorMessage, "degree = ", getDegree(),
                                           " ,scaleConstant = ", getScaleConstant(),
                                           minRequiredSampleSize,sep = "")
    }
    warning (
      lagErrorMessage,"\n",alphaErrorMessage,"\n",bandwidthErrorMessage,"\n",
          "sampleSize = ",sampleSize)
  }

}
