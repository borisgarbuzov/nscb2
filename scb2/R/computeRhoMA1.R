#the function is used to calculate rho in the experiment with MA1.
#The input sample size and the coefficient of psi.
#The output is a rho.

#called by computeRho

computeRhoMA1 <- function(lag, psi) {
  # version 1
  #rho <- rep(0, times = size-1)
  #rho [1] <- 1
  #rho [2] <- psi / (1 + psi ^ 2)
  # version 2
  if (lag == 0) {
    rho <- 1
  } else if (lag == 1) {
    rho <- psi / (1 + psi ^ 2)
  } else {
    rho <- 0
  }

  return(rho)
}
