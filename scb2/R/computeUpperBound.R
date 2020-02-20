computeUpperBound <- function(indexArray,
                              sigma,
                              type,
                              ...)
{
  infty <- 100
  maxIndex <- max(indexArray)
  minIndex <- min(indexArray)
  extentedIndex <- minIndex:(maxIndex + infty)
  lambda <- computeLambdaArray(indexArray = extentedIndex,
                               sigma = sigma,
                               type = type,
                               ... = ...)
  upperBound <- 0
  for (indexUpper in 1:length(indexArray-1))
  {
    upperBound = upperBound+lambda[indexUpper]^2
  }
  for(indexUpper in 1:infty)
  {
    upperBound <- upperBound + (lambda[maxIndex+indexUpper]-lambda[indexUpper])^2
  }
  return(upperBound)
}
