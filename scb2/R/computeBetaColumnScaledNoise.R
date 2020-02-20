computeBetaColumnScaledNoise <- function(sample,
                                         psi,
                                         sigma,
                                         lag,
                                         tPar){
  size <- length(sample)

  betaColumn <- array(data = NA, dim = length(sample)-1)
  for (observationIndex in 1:(size-1)){
    gamma <- computeGamma(sigma, psi, tPar, type = "ScaledNoise", lag = 0)
    rho <- computeRho(type = "ScaledNoise", lag = lag)
    betaColumn[observationIndex] <- sample[observationIndex]*
      (sample[observationIndex+lag]-sample[observationIndex]*rho)/gamma
  }

  return(betaColumn)
}
