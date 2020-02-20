testUtilLocalLRV <- function(sampleSize,
                             blockCount,
                             batchSize,
                             bandwidth,
                             type)
{
  cat("\nTesting \'tests_scb2_100_localLRV\' \n")

  cat("Test parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("blockCount =", blockCount, "\n")
  cat("batchSize =", batchSize, "\n")
  cat("bandwidth =", bandwidth, "\n")
  cat("type =", type, "\n")

  blockArray <- seq(1,sampleSize,length.out=blockCount+1)
  diffBlocks <- blockArray[2]-blockArray[1]
  sampleBlockMatrix <- createBlockSample(sampleSize = sampleSize,
                                       blockCount = blockCount)
  subtitle <- paste0("sampleSize = ",sampleSize,
                     ", blockCount = ",blockCount,
                     ", bandwith = ", bandwidth)
  lrvArray <- array(dim = blockCount)
  for (blockIndex in 1:blockCount) {

    lrvArray[blockIndex] <- computeLRVofOB2dArray(original = sampleBlockMatrix[blockIndex,], batchSize=batchSize)
  }
  teoreticalLrv <-function(tPar) {return((1+tPar)^2)}
  tparArray<-createTParArray(200)
  teorLRV <- teoreticalLrv(tPar = tparArray)

  localArguments <- localLrvArguments(blockCount = blockCount)

  gammaArray <- gluingLocalLRV(lrvArray = lrvArray,
                               extentedArguments = tparArray,
                               baseArguments = localArguments,
                               bandwidth = bandwidth,
                               type = type)


  fileName <- "localLrv"

  mainTitle <- "Local LRV TVMA(1) with"
  if(type == "NW")
  {
    mainTitle <- paste0(mainTitle," Nadaraya-Watson")
    fileName <- paste0(fileName, "NadarayaWatson")
  } else {
    mainTitle <- paste0(mainTitle," Priestley-Chao")
    fileName <- paste0(fileName, "priestleyChao")
  }
  fileName <- timestampGenerator(fileName = fileName)
  saveJpg(fileName = fileName,path = doPath())
  plot(x=linspace(0,1,length(lrvArray)),y = lrvArray,ylim = c(0,4),xlab = "tPar")
  if(type == "PC")
  {
    abline(v=bandwidth,lty=5)
    abline(v=(1-bandwidth),lty=5)
  }
  lines(x=linspace(0,1,length(teorLRV)),y = teorLRV,col = "red")
  lines(x = tparArray,y=gammaArray,col="blue")
  legend("topleft",fill = c("black","red","blue"),
         legend = c("LRV","teoreticalLRV","smothing"))
  title(main = mainTitle,sub = subtitle)
  graphics.off()

  cat("End of test localLRV","\n")

  cat("=====================\n")
}
