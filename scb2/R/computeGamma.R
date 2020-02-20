#The function is used to obtain the gamma needed to construct the beta matrix.
#The input is the sigma, psi, tPar and type.
#depending on the type selected, one of the existing gamma calculation methods will be used.

#called by ...



computeGamma <- function(sigma = NULL,
                        psi = NULL,
                        tPar = NULL,
                        type = "MA1",
                        lag = NULL) {
  if(type == "MA1"){
    gamma <- computeGammaMA1(sigma, psi, lag)
  }
  if(type == "ScaledNoise"){
    gamma <- computeGammaScaledNoise(tPar, sigma, lag)
  }
  return(gamma)
}



