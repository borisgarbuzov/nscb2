testUtilRenewalVSExpansion <- function(batchSizeArray,
                                       psi,
                                       sigma,
                                       mean,
                                       type)
{
  sizeArray <- batchSizeArray^2
  testTitle <- paste0("")
  cat("\nTesting \'tests_77_testUtilRenewalVSExpansion' \n")
  cat("Test parameters:", "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("batchSizeArray ="); print(batchSizeArray); cat("\n")
  cat("sizeArray ="); print(sizeArray); cat("\n")
  cat("type:",type)
  generalOriginal <- createOriginalMA1(max(sizeArray),
                                       psi = psi,
                                       sigma = sigma,
                                       mean = mean)
  gamma <- createGamma(sigma = sigma,
                       psi = psi)
  lrvOriginal = gamma[1] + 2 * gamma[2]
  lrvOBRenewalArray <- rep(NA,length(sizeArray))
  lrvOBExpansionArray <- rep(NA,length(sizeArray))
  if(type == "OB")
  {
    fileName <- "OBRenewalVsExpansionTest"
    mainTitle <- "OBRenewalVsExpansionTest"
  } else
  {
    fileName <- "NBRenewalVsExpansionTest"
    mainTitle <- "NBRenewalVsExpansionTest"
  }

  fileName <- timestampGenerator(fileName = fileName)
  for(index in 1:length(sizeArray))
  {
    size <- sizeArray[index]
    batchSize <-batchSizeArray[index]
    original <- createOriginalMA1(size,
                                  psi = psi,
                                  sigma = sigma,
                                  mean = mean)
    partGeneralOriginal <- generalOriginal[1:size]
    lrvOBExpansionArray[index] <- switch (type,
                                          OB = computeLRVofOB2dArray(original = partGeneralOriginal,batchSize = batchSize),
                                          NB = createLRVof2dArray(cutNB(original = partGeneralOriginal,batchSize = batchSize))
    )

    lrvOBRenewalArray[index] <- switch (type,
                                        OB = computeLRVofOB2dArray(original = original,batchSize = batchSize),
                                        NB = createLRVof2dArray(cutNB(original = original,batchSize = batchSize))
    )
    #computeLRVofOB2dArray(original = original,batchSize = batchSize)
    YMax <- max(lrvOBRenewalArray,lrvOBExpansionArray,na.rm = TRUE)
    YMin <- min(lrvOBRenewalArray,lrvOBExpansionArray,na.rm = TRUE)
    saveJpg(fileName = fileName,path = "./plots/")
    plot(x = sizeArray,y = lrvOBExpansionArray,col="blue",ylim = c(YMin-YMin*0.05,YMax+YMax*0.05),type = "l")
    legend("topleft",legend = c("expansion","renewal"),fill = c("blue","red"))
    title(main = mainTitle)
    lines(x=sizeArray,y=lrvOBRenewalArray,col="red")
    abline(h = lrvOriginal)
    graphics.off()
  }
  cat("\n End of testUtilRenewalVSExpansion\n")

  cat("=====================\n")
}
