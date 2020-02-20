#the function is used to calculate rho in the experiment with MA1.
#The input sample size and the coefficient of psi.
#The output is a rho.

#called by computeRho

createRhoMA1 <- function(size,
                         psi)
{
  rho <- rep(0, times = size-1)
  # version 1
  rho [1] <- 1
  rho [2] <- psi / (1 + psi ^ 2)
  # version 2
  # rho [1] <- psi / (1 + psi ^ 2)
  rho
}
