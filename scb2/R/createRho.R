createRho <- function(size,
                      psi,
                      type = "MA1") {
  rho <- rep(0, times = size-1)
  # version 1
  rho [1] <- 1
  rho [2] <- psi / (1 + psi ^ 2)
  # version 2
  # rho [1] <- psi / (1 + psi ^ 2)
  rho
}
