computePsi <-function(index)
{
  if(index == -1)
  {
    return(0)
  }
  psi <- (index+1)^(-1.2)
  return(psi)
}
