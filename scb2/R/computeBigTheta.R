computeThetaBlockSum <- function(index,
                                  sigma,
                                  batchSize)
{
  if(index < 0)
  {
    return(0)
  }
  theta <- 0
  for(indexTheta in (index-batchSize+1):index)
  {
    if(indexTheta < 0)
    {
      next()
    }
    theta <- theta + computePsi(index = indexTheta)
  }
  theta <- sigma*theta
  return(theta)
}
