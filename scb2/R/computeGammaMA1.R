#the function is used to calculate gamma in the experiment with MA1.
#The input is sigma and psi.
#The output is a gamma.

#called by computeGamma


computeGammaMA1 <- function(sigma, psi, lag){
  if (lag == 0) {
    gamma <- ((sigma ^ 2) * (1 + (psi ^ 2))) # a.k.a gamma0
  } else if (lag == 1) {
    gamma <- (psi * (sigma ^ 2)) # a.k.a gamma1
  } else {
    gamma <- 0
  }

  return(gamma)
}
