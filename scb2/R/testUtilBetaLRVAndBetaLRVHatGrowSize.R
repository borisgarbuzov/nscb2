testUtilBetaLRVAndBetaLRVHatGrowSize <- function(maxSize,
                                                 sizeIncrement,
                                                 mean,
                                                 sigma,
                                                 psi,
                                                 lag,
                                                 cutOffValue,
                                                 type)
{
  cat("\n Testing \'tests_scb2_135_BetaLRVAndBetaLRVHatGrowSize\ \n")
  cat("\nTest parameters :","\n")
  cat("maxSize= ",maxSize,"\n")
  cat("sizeIncrement= ",sizeIncrement,"\n")
  cat("mean= ",mean,"\n")
  cat("sigma= ",sigma,"\n")
  cat("psi= ",psi,"\n")

  cat("lag= ",lag,"\n")
  cat("type= ",type,"\n")

  sizeArray <- seq(lag+cutOffValue,maxSize,sizeIncrement)
  betaLrvHatArray <- array(dim = length(sizeArray))
  betaLrvArray <- array(dim = length(sizeArray))
  for(indexSize in 1:length(sizeArray))
  {
    original <- createOriginalMA1(size = sizeArray[indexSize],
                                  psi = psi,
                                  sigma = sigma,
                                  mean = mean)
    betaMatrix <- createBetaMatrix(sample = original,
                                   psi = psi,
                                   sigma = sigma,
                                   maxLag = lag)
    betaArray <- betaMatrix[complete.cases(betaMatrix[,lag+1]),lag+1]
    if("OB"==type)
    {
      #batchSize <- ceiling((sizeArray[indexSize]-lag)/2)
      batchSize <- floor(sqrt(sizeArray[indexSize]-lag))
      betaLrvHatArray[indexSize] <- computeLRVofOB2dArray(original = betaArray,
                                                          batchSize = batchSize)
    }else{
      betaLrvHatArray[indexSize] <- estimateLRVWu2009ForNonCenteredSample(sample = betaArray)
    }
    betaLrvArray[indexSize] <- computeBetaLRVpsi0(lag = lag,
                                                  mean = mean,
                                                  sigma = sigma)
  }
  yMax <- max(betaLrvHatArray,betaLrvArray)
  yMax <- yMax + 0.05*yMax
  yMin <- min(betaLrvHatArray,betaLrvArray)
  yMin <- yMin + 0.05*yMin
  fileName <- paste0("betaLRVHatType",type,"AndBetaLRVSize")
  fileName <- timestampGenerator(fileName = fileName)
  path <- "output"
  saveJpg(fileName = fileName, path = path)

  mainTitle <- paste0("beta LRV vs sample size, trapezoidal, OBM,\n batchSize = sqrt(sampleSize),\n single lag, each point corresponds to a different sample")
  subTitle <- paste0("lag = ",lag,", mean = ",mean,", sigma = ",sigma,", psi = ",psi)
  plot(x = sizeArray,y = betaLrvHatArray,col="blue",pch=20,
       main = mainTitle,sub = subTitle,ylim = c(yMin,yMax))
  lines(x=sizeArray,y=betaLrvArray)
  legend("topright",legend = c(type,"Theoretical"),
         pch=c(20,-1),lty = c(0,1),col = c("blue","black"))
  graphics.off()
  cat(" End of test BetaLRVAndBetaLRVHatGrowSize ","\n")
}
