#The function is used to obtain the rho needed to construct the beta matrix.
#The input is the sample size, psi, and type.
#depending on the type selected, one of the existing rho calculation methods will be used.

#called by ...


computeRho <- function(size = 1,
                      psi = 1/2,
                      type = "MA1",
                      lag = 1) {
  if(type == "MA1"){
    rho <- computeRhoMA1(lag = lag, psi = psi)
  }
  if(type == "ScaledNoise"){
    rho <- computeRhoScaledNoise(lag)
  }
  return(rho)
}
