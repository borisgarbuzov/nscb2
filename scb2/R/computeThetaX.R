computeThetaX <- function(index,
                          sigma)
{
  if(index<0)
  {
    return(0)
  }
  return(sigma*computePsi(index = index))
}
