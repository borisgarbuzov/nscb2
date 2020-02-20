testUtilBetaHatAndBeta <- function(size,
                                   sigma,
                                   lag,
                                   psi,
                                   mean,
                                   tParCount)
{
  cat("\n Testing \'tests_scb2_144_BetaHatAndBeta\ \n")
  cat("\nTest parameters :","\n")
  cat("size= ",size,"\n")
  cat("sigma= ",sigma,"\n")
  cat("mean= ",mean,"\n")
  cat("lag= ",lag,"\n")
  cat("tParCount= ",tParCount,"\n")
  cat("psi= ",psi,"\n")

  sampleMA1 <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma,
                                mean = mean)

  betaMatrixHat<-createBetaMatrixHat(sampleMA1 = sampleMA1,
                                     maxLag = lag,
                                     tParCount=tParCount)
  betaMatrix <- createBetaMatrix(sample = sampleMA1,
                                 psi = psi,
                                 sigma = sigma,
                                 maxLag = lag)

  yMax <- max(betaMatrixHat, betaMatrix, na.rm = TRUE)
  yMax <- yMax + 0.05*yMax

  yMin <- min(betaMatrixHat, betaMatrix, na.rm = TRUE)
  yMin <- yMin - abs(0.05*yMin)

  fileName <- "compareBetaMatrixHatAndBetaMatrix"
  fileName <- timestampGenerator(fileName = fileName)

  saveJpg(fileName = fileName,path = "output")

  mainTilte <- "Beta Hat and Beta, one sample, one lag"
  subTitle <- paste0("size = ",size,", mean = ",mean,", sigma= ",sigma," , psi = ",psi,", lag = ",lag)

  plot(betaMatrixHat[,lag+1],pch=16, ylim = c(yMin,yMax))
  points(betaMatrix[,lag+1],pch=20,col="red")
  legend("topright",legend = c("Beta Hat","Beta"),pch = c(16,20),col=c("black","red"))
  title(main = mainTilte, sub = subTitle)
  graphics.off()

  cat(" End of test BetaHatAndBeta ","\n")

  cat("=====================\n")
}
