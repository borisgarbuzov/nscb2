#'@export
testUtilSaveCorAndCorHat <- function(sampleSize,
                             tParCount,
                             lag,
                             nCorHat)
{
  subTitle <- paste("sampleSize = ", sampleSize,
                    ", tParCount= ", tParCount,
                    ", lag =", lag,
                    sep = "")
  path <- doPath()
  fileName<-"Cor&CorHat"
  fileName <- timestampGenerator(fileName = fileName)

  tParArray <- createTParArray(tParCount = tParCount)

  corArray <- computeCor(lag,tParArray = tParArray)
  corHatArray <- matrix(NA,nrow=length(tParArray),ncol = nCorHat)
  for(index in 1:nCorHat)
  {
    sample <- createSample(sampleSize = sampleSize)
    bandWidth <- computeB(sampleSize = sampleSize)
    corHatArray[,index] <- computeCorHat(tParArray = tParArray,
                                         lag = lag,
                                         sample = sample)

    tempFindMax <- cbind(corHatArray,corArray)
    saveCVS(fileName = fileName,path = path,dataToSave = tempFindMax)
    max <- max(tempFindMax, na.rm = T)
    min <- min(tempFindMax, na.rm = T)
    saveJpg(fileName = fileName,path = path)
    matplot(tParArray,corHatArray,type = "l",col = "blue",ylim = c(min,max))
    lines(tParArray,y=corArray,col="red")
    title("Cor and CorHat",sub = subTitle)
    graphics.off()
  }


}
