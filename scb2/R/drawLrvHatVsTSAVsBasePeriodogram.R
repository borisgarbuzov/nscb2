#' @title drawLrvHatVsTSAVsBasePeriodogram
#
#' @name drawLrvHatVsTSAVsBasePeriodogram
#'
#' @aliases drawLrvHatVsTSAVsBasePeriodogram
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
#'
#' @importFrom TSA periodogram

drawLrvHatVsTSAVsBasePeriodogram <- function(sizeArray,
                                             psi,
                                             sigma,
                                             mean)
{
  fileName <- "origin_lrvVsPeri_size"
  fileName <- timestampGenerator(fileName = fileName)
  gamma <- createGamma(sigma = sigma,
                       psi = psi)
  lrvOriginal = gamma[1] + 2 * gamma[2]
  subtitle <- paste("replicationCount = size","\npsi = ",psi,", sigma = ",sigma)
  lrvOriginalArray<-rep(lrvOriginal,length(sizeArray))
  lrvOriginalHatArray <- rep(NA,length(sizeArray))
  lrvOriginalNonCenteredHatArray <- rep(NA,length(sizeArray))
  periodogramArray <- rep(NA,length(sizeArray))
  basePeriodogramArray <- rep(NA,length(sizeArray))
  for(index in 1:length(sizeArray))
  {
    replicationCount <- getReplicationCountFromSampleSize(sizeArray[index])
    originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                      size = sizeArray[index],
                                                      psi = psi,
                                                      sigma = sigma,
                                                      mean = mean)
    lrvOriginalHatArray[index] <- createLRVof2dArray(array2d = originalReplicated)
    #lrvOriginalNonCenteredHatArray[index] <- createNonCenteredLRVof2dArray(array2d = originalReplicated)
    periodogramReplicated <- rep(NA,replicationCount)
    basePeridogramReplicated <-rep(NA,replicationCount)
    for(indexRC in 1:replicationCount)
    {
      myPeriodogram = periodogram(originalReplicated[indexRC,])
      periodogramReplicated[indexRC] <- myPeriodogram$spec[1]
      myPeriodogram <- spec.pgram(originalReplicated[indexRC,])
      basePeridogramReplicated[indexRC] <- myPeriodogram$spec[1]
    }
    periodogramArray[index] <- mean(periodogramReplicated)
    basePeriodogramArray[index] <- mean(basePeridogramReplicated)
    yMax <- max(lrvOriginalHatArray, lrvOriginal,periodogramArray,basePeriodogramArray,na.rm = TRUE)
    yMin <- min(lrvOriginalHatArray, lrvOriginal,periodogramArray,basePeriodogramArray, na.rm = TRUE)
    saveJpg(fileName,"./plots")
    plot(lrvOriginalArray~sizeArray,type="l",ylim = c(yMin-0.01,yMax+0.01),col="blue",xlab="",
         ylab = "lrv and LRVHat")
    points(periodogramArray~sizeArray,pch=19,col="green")
    points(lrvOriginalHatArray~sizeArray,pch=20)
    #points(lrvOriginalNonCenteredHatArray~sizeArray,pch=18,col="red")
    points(basePeriodogramArray~sizeArray,pch=18,col="blue")
    legend("topright",legend = c("LrvHat","TSAPeriodogram","BasePeriodogram"),fill=c("black","green","blue"))
    abline(h = lrvOriginal*2)
    title("Original lrv and lrvHat",subtitle)
    graphics.off()
  }
}
