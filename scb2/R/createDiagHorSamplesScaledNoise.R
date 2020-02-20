createDiagHorSamplesScaledNoise <- function(sampleSize,
                                            tParCount,
                                             mean = 0,
                                             sigma,
                                             noise = NULL){
  "if noise is Null, then we use the parameters to generate the noise.
  If noise is given, we do not use the parameters like mean and sigma."
  if(is.null(noise)){
    noise <- createNoise(sampleSize,
                         mean,
                         sigma)
  }

  diagonalSample <-
    createDiagonalSampleScaledNoise(
      sampleSize = sampleSize,
      mean = mean,
      sigma = sigma,
      noise = noise
    )
  "Create the diagonal sample"
  horizontal2dSample <-
    createHorizontalSampleScaledNoise(
      sampleSize = sampleSize,
      tParCount = tParCount,
      mean = mean,
      sigma = sigma,
      noise = noise
    )
  "Create the horizontal sample"

  sampleList <- list(horizontal2dSample, diagonalSample)
  "Form the list consisting of two samples"
  return(sampleList)
}
