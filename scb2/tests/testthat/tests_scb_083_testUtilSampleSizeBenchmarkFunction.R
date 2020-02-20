testUtilSampleSizeBenchmarkFunction <- function()
{
  cat ("\n Testing \'tests_83_testUtilSampleSizeBenchmark\'\n")

  myTParCount  <-2
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 4
  myReplicationCount <- 4

  myLag <- 1



  myNonCoverageProbability <- 0.05

  minSampleSize <- computeMinSampleSize(myNonCoverageProbability)

  sampleSizeArray <- c(minSampleSize,20)



  Start=Sys.time()
  testUtilSampleSizeBenchmark(sampleSizeArray = sampleSizeArray,
                              tParCount = myTParCount,
                              superReplicationCount = mySuperReplicationCount,
                              replicationCount = myReplicationCount,
                              lag = myLag,
                              nonCoverageProbability = myNonCoverageProbability)
  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
  cat("\n=====================")
  cat("\nTest parameters :","\n")
  cat("minSampleSize= ",minSampleSize,"\n")
  cat("sampleSizeArray= ",sampleSizeArray,"\n")
  cat("TParCount= ",myTParArray,"\n")
  cat("Lag= ",myLag,"\n")
  cat("replicationCount= ",myReplicationCount,"\n")
  cat("superReplicationCount= ",mySuperReplicationCount,"\n")
  cat("nonCoverageProbability= ",myNonCoverageProbability,"\n")
  }


test_that("testing testUtilSampleSizeBenchmarkFunction",{


  testUtilSampleSizeBenchmarkFunction()
  cat(" End of test testUtilSampleSizeBenchmarkFunction", "\n")
  cat("=========================================")
})
