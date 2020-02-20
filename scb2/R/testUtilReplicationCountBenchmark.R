#'@export
testUtilReplicationCountBenchmark<-function(sampleSize,
                                            superReplicationCount,
                                            replicationCountArray,
                                            tParCount,
                                            nonCoverageProbability,
                                            lag)
{
  fileName <- paste("Benchmark_replicationCount",
                    "l", lag,
                    "alpha", nonCoverageProbability,
                    sep = "_")
  fileName <- timestampGenerator(fileName)
  path <-doPath()


  tParArray <- createTParArray(tParCount)

  userSelfArray<-rep(NA,length = length(replicationCountArray))

  sysSelfArray<-rep(NA,length = length(replicationCountArray))

  elapsedArray<-rep(NA,length = length(replicationCountArray))



  for(i in 1: length(replicationCountArray))
  {
    cat("\nReplicationCount = ",replicationCountArray[i],"\n")
    time<-system.time(
      computeNonCoverageFreqArray(
        superReplicationCount = superReplicationCount,
        replicationCount = replicationCountArray[i],
        sampleSize = sampleSize,
        lag = lag,
        tParArray = tParArray,
        nonCoverageProbability = nonCoverageProbability,
        fileName = "BenchMarkTestRepCount")
    )
    unclassedTime<-unclass(time)
    userSelfArray[i] <- unclassedTime[1]
    sysSelfArray[i] <- unclassedTime[2]
    elapsedArray[i] <- unclassedTime[3]

    maxElapsed <- max(elapsedArray,na.rm = T)
    saveJpg(fileName = fileName,path = path)
    plot(x=replicationCountArray,y=elapsedArray,main = "Benchmark for replicationCount"
         ,ylim = c(0,maxElapsed), type = "l")
    lines(x=replicationCountArray,y=sysSelfArray,col="red")
    lines(x=replicationCountArray,y=userSelfArray,col="blue")
    legend(x="topleft",legend = c("Elapsed time","user time","sys time"),
           fill = c("black","blue","red"))
    graphics.off()
    myDF <- data.frame(replicationCountArray,
                       userSelfArray,
                       sysSelfArray,
                       elapsedArray)

    saveCVS(fileName,path,dataToSave = myDF)

  }

}
