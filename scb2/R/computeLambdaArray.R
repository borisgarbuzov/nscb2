computeLambdaArray <- function(indexArray,
                              sigma,
                              type = "ThetaX",
                              ...)
{
  lambdaArray <- array(data = 0,dim = length(indexArray))
  thetaArray <- computeThetaArray(indexArray = indexArray,
                                      sigma = sigma,
                                      type = type,
                                      ... = ...)

  lambdaArray <- thetaArray[1]
  for (indexOfN in 2:length(indexArray))
  {
    lambdaArray[indexOfN] <- lambdaArray[indexOfN-1]+thetaArray[indexOfN]
  }
  return(lambdaArray)
}
