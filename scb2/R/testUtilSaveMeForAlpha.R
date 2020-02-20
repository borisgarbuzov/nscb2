#'@export
testUtilSaveMeForAlpha <- function(sampleSize,
                           sample,
                           nME,
                           nonCoverageProbability,
                           lag,
                           tParCount)
{
  fileName <- paste("meArray","a",nonCoverageProbability,sep = "_")
  fileName <- timestampGenerator(fileName)

  subTitle <- paste("sampleSize = ", sampleSize,
                    ", tParCount= ", tParCount,
                    ", Alpha = ", nonCoverageProbability,
                    ", lag = " , lag,
                    sep = "")

  path <- doPath()

  tParArray <- createTParArray(tParCount = tParCount)

  lagCount <- computeLagCount(sampleSize = sampleSize, lag = lag)

  sampleArray <- matrix(nrow = sampleSize,ncol = nME)
  meArray <- matrix(NA,nrow = length(tParArray),ncol = nME)


  for(indexCol in 1:nME)
  {

    sampleArray[,indexCol] <- createSample(sampleSize)

  }
  for(indexCol in 1:nME)
  {

    allCorHats <- computeAllCorHats(tParArray = tParArray,
                                    lagCount = lagCount,
                                    sample = sampleArray[,indexCol])

    meArray[,indexCol] <- computeMEbyCovHat(tParArray = tParArray,
                                            lag = lag,
                                            lagCount = myLagCount,
                                            sample = sampleArray[,indexCol],
                                            nonCoverageProbability = nonCoverageProbability,
                                            allCorHats = allCorHats,
                                            C_K = -1.978325,
                                            # int_sq_der = 0.306951,
                                            PHI_K_NORMAL_DIFF = 0.4065)

    saveCVS(fileName = fileName,path = path,dataToSave = meArray)
    saveJpg(fileName = fileName,path = path)
    matplot(tParArray,meArray,type = "l",col = 1:nME,ylab = " ME",xlab = "Tpar")
    title(main = "ME vs t par, fixed alpha",sub = subTitle)
    dev.off()
  }


}
