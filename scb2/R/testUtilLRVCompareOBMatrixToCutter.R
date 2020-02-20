testUtilLRVCompareOBMatrixToCutter <- function(sizeArray,
                                               sigma,
                                               psi,
                                               mean)
{
  cat("\nTesting \'tests_74_testUtilLRVCompareOBMatrixToCutter\' \n")

  cat("Test parameters:", "\n")
  cat("size =", sizeArray, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")
  gammaLrv<-createGamma(sigma = sigma,psi = psi)
  lrv <- gammaLrv[1]+2*gammaLrv[2]
  cutterLRV <- rep(NA,length(sizeArray))
  matrixLrv <- rep(NA,length(sizeArray))

  fileName <- "LRVCompareMatrixToCutter"
  fileName <- timestampGenerator(fileName = fileName)
  mainTitle <- "Compare lrv Matrix and Cutter For OB"
  for(index in 1:length(sizeArray))
  {
    batchSize <- sizeArray[index]/2
    original <- createOriginalMA1(size = sizeArray[index],
                                  psi = psi,
                                  sigma = sigma,
                                  mean = mean)
    cutterLRV[index]<-computeLRVofOB2dArray(original = original, batchSize = batchSize)
    matrixLrv[index]<-estimateLRVbyQuadraticForm(sample = original,type="OB",batchSize = batchSize)

    yMin <- min(cutterLRV,matrixLrv,lrv,na.rm = TRUE)
    yMax <- max(cutterLRV,matrixLrv,lrv,na.rm = TRUE)
    saveJpg(fileName = fileName,path="./plots/")
    plot(x = sizeArray,y=jitter(cutterLRV,factor = 5),type = "l",ylim = c(yMin-0.2*abs(yMin),yMax+0.2*yMax),
         col="blue",ylab = "lrv")
    lines(x=sizeArray,y=jitter(matrixLrv,factor = 5),col="red")
    legend("bottomleft",legend = c("cutter LRV","matrix LRV"),col = c("blue","red"),
           fill = c("blue","red"))
    title(main = mainTitle)
    abline(h=lrv)
    graphics.off()
  }
  cat("End of test testUtilLRVCompareOBMatrixToCutter","\n")

  cat("=====================\n")
}
