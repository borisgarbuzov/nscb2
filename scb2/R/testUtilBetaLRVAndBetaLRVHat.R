testUtilBetaLRVAndBetaLRVHat <- function(size,
                                         mean,
                                         sigma,
                                         psi,
                                         cutOffValue,
                                         type)
{
  cat("\n Testing \'tests_scb2_134_BetaLRVAndBetaLRVHat\' \n")
  cat("\nTest parameters :","\n")
  cat("size= ",size,"\n")
  cat("mean= ",mean,"\n")
  cat("sigma= ",sigma,"\n")
  cat("psi= ",psi,"\n")
  cat("cutOffValue= ",cutOffValue,"\n")
  cat("type= ",type,"\n")
  original <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma,
                                mean = mean)
  #cat ("original = \n");print(original); cat("\n")
  betaMatrix <- createBetaMatrix(sample = original,
                                 psi = psi,
                                 sigma = sigma,
                                 maxLag = size - 2)
  #cat ("betaMatrix = \n");print(betaMatrix); cat("\n")
  betaLrvHatArray <- array(dim = size-cutOffValue)
  for(lag in 1:(size-cutOffValue))
  {

    betaArray <- betaMatrix[1:(size-lag),lag]
    if(type == "OB")
    {
      batchSize <- ceiling(sqrt(length(betaArray)))
      betaLrvHatArray[lag] <- computeLRVofOB2dArray(original = betaArray,
                                                      batchSize = batchSize)
    }else
    {
      betaLrvHatArray[lag] <- estimateLRVWu2009ForNonCenteredSample(sample = betaArray)
    }
  }

  betaLRVArray <- computeBetaLRVArrayPsi0(size = size,
                                          mean = mean,
                                          sigma = sigma)
  yMax <- max(betaLrvHatArray,betaLRVArray)
  yMax <- yMax + 0.05*yMax
  yMin <- min(betaLrvHatArray,betaLRVArray)
  yMin <- yMin + 0.05*yMin
  fileName <- paste0("compareBetaLRVHatType",type,"VSBetaLRV")
  fileName <- timestampGenerator(fileName = fileName)
  mainTitle <- paste0("beta LRV vs lags, trigngular, ",type,", same sample")
  subTitle <- paste0("size = ",size,", mean = ",mean,", sigma = ",sigma," , psi = ",psi)
  saveJpg(fileName = fileName,path = "output")
  plot(y = betaLrvHatArray,x=1:(size-cutOffValue),xlab = "lag", ylab = "LRV",
       pch=20,col="blue",ylim = c(yMin,yMax))
  title(main = mainTitle,sub = subTitle)
  lines(y = betaLRVArray[1:(size-cutOffValue)],x = 1:(size-cutOffValue))
  legends <- c(type,"Theoretical")
  legend("topleft",legend = legends,pch = c(20,-1),lty = c(0,1),col = c("blue","black"))
  graphics.off()
  cat(" End of test BetaLRVAndBetaLRVHat ","\n")
  cat("=====================")
}
