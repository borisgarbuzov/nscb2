testUtilReplicationCountBenchmarkFunction <- function()
{
  cat ("\n Testing \'tests_84_testUtilReplicationCountBenchmark\'\n")
  myTParCount  <-10
  mySuperReplicationCount <- 4
  myNonCoverageProbability <- 0.05
  mySampleSize <- computeMinSampleSize(myNonCoverageProbability)
  myLag <- 1

  myReplicationCount <- 4:10
  errorIfNotInputCompatible(myNonCoverageProbability,myLag,mySampleSize)
  Start=Sys.time()
  testUtilReplicationCountBenchmark(sampleSize = mySampleSize,
                                    superReplicationCount = mySuperReplicationCount,
                                    tParCount = myTParCount,
                                    nonCoverageProbability = myNonCoverageProbability,
                                    replicationCountArray = myReplicationCount,
                                    lag = myLag)
  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
  cat("\n=====================")
  cat("\nTest parameters :","\n")
  cat("sampleSiz= ",mySampleSize,"\n")
  cat("TParCount= ",myTParCount,"\n")
  cat("Lag= ",myLag,"\n")
  cat("replicationCount= ",myReplicationCount,"\n")
  cat("superReplicationCount= ",mySuperReplicationCount,"\n")
  cat("nonCoverageProbability= ",myNonCoverageProbability,"\n")


}
test_that("testing testUtilReplicationCountBenchmarkFunction",{


  testUtilReplicationCountBenchmarkFunction()
  cat("\nEnd of test testUtilReplicationCountBenchmarkFunction", "\n")
  cat("=========================================")
})
