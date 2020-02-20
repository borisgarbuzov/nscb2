testUtilBetaLRVAndBetaLRVHatSizeExpansion <- function(maxSize,
                                                      sizeIncrement,
                                                      sigma,
                                                      lag,
                                                      numberOfTests,
                                                      type)
{
  #Fixed
  mean0 <- 0
  psi0 <- 0
  cat("\n Testing \'tests_scb2_138_BetaLRVAndBetaLRVHatGrowSizeExpansion\ \n")
  cat("\nTest parameters :","\n")
  cat("maxSize= ",maxSize,"\n")
  cat("sizeIncrement= ",sizeIncrement,"\n")
  cat("mean= ",mean0,"\n")
  cat("sigma= ",sigma,"\n")
  cat("psi= ",psi0,"\n")

  cat("lag= ",lag,"\n")
  cat("type= ",type,"\n")

  betaLRVHatAndSizeBrick<-betaLRVHAtArrayExpansion(maxSize = maxSize,
                                                   sizeIncrement = sizeIncrement,
                                                   sigma = sigma,
                                                   lag = lag,
                                                   type)

  betaLRVHatArray <- betaLRVHatAndSizeBrick[,1]

  betaLRVHatMatrix <- matrix(nrow = length(betaLRVHatArray),ncol = numberOfTests)

  betaLRVHatMatrix[,1] <- betaLRVHatArray

  sizeArray <- betaLRVHatAndSizeBrick[,2]

  for (indexTest in 2:numberOfTests)
  {
    betaLRVHatAndSizeBrick<-betaLRVHAtArrayExpansion(maxSize = maxSize,
                                                     sizeIncrement = sizeIncrement,
                                                     sigma = sigma,
                                                     lag = lag)
    betaLRVHatMatrix[,indexTest] <- betaLRVHatAndSizeBrick[,1]
  }

  betaLrv <- computeBetaLRVpsi0(lag = lag,
                                mean = mean0,
                                sigma = sigma)

  yMax <- max(betaLRVHatMatrix,betaLrv)
  yMax <- yMax + 0.05*yMax
  yMin <- min(betaLRVHatMatrix,betaLrv)
  yMin <- yMin - 0.05*yMin
  fileName <- paste0("betaLRVHatType",type,"AndBetaLRVSizeExpansion")
  fileName <- timestampGenerator(fileName = fileName)
  path <- "output"
  saveJpg(fileName = fileName, path = path)

  mainTitle <- paste0("beta LRV vs sample size, trapezoidal beta till lag, OBM,\n batchSize = sqrt(sampleSize), single lag LRV, \n each color corresponds to a different sample")
  subTitle <- paste0("lag = ",lag,", mean = ",mean0,", sigma = ",sigma,", psi = ",psi0)
  matplot(x = sizeArray,y = betaLRVHatMatrix, type="l",
          main = mainTitle,sub = subTitle,ylim = c(yMin,yMax))
  abline(h = betaLrv)

  graphics.off()
  cat(" End of test BetaLRVAndBetaLRVHatGrowSizeExpansion ","\n")
}
