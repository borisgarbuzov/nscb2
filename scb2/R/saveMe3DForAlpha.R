#'@export
saveMe3DForAlpha <- function(sampleSize,
                             sample,
                             tParCount,
                             alphas,
                             lag)
{
  tParArray <- createTParArray(tParCount = tParCount)

  lagCount <- computeLagCount(sampleSize = sampleSize, lag = lag)

  meArray <- matrix(nrow = length(tParArray),ncol = length(alphas))

  for(indexCol in 1:length(alphas))
  {

    errorIfNotInputCompatible(alpha = alphas[indexCol],
                              lag = lag,sampleSize = sampleSize)

    allCorHats <- computeAllCorHats(tParArray = tParArray,
                                    lagCount = lagCount,
                                    sample = sample
    )

    meArray[,indexCol] <- computeMEbyCovHat(tParArray = tParArray,
                                            lag = lag,
                                            lagCount = myLagCount,
                                            sample = sample,
                                            nonCoverageProbability = alphas[indexCol],
                                            allCorHats = allCorHats,
                                            C_K = -1.978325,
                                            # int_sq_der = 0.306951,
                                            PHI_K_NORMAL_DIFF = 0.4065)

  }
  fileName <- paste("meArray3D",sep = "_")
  fileName <- timestampGenerator(fileName = fileName)

  path <- doPath()
  saveCVS(fileName = fileName,path = path,dataToSave = meArray)
  saveJpg(fileName = fileName,path = path)
  print(wireframe(meArray,row.values=tParArray,column.values=alphas,
                  xlab="tParArray",ylab = "NonCoverageProbability",
                  scales=list(arrows=FALSE),
                  screen = list(z=200,x=-75)))
  graphics.off()


}
