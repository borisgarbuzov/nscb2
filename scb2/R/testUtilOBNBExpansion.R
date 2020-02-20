testUtilOBNBExpansion <- function(batchSizeArray,
                                  psi,
                                  sigma,
                                  mean)
{
  sizeArray<-batchSizeArray^2
  testTitle <- paste0("tests_76_testUtilOBNBExpansion\n")
  cat("\nTesting \'",testTitle,"\' \n")
  cat("Test parameters:", "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("batchSizeArray ="); print(batchSizeArray); cat("\n")
  cat("sizeArray ="); print(sizeArray); cat("\n")
  generalOriginal <- createOriginalMA1(max(batchSizeArray)^2,
                                       psi = psi,
                                       sigma = sigma,
                                       mean = mean)
  gamma <- createGamma(sigma = sigma,
                       psi = psi)
  lrvOriginal = gamma[1] + 2 * gamma[2]
  lrvOBArrayExpansion <- rep(NA,length(batchSizeArray))
  lrvNBArrayExpansion <- rep(NA,length(batchSizeArray))
  lrvOBArrayRenewal <- rep(NA,length(batchSizeArray))
  lrvNBArrayRenewal <- rep(NA,length(batchSizeArray))
  fileName <- "OBNBExpansionTest"
  fileName <- timestampGenerator(fileName = fileName)
  for(index in 1:length(batchSizeArray))
  {
    batchSize <- batchSizeArray[index]
    size <- sizeArray[index]
    partGeneralOriginal <- generalOriginal[1:size]
    original <-  createOriginalMA1(size = size,
                                   psi = psi,
                                   sigma = sigma,
                                   mean = mean)
    lrvOBArrayExpansion[index] <- computeLRVofOB2dArray(original = partGeneralOriginal,batchSize = batchSize)
    lrvNBArrayExpansion[index] <- createLRVof2dArray(cutNB(original = partGeneralOriginal,batchSize = batchSize))
    lrvOBArrayRenewal[index] <- computeLRVofOB2dArray(original = original,batchSize = batchSize)
    lrvNBArrayRenewal[index] <- createLRVof2dArray(cutNB(original = original,batchSize = batchSize))
    YMax <- max(lrvOBArrayExpansion,lrvNBArrayExpansion,na.rm = TRUE)
    YMin <- min(lrvOBArrayExpansion,lrvNBArrayExpansion,na.rm = TRUE)
    saveJpg(fileName = fileName,path = "./plots/")
    par(mfrow=c(1,2),oma = c(0, 0, 2, 0))
    plot(x = sizeArray,y = lrvOBArrayExpansion,col="blue",ylim = c(YMin-YMin*0.05,YMax+YMax*0.05),type = "l")
    legend("topleft",legend = c("OB","NB"),fill = c("blue","red"))
    abline(h = lrvOriginal)
    title(main = "OBNBExpansionTest")
    lines(x=sizeArray,y=lrvNBArrayExpansion,col="red")
    YMax <- max(lrvOBArrayRenewal,lrvNBArrayRenewal,na.rm = TRUE)
    YMin <- min(lrvOBArrayRenewal,lrvNBArrayRenewal,na.rm = TRUE)
    plot(x = sizeArray,y = lrvOBArrayRenewal,col="blue",ylim = c(YMin-YMin*0.05,YMax+YMax*0.05),type = "l")
    lines(x=sizeArray,y=lrvNBArrayRenewal,col="red")
    legend("topleft",legend = c("OB","NB"),fill = c("blue","red"))
    abline(h = lrvOriginal)
    title(main = "OBNBRenewalTest")
    graphics.off()
  }
  cat("\n End of testUtilOBNBExpansion\n")

  cat("=====================\n")
}
