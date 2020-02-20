#'@export
testUtilSaveMeForSampleSize <- function(sampleSize,
                                tParCount,
                                nonCoverageProbability,
                                lag,
                                nMe)
{
  fileName <- paste("ME&SampleSize","a",nonCoverageProbability,sep = "_")
  fileName <- timestampGenerator(fileName = fileName)

  tParArray <- createTParArray(tParCount)
  tParArrayCenter <- round(length(tParArray)/2,0)

  subTitle <- paste(
    "tPar= ", tParArray[tParArrayCenter],
    ", Alpha = ", nonCoverageProbability,
    ", lag = " , lag,
    sep = "")

  path <- doPath()


  meCenterArray <- matrix(NA,nrow = length(sampleSize),ncol = nMe)
  for(indexCol in 1:nMe)
  {
    for(indexRow in 1:length(sampleSize))
    {
      errorIfNotInputCompatible(alpha = nonCoverageProbability,lag = lag,
                                sampleSize = sampleSize[indexRow])
      lagCount <- computeLagCount(sampleSize = sampleSize[indexRow],lag = lag)
      sample <- createSample(sampleSize = sampleSize[indexRow])
      allCor <- computeAllCorHats(tParArray = tParArray,lagCount = lagCount,sample = sample)
      me <- computeMEbyCovHat(tParArray = tParArray,
                              lag = lag,lagCount = lagCount,
                              sample = sample,
                              bandwidth = 0,
                              nonCoverageProbability = nonCoverageProbability,
                              allCorHats = allCor)
      meCenterArray[indexRow,indexCol] <- me[tParArrayCenter]

      saveCVS(fileName = fileName,path = path,dataToSave = meCenterArray)
      saveJpg(fileName = fileName,path = path)
      matplot(sampleSize,meCenterArray,type = "l",col = 1:nMe)
      title(main = "ME vs SampleSize, fixed alpha and T",sub = subTitle)
      graphics.off()
    }
  }
}
