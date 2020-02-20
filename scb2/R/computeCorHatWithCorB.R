"Compute the correlation estimate, using the specific bandwidth for covariance"
computeCorHatWithCovB <- function(tPar,
                                  sample,
                                  lag,
                                  bCov){
  "bandWidth for gamma or covB is a redundant argument, but I leave it hear for 2 reasons.
  1. Historically, I did the same in the lower level functions.
  2. This way I will avoid the repeated calculations of bandwidth"
  gammaHat = computeCovHatWithCovB(tPar = tPar,
                                   sample = sample,
                                   lag = lag,
                                   bCov = bCov)
  "Compute gammaHat of a given lag"
  gammaHat0 = computeCovHatWithCovB(tPar = tPar,
                                    sample = sample,
                                    lag = 0,
                                    bCov = bCov)
  "Compute rhoHat"
  if(gammaHat0 != 0){
    rhoHat = gammaHat/gammaHat0
  }else{
    rhoHat = 1
    cat("\nZERO DENOMINATOR!!! gammaHat0 = 0\n")
  }


  return(rhoHat)
}
