#'@export
testUtilTParCountBenchmark<-function(sampleSize,
                                     superReplicationCount,
                                     replicationCount,
                                     tParCountArray,
                                     nonCoverageProbability,
                                     lag)
{
  fileName <- paste( "Benchmark_tParCount","l", lag, "alpha"
                     , nonCoverageProbability, sep = "_")
  path <-doPath()




  userSelfArray<-rep(NA, length = length(tParCountArray))

  sysSelfArray<-rep(NA, length = length(tParCountArray))

  elapsedArray<-rep(NA, length = length(tParCountArray))



  for(i in 1: length(tParCountArray))
  {
    tParArray <- createTParArray(tParCountArray[i])

    cat("\ntParCount = ",tParCountArray[i],"\n")

    time<-system.time(computeNonCoverageFreqArray(
      superReplicationCount = superReplicationCount,
      replicationCount = replicationCount,
      sampleSize = sampleSize,
      lag = lag,
      tParArray = tParArray,
      nonCoverageProbability = nonCoverageProbability,
      fileName = "BenchMarkTesttParCount")
    )
    unclassedTime<-unclass(time)
    userSelfArray[i] <- unclassedTime[1]
    sysSelfArray[i] <- unclassedTime[2]
    elapsedArray[i] <- unclassedTime[3]

    maxElapsed <- max(elapsedArray,na.rm = T)
    saveJpg(fileName = fileName,path = path)
    plot(x=tParCountArray,y=elapsedArray,main = "Benchmark for tParCount"
         ,ylim = c(0,maxElapsed), type = "l")
    lines(x=tParCountArray,y=sysSelfArray,col="red")
    lines(x=tParCountArray,y=userSelfArray,col="blue")
    legend(x="topleft",legend = c("Elapsed time","user time","sys time"),
           fill = c("black","blue","red"))
    graphics.off()
    myDF <- data.frame(tParCountArray,userSelfArray,sysSelfArray,
                       elapsedArray)

    saveCVS(fileName,path,dataToSave = myDF)

  }

}
