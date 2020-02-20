testUtilOBConstantProporsion <- function(sizeArray,
                 psi,
                 sigma,
                 mean,
                 batchSizeProporsion)
{
  cat("\nTesting \'tests_69_testUtilOBConstantProporsion\' \n")

  cat("Test parameters:", "\n")
  cat("sizeArray =", sizeArray, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")
  cat("batchSizeProporsion =",batchSizeProporsion,"\n")
  gammaLrv <- createGamma(sigma = sigma,
                          psi = psi)
  lrv <- gammaLrv[1]+2*gammaLrv[2]
  lrvArray <- rep(NA,length(sizeArray))
  for(index in 1:length(sizeArray))
  {
    original <- createOriginalMA1(size = sizeArray[index],
                                  psi = psi,
                                  sigma = sigma,
                                  mean = mean)
    batchSize <- ceiling(sizeArray[index]*batchSizeProporsion)
    lrvArray[index]<-computeLRVofOB2dArray(original = original,batchSize = batchSize)
    plot(sizeArray,lrvArray,type="l",col="blue")
    abline(h=lrv)
  }
  cat("\nEnd of test testUtilOBConstantProporsion","\n")

  cat("=====================\n")
}
