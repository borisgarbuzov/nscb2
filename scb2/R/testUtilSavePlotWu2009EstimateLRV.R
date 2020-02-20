testUtilSavePlotWu2009EstimateLRV <- function(batchSize,
                                              psi,
                                              sigma,
                                              mean)
{
  sizeArray <- batchSize^2
  cat("\nTesting \'tests_78_SavePlotWu2009EstimateLRV' \n")
  cat("Test parameters:", "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("batchSize ="); print(batchSize); cat("\n")
  cat("sizeArray ="); print(sizeArray); cat("\n")
  fileName <- "2implementOfRecursive"
  fileName <- timestampGenerator(fileName = fileName)
  gamma <- createGamma(sigma = sigma,
                       psi = psi)
  lrvOriginal = gamma[1] + 2 * gamma[2]
  subtitle <- paste("\npsi = ",psi,", sigma = ",sigma)
  lrvRecursiveShatteredHatArray <- rep(NA,length(sizeArray))
  lrvRecursiveVectoredHatArray <- rep(NA,length(sizeArray))
  lrvCutOBHatArray <- rep(NA,length(sizeArray))
  for(indexSize in 1:length(sizeArray))
  {
    size <- sizeArray[indexSize]
    original <- createOriginalMA1(size = size,
                                  psi = psi,
                                  sigma = sigma,
                                  mean = mean)
    lrvRecursiveShatteredHatArray[indexSize] <- estimateLRVWu2009ForCenteredSample(sample = original)
    lrvRecursiveVectoredHatArray[indexSize] <- estimateLRVWu2009ForNonCenteredSample(sample = original)
    lrvCutOBHatArray[indexSize] <- computeLRVofOB2dArray(original = original,batchSize = batchSize[indexSize])
    yMin <- min(lrvRecursiveVectoredHatArray,lrvRecursiveShatteredHatArray,lrvOriginal,na.rm = TRUE)
    yMax <- max(lrvRecursiveVectoredHatArray,lrvRecursiveShatteredHatArray,lrvOriginal,na.rm = TRUE)
    saveJpg(fileName = fileName,path = "./plots")
    plot(x=sizeArray, y = lrvRecursiveVectoredHatArray,type = "l", col="blue",
         ylim = c(yMin-0.05*yMin,yMax+0.05*yMax))
    lines(x=sizeArray, y=lrvRecursiveShatteredHatArray,col="red")
    lines(x=sizeArray, y=lrvCutOBHatArray,col="green")
    legend("topleft",fill = c("red","blue","green"),
           legend = c("Wu2009ForCenteredSample","Wu2009ForNonCenteredSample","cutOB"))
    abline(h=lrvOriginal)
    title("Recursive Algoritm type 1 and 2")
    graphics.off()
  }
  cat("\n End of testUtilRenewalVSExpansion\n")

  cat("=====================\n")
}
