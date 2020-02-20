createDiagHorSamplesMA1 <- function(sampleSize,
                                    tParCount,
                                    mean = 0,
                                    sigma,
                                    noise = NULL){
  # if noise is Null, then we use the parameters to generate the noise.
  # If noise is given, we do not use the parameters like mean and sigma.
  if(is.null(noise)){
    noise <- createNoise(sampleSize = sampleSize + 1,
                         mean = mean,
                         sd = sigma)
  }

  # Create the diagonal sample
  diagonalSample <-
    createDiagonalSampleTVMA1(
      sampleSize = sampleSize,
      mean = mean,
      sigma = sigma,
      noise = noise
    )

  # Create the horizontal sample
  horizontal2dSample <-
    createHorizontalSampleTVMA1(
      sampleSize = sampleSize,
      tParCount = tParCount,
      mean = mean,
      sigma = sigma,
      noise = noise
    )

  # Form the list consisting of two samples
  sampleList <- list(horizontal2dSample, diagonalSample)

  return(sampleList)
}
