#the function is used to calculate true LRV in the experiment with scaled noise.
#The input sd (sigma).
#The output is a trueLrv.

#called by computeTrueLrv


computeTrueLrvScaledNoise <- function(sigma,
                                      tPar){
  trueLrv <- computeGamma(sigma = sigma,
                          tPar = tPar,
                          lag = 0,
                          type = "ScaledNoise")
  return(trueLrv)
}
