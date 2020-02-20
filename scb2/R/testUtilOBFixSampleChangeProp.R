testUtilOBFixSampleChangeProp <- function(size,
                                          psi,
                                          sigma,
                                          mean,
                                          times)
{
  cat("\nTesting \'tests_68_testUtilOBFixSampleChangeProp\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")
  cat("times =",times,"\n")
  gammaLrv <- createGamma(sigma = sigma,
                          psi = psi)
  lrv <- gammaLrv[1]+2*gammaLrv[2]
  batchSizeArray <- seq(2,size-1,10)
  lrvArray <- matrix(NA,nrow = length(batchSizeArray),ncol = times)
  original <- matrix(data = NA,nrow = size,ncol = times)
  for(index in 1:times)
  {
    original[,index] <- createOriginalMA1(size = size,
                                          psi = psi,
                                          sigma = sigma,
                                          mean = mean)
  }
  fileName <- paste0("TestDimOB","_size_",size)
  fileName <- timestampGenerator(fileName = fileName)
  mainTitle <- paste0("Test dimension OB"," size=",size)
  subTitle <- paste0("psi = ",psi,", sigma = ",sigma,", mean = ",mean)
  for(index in 1:length( batchSizeArray))
  {
    for (indexCol in 1:times) {
      lrvArray[index,indexCol]<-computeLRVofOB2dArray(original = original[,indexCol],batchSize = batchSizeArray[index])
    }

    yMax <- max(lrvArray,lrv,na.rm = TRUE)
    yMin <- min(lrvArray,lrv,na.rm = TRUE)
    saveJpg(fileName = fileName,path = "plots")
    matplot(x = batchSizeArray,y = lrvArray,type="l",pch=19,ylim =c(yMin-(yMin*0.05),yMax + (yMax*0.05)))
    title(main = mainTitle,sub = subTitle)
    abline(h=lrv)
    graphics.off()
  }

  cat("\nEnd of test testUtilOBFixSampleChangeProp","\n")

  cat("=====================\n")
}
