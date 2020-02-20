testUtilBetaHatLRVHatAndBetaLRVHat <- function(size,
                                               sigma,
                                               tParCount)
{
  #fixed
  mean0 <- 0
  psi0 <- 0

  cat("\n Testing \'tests_scb2_142_BetaHatLRVHatAndBetaLRVHat\ \n")
  cat("\nTest parameters :","\n")
  cat("size= ",size,"\n")
  cat("sigma= ",sigma,"\n")
  cat("mean= ",mean0,"\n")
  cat("tParCount= ",tParCount,"\n")
  cat("psi= ",psi0,"\n")

  sampleMA1 <- createOriginalMA1(size = size,
                                 psi = psi0,
                                 sigma = sigma,
                                 mean = mean0)

  betaMatrixHat<-createBetaMatrixHat(sampleMA1 = sampleMA1,
                                     maxLag = size-1,
                                     tParCount = tParCount)
  betaMatrix <- createBetaMatrix(sample = sampleMA1,
                                 psi = psi0,
                                 sigma = sigma,
                                 maxLag = size-1)
  betaHatLrvHatArray <- array(dim = size)
  betaLrvHatArray <- array(dim = size)
  for(lagIndex in 1:size)
  {
    betaArrayHat <- betaMatrixHat[1:(size-lagIndex),lagIndex]
    betaArray <- betaMatrix[1:(size-lagIndex),lagIndex]

    batchSize <- sqrt(length(betaArrayHat))

    betaHatLrvHatArray[lagIndex] <- computeLRVofOB2dArray(original = betaArrayHat, batchSize = batchSize)

    betaLrvHatArray[lagIndex]  <- computeLRVofOB2dArray(original = betaArray, batchSize = batchSize)
  }

  yMax <- max(betaHatLrvHatArray, betaLrvHatArray, na.rm = TRUE)
  yMax <- yMax + 0.05*yMax

  yMin <- min(betaHatLrvHatArray, betaLrvHatArray, na.rm = TRUE)
  yMin <- yMin + 0.2*yMin

  betaLRV <- computeBetaLRVArrayPsi0(size = size,
                                     mean = mean0,
                                     sigma = sigma)

  fileName <- "betaHatLrvHatArrayForAllLag"
  fileName <- timestampGenerator(fileName = fileName)

  mainTitle <- "LRVhat(betahat(Y)) and LRVhat(beta(Y)) vs lags,\n triangular, OB, same sample"
  subTitle <- paste0("size = ",size,", mean = ",mean0,", sigma = ",sigma," , psi = ",psi0)

  saveJpg(fileName = fileName, path = "output")
  plot(x = 0:(size-1),betaHatLrvHatArray,pch=20,col="blue",xlab="lag",ylim = c(yMin,yMax))
  points(x = 0:(size-1), betaLrvHatArray,pch=1, col = "red")
  abline(h = betaLRV[2])
  legend("topright",legend = c("LRVhat(beta(Y))","LRVhat(betahat(Y))","Teoretical"),
         col=c("red","blue","black"),pch=c(1,20,NA),lty = c(-1,-1,1))
  title(main = mainTitle,sub = subTitle)
  graphics.off()


  cat(" End of test BetaHatLRVHatAndBetaLRVHat ","\n")
}

