#'@export
testUtilSaveMe3DForSampleSize <-function(sampleSize,
                                         alphas,
                                         tParCount,
                                         lag)
{
  tParArray <- createTParArray(tParCount = tParCount)
  tParArrayCenter <- round(length(tParArray)/2,0)

  meArray <- matrix(nrow = length(sampleSize),ncol = length(alphas))
  for(indexRow in 1:length(sampleSize))
  {
    for(indexCol in 1:length(alphas))
    {
      lagCount <- computeLagCount(sampleSize = sampleSize[indexRow],lag = lag)

      bandwidth <- computeB(sampleSize[indexRow])

      sample <- createSample(sampleSize = sampleSize[indexRow])


      allCorHats <- computeAllCorHats(tParArray = tParArray,
                                      lagCount = lagCount,
                                      sample = sample)

      me <- computeMEbyCovHat(tParArray = tParArray,
                              lag = lag,
                              lagCount = myLagCount,
                              sample = sample,
                              nonCoverageProbability = alphas[indexCol],
                              allCorHats = allCorHats,
                              C_K = -1.978325,
                              # int_sq_der = 0.306951,
                              PHI_K_NORMAL_DIFF = 0.4065)
      meArray[indexRow,indexCol] <- me[tParArrayCenter]

    }
  }
  fileName <- paste("meArray3DOfSampleSize",sep = "_")
  fileName <- timestampGenerator(fileName)

  path <- doPath()
  saveCVS(fileName = fileName,path = path,dataToSave = meArray)
  saveJpg(fileName = fileName,path = path)
  print(wireframe(meArray,row.values=sampleSize,column.values=alphas,
            xlab="sampleSize",ylab = "NonCoverageProbability",
            scales=list(arrows=FALSE),
            screen = list(z=250,x=-75)))
  graphics.off()
}
