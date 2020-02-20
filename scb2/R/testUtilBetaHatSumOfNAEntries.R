testUtilBetaHatSumOfNAEntries <- function(size,
                                       tParCount)
{
  sigma <- 1
  psi <- 0
  cat("\n Testing \'tests_scb2_141_BetaHatSumOfNAEntries\ \n")
  cat("\nTest parameters :","\n")
  cat("size= ",size,"\n")
  cat("tParCount= ",tParCount,"\n")

  sample <- 1:size
  cat ("sample = \n");print(sample); cat("\n")

  betaMatrixHat<-createBetaMatrixHat(sampleMA1 = sample,
                                     maxLag = size-1,
                                     tParCount=tParCount)
  cat ("betaMatrixHat = \n");print(betaMatrixHat); cat("\n")

  for (sampleIndex in 1:(size-1))
  {
    expect_equal(sum(is.na(betaMatrixHat[sampleIndex,])),sampleIndex-1)
  }

  cat(" End of test BetaHatSumOfNAEntries ","\n")
  cat("=====================")
}
