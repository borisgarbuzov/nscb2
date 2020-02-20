#' @title drawVectorLrvVsLrvHatForSize
#
#' @name drawVectorLrvVsLrvHatForSize
#'
#' @aliases drawVectorLrvVsLrvHatForSize
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

drawVectorLrvVsLrvHatForSize <- function(sizeArray,
                                         psi,
                                         sigma,
                                         mean,
                                         isProductCol)
{
  if(isProductCol)
  {
    lrvMatrixFunc <- createProductColReplicated
    fileName <- "productCol"
    matrixFunc <- lrvProductColReplicated
    mainTitle <- "Product Col Lrv and LrvHat From sampleSize and with lag"

  }else
  {
    lrvMatrixFunc <- createBetaArrayReplicated
    fileName <- "betaArray"
    matrixFunc <- computeBetaLRVArrayPsi0
    mainTitle <- "Beta Array Lrv and LrvHat From sampleSize and with lag"
    psi <- 0
  }
  lagFile <- paste("lag", c(0,1,2), sep="")
  fileNames <- c("lrv_productCol_SS_lag1","lrv_productCol_SS_lag2","lrv_productCol_SS_lag3")
  fileNames <- paste("lrv",fileName,"SS",lagFile,sep = "_")
  fileNames <- timestampGenerator(fileNames)
  subtitle <- paste("psi =", psi, ", sigma =",sigma)

  lrvMatrixReplicated = matrixFunc(size=sizeArray[1],
                                   mean=mean,
                                   sigma = sigma,
                                   psi=psi)

  lrvMatrixReplicated3Lag <- rbind(rep(lrvMatrixReplicated[1],
                                       length(sizeArray)),
                                   rep(lrvMatrixReplicated[2],
                                       length(sizeArray)),
                                   rep(lrvMatrixReplicated[3],
                                       length(sizeArray)
                                   )
  )

  lrvHatArray <- matrix(nrow = 3, ncol = length(sizeArray))
  for(index in 1:length(sizeArray))
  {
    replicationCount = getReplicationCountFromSampleSize(sizeArray[index])
    originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                      size = sizeArray[index],
                                                      psi = psi,
                                                      sigma = sigma,
                                                      mean = mean)
    lrvHatMatrixReplicated <- lrvMatrixFunc(originalReplicated = originalReplicated,
                                            psi=psi,
                                            sigma=sigma)
    lrvHat <- createLRVof3dArray(array3d = lrvHatMatrixReplicated)
    lrvHatArray[1,index] <- lrvHat[1]
    lrvHatArray[2,index] <- lrvHat[2]
    lrvHatArray[3,index] <- lrvHat[3]

    for(indexLag in 1:3)
    {

      yMax<-max(lrvHatArray[indexLag, ], lrvMatrixReplicated3Lag[indexLag, ], na.rm = T) + 2
      yMin<-min(lrvHatArray[indexLag, ], lrvMatrixReplicated3Lag[indexLag, ], na.rm = T) - 2
      saveJpg(fileName = fileNames[indexLag],"./plots")
      plot(lrvMatrixReplicated3Lag[indexLag, ] ~ sizeArray,
           type="l",
           col = "blue",
           ylim = c(yMin-0.01,yMax+0.01),
           ylab = "lrv and lrvHat",
           xlab="size=replicationCount")
      points(lrvHatArray[indexLag, ] ~ sizeArray, pch = 20)
      mainTitleTemp <- paste(mainTitle,indexLag-1)
      title(main = mainTitleTemp,sub = subtitle)
      graphics.off()
    }

  }
}
