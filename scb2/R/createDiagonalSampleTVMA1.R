# This function creates the diagonal sample

createDiagonalSampleTVMA1 <- function(sampleSize,
                                      mean = 0,
                                      sigma,
                                      noise = NULL) {
  # If the noise is not submitted as a function argument,
  # it will be created. Otherwise, the submitted noise will be used.
  if(is.null(noise)){
    noise <- createNoise(sampleSize = sampleSize + 1,
                         mean = mean,
                         sd = sigma)
  }

  # Create an empty array for a diagonal sample
  diagonalSample <- array(data = 0, dim = sampleSize)

  # Each sample element is computed by formula: DS[i] = (i/n) * E[i] + E[i+1]
  for(i in 1:sampleSize){
    diagonalSample[i] <-
      customCoefFunction(tPar = i / sampleSize) * noise[i] +
      noise[i + 1]
  }

  return(diagonalSample)
}
