testUtilWuWithCauchyDist <- function(sizeArray,
                                     psi,
                                     mean)
{
  cat("\nTesting \'tests_09_WuWithCauchyDists\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")
  fileName <- "2implementOfRecursive"
  fileName <- timestampGenerator(fileName = fileName)
  subtitle <- paste("\npsi = ",psi,", mean = ",mean)
  lrvRecursiveShatteredHatArray <- rep(NA,length(sizeArray))
  lrvRecursiveVectoredHatArray <- rep(NA,length(sizeArray))
  lrvCutOBHatArray <- rep(NA,length(sizeArray))
  for(indexSize in 1:length(sizeArray))
  {
    size <- sizeArray[indexSize]
    original <- createOriginalBernDens(size = size,
                                       psi = psi,
                                       mean = mean)
    lrvRecursiveShatteredHatArray[indexSize] <- estimateLRVWu2009ForCenteredSample(sample = original)
    lrvRecursiveVectoredHatArray[indexSize] <- estimateLRVWu2009ForNonCenteredSample(sample = original)
    #lrvCutOBHatArray[indexSize] <- computeLRVofOB2dArray(original = original,batchSize = batchSize[indexSize])
    yMin <- min(lrvRecursiveVectoredHatArray,lrvRecursiveShatteredHatArray,na.rm = TRUE)
    yMax <- max(lrvRecursiveVectoredHatArray,lrvRecursiveShatteredHatArray,na.rm = TRUE)
    saveJpg(fileName = fileName,path = "./plots")
    plot(x=sizeArray, y = lrvRecursiveVectoredHatArray,type = "l", col="blue",
         ylim = c(yMin-0.05*yMin,yMax+0.05*yMax))
    lines(x=sizeArray, y=lrvRecursiveShatteredHatArray,col="red")
    #lines(x=sizeArray, y=lrvCutOBHatArray,col="green")
    legend("topleft",fill = c("red","blue"),
           legend = c("Wu2009ForCenteredSample","Wu2009ForNonCenteredSample"))
    #abline(h=0.4375)
    title("Wu2009 with Cauchy dist",sub = subtitle)
    graphics.off()
  }
  cat("\n End of WuWithCauchyDists\n")

  cat("=====================\n")
}
