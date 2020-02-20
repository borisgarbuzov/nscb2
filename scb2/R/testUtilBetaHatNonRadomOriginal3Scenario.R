testUtilBetaHatNonRadomOriginal3Scenario <- function(size,
                                             tParCount)
{
  sigma <- 1
  psi <- 0
  cat("\n Testing \'tests_scb2_140_BetaHatNonRadomOriginal3Scenario\ \n")
  cat("\nTest parameters :","\n")
  cat("size= ",size,"\n")
  cat("tParCount= ",tParCount,"\n")

  sample <- 1:size
  cat ("sample = \n");print(sample); cat("\n")

  betaMatrixHat<-createBetaMatrixHat3Scenario(sampleMA1 = sample,
                                     maxLag = size - 1,
                                     tParCount=tParCount)

  cat ("betaMatrixHat = \n");print(betaMatrixHat); cat("\n")

  cat(" End of test BetaHatNonRadomOriginal3Scenario ","\n")
  cat("=====================")
}
