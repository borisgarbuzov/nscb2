createBetaMatrixHat <- function(sampleMA1,
                                maxLag,
                                tParCount)
{
  size <- length(sampleMA1)
  if(maxLag > size){
    stop("maxLag >= size")
  }
  gammaHat0 <- mean(computeCovHat(tParArray = createTParArray(tParCount = tParCount),
                                  lag = 0,
                                  sample = sampleMA1))

  #randomlyChoosenIndex <- sample(1:tParCount,size = 1)

  betaMatrix <- matrix(nrow = size, ncol = maxLag+1)

  for(lag in 0:maxLag)
  {
    gammaHat <- mean(computeCovHat(tParArray = createTParArray(tParCount = tParCount),
                              lag = lag,
                              sample = sampleMA1))


    rhoHat <- gammaHat/gammaHat0

    betaArrayHat <- array(dim = size-lag)

    for (sampleIndex in 1:(size-lag))
    {
      betaArrayHat[sampleIndex] <- sampleMA1[sampleIndex]*(sampleMA1[sampleIndex+lag]-rhoHat*sampleMA1[sampleIndex])
    }

      betaMatrix[1:(size-lag),lag+1] <- betaArrayHat
  }
  betaMatrix<-betaMatrix[-size,]
  betaMatrix <- betaMatrix /gammaHat0
  return(betaMatrix)
}
