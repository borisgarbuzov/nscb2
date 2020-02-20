#' @title drawOriginalLrvHat
#
#' @name drawOriginalLrvHat
#'
#' @aliases drawOriginalLrvHat
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

drawOriginalLrvHat <-function(sizeArray,
                                  psi,
                                  sigma,
                                  mean)
{
fileName <- "origin_lrv_size"
fileName <- timestampGenerator(fileName = fileName)
gamma <- createGamma(sigma = sigma,
                     psi = psi)
lrvOriginal = gamma[1] + 2 * gamma[2]
subtitle <- paste("replicationCount = size","\npsi = ",psi,", sigma = ",sigma)
lrvOriginalArray<-rep(lrvOriginal,length(sizeArray))
lrvOriginalHatArray <- rep(NA,length(sizeArray))
for(index in 1:length(sizeArray))
{
  replicationCount <- getReplicationCountFromSampleSize(sizeArray[index])
  originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                    size = sizeArray[index],
                                                    psi = psi,
                                                    sigma = sigma,
                                                    mean = mean)
  lrvOriginalHatArray[index] <- createLRVof2dArray(array2d = originalReplicated)
  yMax <- max(lrvOriginalHatArray, lrvOriginal, na.rm = TRUE)
  yMin <- min(lrvOriginalHatArray, lrvOriginal, na.rm = TRUE)
   saveJpg(fileName,"./plots/")
  plot(lrvOriginalArray~sizeArray,type="l",ylim = c(yMin-0.01,yMax+0.01),col="blue",xlab="",
       ylab = "lrv and LRVHat")
  points(lrvOriginalHatArray~sizeArray,pch=20)
  title("Original lrv and lrvHat",subtitle)
  graphics.off()
}
}
