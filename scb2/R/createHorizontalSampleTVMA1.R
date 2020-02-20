# The function create a horizontal sample

createHorizontalSampleTVMA1 <- function(sampleSize,
                                        tParCount,
                                        mean = 0,
                                        sigma,
                                        noise = NULL){

  # If a noise is not submitted as a function argument,
  # it will be generated here.
  # Otherwise the submitted noise will be used
  if(is.null(noise)){
    noise <- createNoise(sampleSize = sampleSize + 1,
                         mean = mean,
                         sd = sigma)
  }

  # Create tParArray
  tParArray <- createTParArray(tParCount)
  # Create an empty matrix for a horizontal sample
  horizontal2dSample <- array(data = 0, dim = c(tParCount, sampleSize))

  # Each sample element is computed by formula: HS[i,j] = t[i]*E[j]
  for(i in 1:tParCount){
    for(j in 1:sampleSize){
      horizontal2dSample[i, j] <- customCoefFunction(tPar = tParArray[i]) *
        noise[j] + noise[j + 1]
    }
  }

  return(horizontal2dSample)
}
