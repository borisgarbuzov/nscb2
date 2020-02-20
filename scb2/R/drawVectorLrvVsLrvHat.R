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

drawVectorLrvVsLrvHat <- function(size,
                              psi,
                              sigma,
                              mean,
                              isProductCol,
                              lrvHatCount)
{
  replicationCount <- getReplicationCountFromSampleSize(size)
  if(isProductCol)
  {
    fileName <- "productCol_lrv"
    lrvMatrixFunc <- createProductColReplicated
    matrixFunc <- lrvProductColReplicated
    mainTitle <-"ProductCol lrv & lrvHat"
  }else
  {
    # this branch gives bug in test 64
    fileName <- "betaArray_lrv"
    lrvMatrixFunc <- createBetaArrayReplicated
    matrixFunc <- computeBetaLRVArrayPsi0
    mainTitle <- "BetaArray lrv & lrvHat"
    psi <- 0
  }

  fileName <- timestampGenerator(fileName = fileName)


  lrvMatrixReplated <- matrixFunc(size = size,
                                  mean = mean,
                                  sigma = sigma,
                                  psi = psi)
  xArray <- 1:(size-1)
  nlrvMatrixReplicatedHat <- lrvHatCount
  lrvMatrixlReplicatedHatArray <- matrix(NA, nrow = size - 1,ncol = nlrvMatrixReplicatedHat)
  subtitle <- paste("lag\n","size=replicationcount = ",size,"\npsi = ",psi,
                    ", sigma = ", sigma, ", mean = ", mean)
  for(index in 1:nlrvMatrixReplicatedHat)
  {
    originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                      size = size,
                                                      psi = psi,
                                                      sigma = sigma,
                                                      mean = mean)
    matrixReplicated <- lrvMatrixFunc(originalReplicated = originalReplicated,
                                      psi = psi,
                                      sigma = sigma)

    lrvHat <- createLRVof3dArray(array3d = matrixReplicated)
    lrvMatrixlReplicatedHatArray[,index] <- lrvHat
    df <- data.frame(lrvMatrixReplated,lrvMatrixlReplicatedHatArray)
    max <- max(df, na.rm = TRUE)
    min <- min(df, na.rm = TRUE)
    saveJpg(fileName = fileName,"./plots")
    plot(lrvMatrixReplated ~ xArray, type = "n",col = "red",ylim = c(min,max),xlab  = "")
    title(main=mainTitle,sub = subtitle)
    lineArray <- c("LRV","LRVHat")
    legend("topright",
           title = "LRV",
           lineArray,
           fill = c("red","blue"))
    for(index in 1:nlrvMatrixReplicatedHat)
    {
      lines( lrvMatrixlReplicatedHatArray[,index]~xArray,col="blue")
    }
    lines(lrvMatrixReplated ~ xArray,col = "red")
    graphics.off()
  }
}
