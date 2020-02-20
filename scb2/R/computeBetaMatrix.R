computeBetaMatrix <- function(sample,
                              psi,
                              sigma,
                              maxLag,
                              tPar,
                              type = "MA1"){
  if(type == "MA1"){

  }
  if(type == "ScaledNoise"){
    betaMatrix <- computeBetaMatrixScaledNoise(sample,
                                               psi,
                                               sigma,
                                               maxLag,
                                               tPar)
  }
  return(betaMatrix)

}
