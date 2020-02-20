#' @title estimateLRVWu2009ForCenteredSample
#
#' @name estimateLRVWu2009ForCenteredSample
#'
#' @aliases estimateLRVWu2009ForCenteredSample
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

# call it just with sample argument
# the rest is just for recursion organization
# Think of a wrapper function wtih just a sample argument.
# Change square to a function that we can specify outside
estimateLRVWu2009ForCenteredSample <-function(sample,
                                              superBlockIndex=0,
                                              numerator=0,
                                              denominator=0,
                                              blockSum=0,
                                              blockIndex=0)
{
  if(blockIndex==0)
  {
    blockIndex <- 1
    superBlockIndex <- 0
  }
  if(blockIndex==getSuperBlockBeginIndex(superBlockIndex+1))
  {
    superBlockIndex <- (superBlockIndex+1)
    blockSum <- sample[blockIndex]
  }else
  {
    blockSum <- blockSum+sample[blockIndex]
  }
  numerator <- numerator+blockSum^2
  denominator <- denominator + (blockIndex+2-getSuperBlockBeginIndex(superBlockIndex))
  #cat("\nsuperBlockIndex: ",superBlockIndex)
  #cat("\nnumerator: ",numerator)
  #cat("\ndenominator: ",denominator)
  #cat("\nblockSum: ",blockSum)
  #cat("\nblockIndex: ",blockIndex)
  if(blockIndex==length(sample))
  {
    sigmaSquared <- numerator/denominator
  }
  else
  {
    sigmaSquared <-estimateLRVWu2009ForCenteredSample(sample=sample,
                                                    superBlockIndex = superBlockIndex,
                                                    numerator = numerator,
                                                    denominator = denominator,
                                                    blockSum = blockSum,
                                                    blockIndex = (blockIndex +1))
  }
  return(sigmaSquared)
}
