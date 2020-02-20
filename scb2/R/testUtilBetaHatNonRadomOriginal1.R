testUtilBetaHatNonRadomOriginal1 <- function(size,
                                          tParCount)
{
  sigma <- 1
  psi <- 0
  cat("\n Testing \'tests_scb2_139_BetaHatNonRadomOriginal1\ \n")
  cat("\nTest parameters :","\n")
  cat("size= ",size,"\n")
  cat("tParCount= ",tParCount,"\n")

  sample <- rep(1,size)
  cat ("sample = \n");print(sample); cat("\n")

  betaMatrixHat<-createBetaMatrixHat(sampleMA1 = sample,
                                     maxLag = size - 1,
                                     tParCount=tParCount)

  cat ("betaMatrixHat = \n");print(betaMatrixHat); cat("\n")

  cat(" End of test BetaHatNonRadomOriginal1 ","\n")
  cat("=====================")
}
