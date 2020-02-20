testUtilTParCountBenchmarkFunction <- function()
{
  cat ("\n Testing \'tests_86_testUtilTparCountBenchmark\'\n")
  myTParCount  <-2:3
  myReplicationCount <- 4
  myNonCoverageProbability <- 0.05
  mySampleSize <- computeMinSampleSize(myNonCoverageProbability)
  myLag <- 1

  mySuperReplicationCount <- 4
  errorIfNotInputCompatible(myNonCoverageProbability,myLag,mySampleSize)
  Start=Sys.time()
  testUtilTParCountBenchmark(sampleSize = mySampleSize,
                             superReplicationCount = mySuperReplicationCount,
                            tParCountArray =  myTParCount,
                                      nonCoverageProbability = myNonCoverageProbability,
                                        replicationCount = myReplicationCount,
                                        lag = myLag)
  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
  cat("\n=====================")
  cat("\nTest parameters :","\n")
  cat("sampleSize= ",mySampleSize,"\n")
  cat("TParCount= ",myTParCount,"\n")
  cat("Lag= ",myLag,"\n")
  cat("replicationCount= ",myReplicationCount,"\n")
  cat("superReplicationCount= ",mySuperReplicationCount,"\n")
  cat("nonCoverageProbability= ",myNonCoverageProbability,"\n")
}
test_that("testing testUtilTParCountBenchmarkFunction",{


  testUtilTParCountBenchmarkFunction()
  cat("\n End of test testUtilTParCountBenchmarkFunction", "\n")
  cat("=========================================")
})
