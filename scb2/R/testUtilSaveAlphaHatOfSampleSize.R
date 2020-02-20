#'@export
testUtilSaveAlphaHatOfSampleSize <- function(sampleSize,
                                     nonCoverageProbability,
                                     tParCount,
                                     lag,
                                     replicationCount,
                                     superReplicationCount,
                                     fileName)
{
  tParArray <- createTParArray(tParCount = tParCount)

  fileName <- "Alpha&SS"
  fileName <- paste(fileName, "l", lag, sep = "_")
  fileName <- paste(fileName, "rC", replicationCount,"sC", superReplicationCount, sep = "_")
  fileName <- timestampGenerator(fileName)

  xLab <- "sampleSize"

  subTitle <- paste(xLab,"\nlag= ",lag, ", tParCount = " ,tParCount,
                    ",\n replicationCount= ", replicationCount, ", 'SuperRep = ",
                    superReplicationCount,sep = "")

  path <- doPath()

  alphaHat <- matrix(NA,nrow = superReplicationCount,ncol = length(sampleSize))
  for(index in 1:length(sampleSize))
  {
    cat("\nsampleSize = ",sampleSize[index])
    bandwidth <- computeB(sampleSize[index])
    lagCount <- computeLagCount(sampleSize[index],lag)

    errorIfNotInputCompatible(alpha = nonCoverageProbability,
                              lag = lag,
                              sampleSize = sampleSize[index])

    alphaHat[,index] <- computeNonCoverageFreqArray(
      superReplicationCount = superReplicationCount,
      replicationCount = replicationCount,
      sampleSize = sampleSize[index],
      lag = lag,
      tParArray = tParArray,
      nonCoverageProbability = nonCoverageProbability,
      fileName = fileName)

    saveJpg(fileName,path)
    df <- rbind(sampleSize,alphaHat)
    saveCVS(fileName,path,df)
    alpha <- rep(nonCoverageProbability,times = length(sampleSize))

    plot(alpha~sampleSize,type="c",ylim = c(0,1),col="blue",xlab="",ylab = "alphaHat")

    title(main = "AlphaHat Of SampleSize", sub = subTitle)

    for(index in 1:length(sampleSize))
    {
      x <- rep(sampleSize[index],times = superReplicationCount)
      points(alphaHat[,index]~x,pch=20)
    }
    graphics.off()
  }


}
