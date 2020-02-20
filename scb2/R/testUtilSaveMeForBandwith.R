#'@export
testUtilSaveMeForBandwith <- function(sampleSize,
                                     tParCount,
                                     bandwith,
                                     nonCoverageProbability,
                                     lag)
{
  fileName <- paste("ME&BandWith","a",nonCoverageProbability,"SS",sampleSize,sep = "_")
  fileName <- timestampGenerator(fileName)
  xlab <- "TparArray"
  subTitle <- paste(xlab,
                    "\ntParCount= ", tParCount,
                    ", Alpha = ", nonCoverageProbability,
                    ", lag = " , lag,
                    ", sampleS = ", sampleSize,
                    "\nAlpha, sample,SampleSize fixed",
                    sep = "")

  path <- doPath()

  tParArray <- createTParArray(tParCount)

  errorIfNotInputCompatible(alpha = nonCoverageProbability,lag = lag,sampleSize = sampleSize)
  lagCount <- computeLagCount(sampleSize = sampleSize,lag = lag)
  sample <- createSample(sampleSize)
  meArray <- matrix(NA,nrow = length(tParArray),ncol = length(bandwith))
  for(index in 1:length(bandwith))
  {
    tempBandwith <- bandwith[index]
    corArray <- testUtilComputeAllCorHats(tParArray = tParArray,
                                          lagCount = lagCount,
                                          sample = sample,
                                          bandwidth = tempBandwith)
    meArray[,index] <- testUtilComputeME(tParArray = tParArray,
                                         lag = lag,
                                         lagCount = lagCount,
                                         sample = sample,
                                         bandwidth = tempBandwith,
                                         nonCoverageProbability = nonCoverageProbability,
                                         allCorHats = corArray)

    saveCVS(fileName = fileName,path = path,dataToSave = meArray)
    saveJpg(fileName = fileName,path = path)
    matplot(tParArray,meArray,type = "l",col = 1:length(bandwith),
            xlab = "")
    title(main = "ME(t) for different bandwidth",sub = subTitle)
    legend("topright",title = "bandwith",legend = bandwith,
           fill = 1:length(bandwith))
    graphics.off()
  }




}
