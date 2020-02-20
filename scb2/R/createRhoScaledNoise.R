#the function is used to calculate rho in the experiment with scaled noise.
#The input sample size and the coefficient of psi.
#The output is a rho.

#called by computeRho

createRhoScaledNoise <- function(lag)
{
  if(lag == 0){
    rho <- 1
  }
  if(lag != 0){
    rho <- 0
  }
  rho
}
