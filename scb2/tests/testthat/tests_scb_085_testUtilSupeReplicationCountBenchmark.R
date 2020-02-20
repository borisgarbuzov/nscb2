testUtilSupereplicationCountBenchmarkFunction <- function()
{
  cat ("\n Testing \'tests_85_testUtilSupeReplicationCountBenchmark\'\n")
  myTParCount  <-10
  myReplicationCount <- 4
  myNonCoverageProbability <- 0.05
  mySampleSize <- computeMinSampleSize(myNonCoverageProbability)
  myLag <- 1

  mySuperReplicationCount <- 4:5
  errorIfNotInputCompatible(myNonCoverageProbability,myLag,mySampleSize)
  Start=Sys.time()
  testUtilSupereplicationCountBenchmark(sampleSize = mySampleSize,
                                    superReplicationCountArray = mySuperReplicationCount,
                                    tParCount = myTParCount,
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

test_that("testing testUtilSupereplicationCountBenchmarkFunction",{


  testUtilSupereplicationCountBenchmarkFunction()
  cat("\n End of test testUtilSupereplicationCountBenchmarkFunction", "\n")
  cat("=========================================")
})
