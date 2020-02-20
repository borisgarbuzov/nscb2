#' @export

testUtilSaveMesaveMe3DForBandwidth <- function(sampleSize,
                                               tParCount,
                                               alphas,
                                               lag,
                                               bandwidth)
{
  fileName <- paste("meArray3DOfBandwidth",sep = "_")
  fileName <- timestampGenerator(fileName = fileName)

  path <- doPath()

  sample <- createSample(sampleSize = sampleSize)

  tParArray <- createTParArray(tParCount = tParCount)
  tParArrayCenter <- round(length(tParArray)/2,0)

  lagCount <- computeLagCount(sampleSize = sampleSize, lag = lag)

  meArray <- matrix(nrow = length(bandwidth),ncol = length(alphas))


  for(indexRow in 1:length(bandwidth))
  {
    for(indexCol in 1:length(alphas))
    {
      errorIfNotInputCompatible(alpha = alphas[indexCol],
                                lag = lag,sampleSize = sampleSize)
      allCorHats <- testUtilComputeAllCorHats(tParArray = tParArray,
                                              lagCount = lagCount,
                                              sample = sample,
                                              bandwidth = bandwidth[indexRow]
      )

      me <- testUtilComputeME(tParArray = tParArray,
                              lag = lag,
                              lagCount = myLagCount,
                              sample = sample,
                              nonCoverageProbability = alphas[indexCol],
                              allCorHats = allCorHats,
                              bandwidth = bandwidth[indexRow],
                              C_K = -1.978325,
                              # int_sq_der = 0.306951,
                              PHI_K_NORMAL_DIFF = 0.4065)
      meArray[indexRow,indexCol] <- me[tParArrayCenter]

    }
  }

  saveCVS(fileName = fileName,path = path,dataToSave = meArray)
  saveJpg(fileName = fileName,path = path)
  print(wireframe(meArray,row.values=bandwidth,column.values=alphas,
            xlab="bandwidth",ylab = "NonCoverageProbability",
            scales=list(arrows=FALSE),
            screen = list(z=250,x=-75)))
  graphics.off()
}
