computeBetaMatrixScaledNoise <- function(sample,
                                         psi,
                                         sigma,
                                         maxLag,
                                         tPar){
  size <- length(sample)
  if(maxLag > size){
    stop("maxLag >= size")
  }

  betaMatrix <- matrix(nrow = length(sample)-1, ncol = maxLag+1)
  for (observationIndex in 1:(size-1)){
    "lag = observationIndex - 1."
    for (lag in 0:maxLag){
      gamma <- computeGamma(sigma, psi, tPar, type = "ScaledNoise", lag = 0)
      rho <- computeRho(type = "ScaledNoise", lag = lag)
      betaMatrix[observationIndex,lag+1] <- sample[observationIndex]*
        (sample[observationIndex+lag]-sample[observationIndex]*rho)/gamma
    }
  }

  return(betaMatrix)
}
