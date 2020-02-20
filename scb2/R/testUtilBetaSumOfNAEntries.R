testUtilBetaSumOfNAEntries <- function(size)
{
  sigma <- 1
  psi <- 0
  cat("\n Testing \'tests_scb2_133_BetaSumOfNAEntries\ \n")
  cat("\nTest parameters :","\n")
  cat("size= ",size,"\n")
  cat("sigma= ",sigma,"\n")
  cat("psi= ",sigma,"\n")

  sample <- 1:size
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

  for (sampleIndex in 1:(size-1))
  {
    expect_equal(sum(is.na(betaArray[sampleIndex,])),sampleIndex-1)
  }

  cat(" End of test BetaSumOfNAEntries ","\n")
  cat("=====================")
}
