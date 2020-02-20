computeThetaBlockSumSquare <- function(index,
                                       sigma,
                                       batchSize)
{
  if(index<0)
  {
    return(0)
  }
  theta <- 0
  for(indexTheta in index:(index+100))
  {
    theta <- theta + computeThetaBlockSum(indexTheta,sigma,batchSize)^2
  }
  theta <- sqrt(2)*abs(computeThetaBlockSum(index,sigma,batchSize))*(sigma^2)*
    sqrt(computeThetaBlockSum(index,sigma,batchSize)^2+2*theta)
  return(theta)
}
