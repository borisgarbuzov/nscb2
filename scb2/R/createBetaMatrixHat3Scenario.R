createBetaMatrixHat3Scenario <- function(sampleMA1,
                                maxLag,
                                tParCount)
{
  size <- length(sampleMA1)
  if(maxLag>=size){
    stop("maxLag >= size")
  }
  gammaHat0 <- computeCovHat(tParArray = createTParArray(tParCount = tParCount),
                                  lag = 0,
                                  sample = sampleMA1)

  #randomlyChoosenIndex <- sample(1:tParCount,size = 1)

  betaMatrix <- array(dim = c(size, maxLag+1, tParCount))

  for(lag in 0:maxLag)
  {
    gammaHat <- computeCovHat(tParArray = createTParArray(tParCount = tParCount),
                                   lag = lag,
                                   sample = sampleMA1)


    rhoHat <- gammaHat/gammaHat0

    betaArrayHat <- array(dim = size-lag)
    betaArrayHat <- matrix(nrow = size-lag, ncol = tParCount)

    for (sampleIndex in 1:(size-lag))
    {
      betaArrayHat[sampleIndex,] <- sampleMA1[sampleIndex]*(sampleMA1[sampleIndex+lag]-rhoHat*sampleMA1[sampleIndex])
    }

    betaMatrix[1:(size-lag),lag+1,] <- betaArrayHat
  }
  betaMatrix<-betaMatrix[-size, ,]
  betaMatrix <- betaMatrix /gammaHat0
  return(betaMatrix)
}
