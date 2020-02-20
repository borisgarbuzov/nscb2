#the function is used to calculate gamma in the experiment with MA1.
#The input is sigma and psi.
#The output is a gamma.

#called by computeGamma


createGammaMA1 <- function(sigma,
                           psi){
  gamma <- rep(0, 2)
  gamma[1] <- ((sigma ^ 2) * (1 + (psi ^ 2))) # a.k.a gamma0
  gamma[2] <- (psi * (sigma ^ 2)) # a.k.a gamma1
  gamma
}
