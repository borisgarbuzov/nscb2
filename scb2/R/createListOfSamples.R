createListOfSamples <- function(sampleSize,
                                tParCount,
                                mean,
                                sd,
                                noise = NULL)
{
  if(is.null(noise)){
    noise <- createNoise(sampleSize+1,
                         mean,
                         sd)
  }

  psiArray <- createTVMA1CoefArray(sampleSize = tParCount)
  diagonalSample <- array(data = 0, dim=sampleSize)
  horizontal2dSample <- array(data = 0, dim = c(tParCount, sampleSize))

  for(i in 1:tParCount){
    for(j in 1:sampleSize){
      horizontal2dSample[i,j] <- psiArray[i]*noise[j]+noise[(j+1)]
    }
  }

  for(i in 1:sampleSize){
    diagonalSample[i] <- customCoefFunction(i/sampleSize)*noise[i] + noise[(i+1)]
  }

  sampleList <- list(horizontal2dSample, diagonalSample)
  return(sampleList)
}
