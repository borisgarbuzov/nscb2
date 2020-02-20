
"The function create a horizontal sample"
createHorizontalSampleScaledNoise <- function(sampleSize,
                                               tParCount,
                                               mean = 0,
                                               sigma,
                                               noise = NULL){

  if(is.null(noise)){
    noise <- createNoise(sampleSize,
                         mean,
                         sigma)
  }
  "If a noise is not submitted as a function argument,
  it will be generated here.
  Otherwise the submitted noise will be used"

  "Create tParArray"
  tParArray = createTParArray(tParCount)
  "Create an empty matrix for a horizontal sample"
  horizontal2dSample <- array(data = 0, dim = c(tParCount, sampleSize))

  "Each sample element is computed by formula: HS[i,j] = t[i]*E[j]"
  for(i in 1:tParCount){
    for(j in 1:sampleSize){
      # horizontal2dSample[i,j] <- tParArray[i]*noise[j]
      # changed t to t+1 coefficient due to zero denominator issue
      #horizontal2dSample[i,j] <- (tParArray[i] + 1)*noise[j]
      horizontal2dSample[i,j] <- (customCoefFunction(tParArray[i]))*noise[j]
    }
  }

  return(horizontal2dSample)
}
