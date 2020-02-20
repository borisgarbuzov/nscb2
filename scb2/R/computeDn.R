computeDn <- function(indexArray,
                      sigma,
                      type,
                      batchSize,
                      ...)
{
  Dn <- array(data = 0,dim = length(indexArray))
  minIndex <- min(indexArray)
  maxIndex <- max(indexArray)
  lambda <- computeLambdaArray(indexArray = minIndex:(maxIndex+batchSize),
                               sigma = sigma,
                               type = type,
                               ... = ...)

  for(indexD in 1:length(indexArray))
  {
    for(indexBatchSize in 1:batchSize)
    {
      Dn[indexD] <- Dn[indexD]+(lambda[indexD+indexBatchSize]-lambda[indexBatchSize])
    }
  }
  return(Dn)
}
