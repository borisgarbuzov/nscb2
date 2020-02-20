testUtilBetaNonRadomOriginal1 <- function(size)
{
  sigma <- 1
  psi <- 0
  cat("\n Testing \'tests_scb2_131_BetaNonRadomOriginal1\ \n")
  cat("\nTest parameters :","\n")
  cat("size= ",size,"\n")
  cat("sigma= ",sigma,"\n")
  cat("psi= ",sigma,"\n")
  sample <- rep(1,size)

  cat ("sample = \n");print(sample); cat("\n")
  rho <- createRho(size = size,
                   psi = psi)

  cat ("rho = \n");print(rho); cat("\n")
  gamma <- createGamma(psi = psi,
                       sigma = sigma)

  cat ("gamma = \n");print(gamma); cat("\n")

  betaArray <- createBetaMatrix(sample = sample,
                               psi = psi,
                               sigma = sigma,
                               maxLag = size - 1)

  cat ("betaArray = \n");print(betaArray); cat("\n")

  cat(" End of test BetaNonRadomOriginal1 ","\n")
  cat("=====================")
}

