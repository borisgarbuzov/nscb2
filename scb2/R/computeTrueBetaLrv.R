#The function is used to obtain the true LRV in various experiments.
#The input is the sigma (sigma), tPar and type.
#depending on the type selected, one of the existing true LRV calculation
#methods will be used.

#called by ...



computeTrueBetaLrv <- function(sigma,
                           tPar,
                           type = "MA1")
{
  if(type == "MA1"){
    trueLrv <- computeTrueBetaLrvMA1(tPar)
  }
  if(type == "ScaledNoise"){
    trueLrv <- computeTrueBetaLrvScaledNoise()
  }
  return(trueLrv)
}
