testUtilEstimateLRVbyQuadraticForm<-function(size,
                                      psi,
                                      sigma,
                                      mean,
                                      batchSize)
{
  cat("\nTesting \'tests_16_estimateLRVbyQuadraticForm\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("batchSze",batchSize,"\n")
  cat("=====================\n")

  originalMA1 <- createOriginalMA1(size,
                                   psi = psi,
                                   sigma = sigma,
                                   mean = mean)

  Start <- Sys.time()
  lrvHatNB<-estimateLRVbyQuadraticForm(sample = originalMA1,type="NB",batchSize = batchSize)
  lrvHatOB<-estimateLRVbyQuadraticForm(sample = originalMA1,type="OB",batchSize = batchSize)
  End <- Sys.time()

  cat("Result:\n")
  cat("lrvByQuadraticFormNB =",lrvHatNB," \n")
  cat("lrvByQuadraticFormOB =",lrvHatOB," \n")

  duration <- End - Start
  cat("duration = ",duration)

  cat("\n End of test estimateLRVByQuadraticForm")

}
