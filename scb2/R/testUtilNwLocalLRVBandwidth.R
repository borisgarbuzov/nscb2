testUtilNwLocalLRVBandwidth <- function(sampleSize,
                                        blockCount,
                                        batchSize,
                                        bandwidth)
{
  cat("\nTesting \'tests_scb2_104_nwLocalLRVBandwidth\' \n")

  cat("Test parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("blockCount =", blockCount, "\n")
  cat("batchSize =", batchSize, "\n")
  cat("bandwidth =");print(bandwidth);cat("\n")
  for (bandwithIndex in bandwidth) {
    path <- doPath("LocalGamma_bandwith_NW")
    characterBandwith <- as.character(round(bandwithIndex,digits = 3))
    characterBandwith <- gsub("\\.","", characterBandwith)
    path <- paste0(path,characterBandwith)
    blockArray <- seq(1,sampleSize,length.out=blockCount+1)
    diffBlocks <- blockArray[2]-blockArray[1]
    sampleBlockMatrix <- createBlockSample(sampleSize = sampleSize,
                                           blockCount = blockCount)

    subtitle <- paste0("sampleSize = ",sampleSize,
                       ", blockCount = ",blockCount,
                       ", bandwith =", round(bandwithIndex, 3))
    lrvArray <- array(dim = blockCount)
    for (blockIndex in 1:blockCount) {
      #lrvArray[blockIndex] <- estimateLRVWu2009ForCenteredSample(sample = sampleBlockMatrix[blockIndex,])
      lrvArray[blockIndex] <- computeLRVofOB2dArray(original = sampleBlockMatrix[blockIndex,], batchSize=batchSize)
    }
    teoreticalLrv <-function(tPar) {return((1+tPar)^2)}
    extentedArguments<-createTParArray(200)
    teorLRV <- teoreticalLrv(tPar = extentedArguments)

    localArguments <- localLrvArguments(blockCount = blockCount)

    localLRV <- nadarayaWatsonRegression(lrvArray = lrvArray,
                                         extentedArguments = extentedArguments,
                                         baseArguments = localArguments,
                                         bandwidth = bandwithIndex)
    arguments <- linspace(-5,5,1000)
    denominator <- nwDenominator(extentedArguments = arguments,
                                 baseArguments = localArguments,
                                 bandwidth = bandwithIndex)
    saveJpg(fileName = "denominator",path = path)
    plot(arguments,denominator,type = "l",main = "denominator")
    graphics.off()
    numerator <- nwNumerator(extentedArguments = arguments,
                             baseArguments = localArguments,
                             lrvArray = lrvArray,
                             bandwidth = bandwithIndex)
    saveJpg(fileName = "numerator",path = path)
    plot(arguments,numerator,type = "l",main = "numerator")
    graphics.off()
    fileName <- "gammaTpar"
    fileName <- timestampGenerator(fileName = fileName)
    mainTitle <- "Local LRV TVMA(1)"
    saveJpg(fileName = fileName,path = path)
    plot(x=linspace(0,1,length(lrvArray)),y = lrvArray,ylim = c(0,4),xlab = "tPar")
    lines(x=linspace(0,1,length(teorLRV)),y = teorLRV,col = "red")
    lines(x = extentedArguments, y=localLRV,col="blue")
    legend("topleft",fill = c("black","red","blue"), legend = c("LRV","teoreticalLRV","smothing"))
    #plot(x = tparArray,y = gammaArray,type = "l")
    title(main = mainTitle,sub = subtitle)
    graphics.off()
  }
  cat("End of test nwLocalLRVBandwidth","\n")

  cat("=====================\n")
}
