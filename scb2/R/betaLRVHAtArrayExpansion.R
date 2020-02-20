betaLRVHAtArrayExpansion <- function(maxSize,
                                     sizeIncrement,
                                     sigma,
                                     lag,
                                     type = "OB")
{
  #fixed
  mean0 <- 0
  psi0 <- 0


  sample <- createOriginalMA1(size = maxSize,
                              psi = psi0,
                              mean = mean0,
                              sigma = sigma)

  betaMatrix <- createBetaMatrix(sample = sample,
                                 psi = psi0,
                                 sigma = sigma,
                                 maxLag = lag)

  betaArray <- betaMatrix[complete.cases(betaMatrix[,lag+1]),lag+1]

  sizeArray <- seq(sizeIncrement,length(betaArray),sizeIncrement)

  betaLrvHatArray <- array(dim = length(sizeArray))

  for(indexSize in 1:length(sizeArray))
  {
    if("OB"==type)
    {
      #batchSize <- ceiling((sizeArray[indexSize]-lag)/2)
      batchSize <- floor(sqrt(sizeArray[indexSize]))
      betaLrvHatArray[indexSize] <- computeLRVofOB2dArray(original = betaArray,
                                                          batchSize = batchSize)
    }else{
      betaLrvHatArray[indexSize] <- estimateLRVWu2009ForNonCenteredSample(sample = betaArray)
    }
  }
  return(cbind(betaLrvHatArray,sizeArray))
}
