computeThetaQuad <- function(index,
                             sigma)
{
  if(index <= 0)
  {
    return(0)
  }
  psi <- computePsi(index = index)
  psiInf <- 0
  for(indexPsi in (index+1):(100+index))
  {
    psiInf<- psiInf + computePsi(index = indexPsi)^2
  }
  theta <- sigma^2 * psi * sqrt(2) * sqrt(psi^2 + 2*psiInf)
  return(theta)
}
