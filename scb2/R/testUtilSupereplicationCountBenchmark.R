#'@export
testUtilSupereplicationCountBenchmark<-function(sampleSize,
                                                superReplicationCountArray,
                                                replicationCount,
                                                tParCount,
                                                nonCoverageProbability,
                                                lag)
{
  fileName <- paste( "Benchmark_SuperReplicationCount","l", lag, "alpha"
                     , nonCoverageProbability, sep = "_")
  fileName <- timestampGenerator(fileName = fileName)
  path <-doPath()


  tParArray <- createTParArray(tParCount)

  userSelfArray <- rep(NA, length = length(superReplicationCountArray))

  sysSelfArray <- rep(NA, length = length(superReplicationCountArray))

  elapsedArray <- rep(NA, length = length(superReplicationCountArray))



  for(i in 1: length(superReplicationCountArray))
  {

    cat("\nsuperReplicationCount = ",superReplicationCountArray[i],"\n")




    time<-system.time(computeNonCoverageFreqArray(
      superReplicationCount = superReplicationCountArray[i],
      replicationCount = replicationCount,
      sampleSize = sampleSize,
      lag = lag,
      tParArray = tParArray,
      nonCoverageProbability = nonCoverageProbability,
      fileName = "BenchMarkTestSuperReplicationCount")
    )
    unclassedTime<-unclass(time)
    userSelfArray[i] <- unclassedTime[1]
    sysSelfArray[i] <- unclassedTime[2]
    elapsedArray[i] <- unclassedTime[3]

    maxElapsed <- max(elapsedArray,na.rm = T)
    saveJpg(fileName = fileName,path = path)
    plot(x=superReplicationCountArray,y=elapsedArray,main = "Benchmark for SuperReplicationCount"
         ,ylim = c(0,maxElapsed), type = "l")
    lines(x=superReplicationCountArray,y=sysSelfArray,col="red")
    lines(x=superReplicationCountArray,y=userSelfArray,col="blue")
    legend(x="topleft",legend = c("Elapsed time","user time","sys time"),
           fill = c("black","blue","red"))
    graphics.off()
    myDF <- data.frame(superReplicationCountArray,userSelfArray,sysSelfArray,
                       elapsedArray)

    saveCVS(fileName,path,dataToSave = myDF)

  }

}
