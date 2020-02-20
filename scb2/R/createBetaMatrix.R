createBetaMatrix <- function(sample,
                             psi,
                             sigma,
                             maxLag) {

  size <- length(sample)
  if(maxLag > size){
    stop("maxLag >= size")
  }
  rho <- createRho(size = size,
                   psi = psi)
  rho[length(rho)+1] <- 0
  gamma <- createGamma(psi = psi,
                       sigma = sigma)
  gamma0 <- gamma[1]

  betaMatrix <- matrix(nrow = length(sample)-1, ncol = maxLag+1)
  for (sampleIndex in 1:(size-1))

  {
    for (lag in 0:maxLag)
    {
      beta <- sample[sampleIndex]*(sample[sampleIndex+lag]-rho[lag+1]*sample[sampleIndex])
      betaMatrix[sampleIndex,lag+1] <- beta
    }
  }
  betaMatrix <- betaMatrix/gamma0
  return(betaMatrix)
}
