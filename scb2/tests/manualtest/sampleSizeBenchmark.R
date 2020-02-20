
myPath <- doPath()

myTParCount  <-2
myTParArray  <- createTParArray(tParCount = myTParCount)
mySuperReplicationCount <- 4
myReplicationCount <- 4

myLag <- 1



myNonCoverageProbability <- 0.05



sampleSizeArray <- c(10,20,30,40,50,60)


testUtilSampleSizeBenchmark(sampleSizeArray = sampleSizeArray,
                            tParCount = myTParCount,
                            superReplicationCount = mySuperReplicationCount,
                            replicationCount = myReplicationCount,
                            lag = myLag,
                            nonCoverageProbability = myNonCoverageProbability)

