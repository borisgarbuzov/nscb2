"This function creates the diagonal sample"
createDiagonalSampleScaledNoise <- function(sampleSize,
                                 mean = 0,
                                 sigma,
                                 noise = NULL){

  "If the noise is not submitted as a function argument,
  it will be created. Otherwise, the submitted noise will be used. "
  if(is.null(noise)){
    noise <- createNoise(sampleSize,
                         mean,
                         sigma)
  }

  "Create an empty array for a diagonal sample"
  diagonalSample <- array(data = 0, dim=sampleSize)

  "Each sample element is computed by formula: DS[i] = (i/n)*E[i]"
  for(i in 1:sampleSize){
    # diagonalSample[i] <- i/sampleSize*noise[i]
    # changed t to t+1 coefficient due to zero denominator issue
    #diagonalSample[i] <- ((i/sampleSize) + 1)*noise[i]
    diagonalSample[i] <- (customCoefFunction(i/sampleSize))*noise[i]
  }

  return(diagonalSample)
}
