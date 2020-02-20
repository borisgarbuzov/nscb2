computeTheta <- function(index,
                         sigma,
                         batchSize)
{
  if(index < 0)
  {
    return(0)
  }else{
    if(index >= batchSize)
    {
      return(0)
    }
  }
  return((sigma^2)*sqrt(batchSize-index+1))
}
