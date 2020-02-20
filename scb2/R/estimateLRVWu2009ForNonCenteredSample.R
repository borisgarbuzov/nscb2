#' @title estimateLRVWu2009ForNonCenteredSample
#
#' @name estimateLRVWu2009ForNonCenteredSample
#'
#' @aliases estimateLRVWu2009ForNonCenteredSample
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

estimateLRVWu2009ForNonCenteredSample <-function(sample,
                                                superBlockIndex=0,
                                                numerator=0,
                                                denominator=0,
                                                blockSum=0,
                                                blockIndex=0,
                                                smallQ =0,
                                                sampleMean=0,
                                                bigV=0,
                                                bigU=0)
    {
  if(blockIndex==0)
  {
    numerator <- 0
    denominator <- 0
    addThisIndex <- 0
    blockIndex <- 1
    superBlockIndex <- 0
    sampleMean<-0
    bigV<-0
    bigU<-0
    smallQ <- 0

  }
  if(blockIndex==getSuperBlockBeginIndex(superBlockIndex+1))
  {
    # start of a new superblock
    superBlockIndex <- (superBlockIndex+1)
    blockSum <- sample[blockIndex]
  }else
  {
    blockSum <- blockSum+sample[blockIndex]
  }
  sampleMean<-((blockIndex-1)*sampleMean+sample[blockIndex])/(blockIndex)
  smallQ=smallQ+((blockIndex-1)+2-getSuperBlockBeginIndex(superBlockIndex))^2
  bigV <- bigV+blockSum^2
  bigU<-bigU+((blockIndex-1)+2- getSuperBlockBeginIndex(superBlockIndex))*blockSum
  numerator<-bigV-2*bigU*sampleMean+smallQ*sampleMean^2
  denominator <- denominator + (blockIndex+2-getSuperBlockBeginIndex(superBlockIndex))
  #cat("\nsampleMean: ",superBlockIndex)
  #cat("\nnumerator: ",numerator)
 # cat("\ndenominator: ",denominator)
  #cat("\nblockSum: ",blockSum)
  #cat("\nblockIndex: ",blockIndex)
  if(blockIndex==length(sample))
  {
    sigmaSquared <- numerator/denominator
  }
  else
  {
    # recursive call
  sigmaSquared <-estimateLRVWu2009ForNonCenteredSample(
    sample=sample,
           superBlockIndex=superBlockIndex,
           numerator=numerator,
           denominator=denominator,
           blockSum=blockSum,
           blockIndex=(blockIndex+1),
           smallQ =smallQ,
           sampleMean=sampleMean,
           bigV=bigV,
           bigU=bigU)

  }
  return(sigmaSquared)
}
