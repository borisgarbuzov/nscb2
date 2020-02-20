computeBn <- function(indexArray,
                      sigma,
                      type,
                      batchSize,
                      ...)
{
  Bn <- array(data = 0,dim = length(indexArray))
  minIndex <- min(indexArray)
  maxIndex <- max(indexArray)
  lambda <- computeLambdaArray(indexArray = minIndex:(maxIndex+batchSize),
                               sigma = sigma,
                               type = type,
                               ... = ...)

  for(indexB in 1:length(indexArray))
  {
    for(indexBatchSize in 1:batchSize)
    {
      Bn[indexB] <- Bn[indexB]+(lambda[indexB+indexBatchSize]-lambda[indexBatchSize])^2
    }
  }
  return(Bn)
}
