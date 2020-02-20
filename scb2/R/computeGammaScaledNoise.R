#the function is used to calculate gamma in the experiment with scaled noise.
#The input tPar.
#The output is a gamma.

#called by computeGamma


computeGammaScaledNoise <- function(tPar, sigma, lag){
  if(lag == 0){
    #gamma <- (tPar+1)^2*sigma^2
    gamma <- customCoefFunction(tPar)^2*sigma^2
  }
  if(lag != 0){
    gamma <- 0
  }
  return(gamma)
}
