computeNonCoverageFreqArrayFunction <- function() {
  cat("\n Testing \'tests_64_computeNonCoverageFreqArray\' \n")
  myNonCoverageProbability <- 0.05
  myTParCount  <-10
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 8
  myReplicationCount <- 6
  mySampleSize <- computeMinSampleSize(myNonCoverageProbability)
  myLag <- 1


  errorIfNotInputCompatible(alpha = myNonCoverageProbability,
                            lag = myLag,sampleSize = mySampleSize)
Start=Sys.time()
  nonCoverageFreqArray <- computeNonCoverageFreqArray(
    superReplicationCount = mySuperReplicationCount,
    replicationCount = myReplicationCount,
    sampleSize = mySampleSize,
    lag = myLag,
    tParArray = myTParArray,
    nonCoverageProbability = myNonCoverageProbability,
    fileName = "tests_64_computeNonCoverageFreqArray"
  )
  End=Sys.time()
  Duration=End-Start
cat("\n NonCoverageFreqArray= ",nonCoverageFreqArray)

  cat("\nDuration= ",Duration,"\n")
  cat("=====================")
  cat("\nTest parameters :","\n")
  cat("SampleSize= ",mySampleSize,"\n")
  cat("TParCount= ",myTParCount,"\n")
  cat("Lag= ",myLag,"\n")
  cat("ReplicationCount= ",myReplicationCount,"\n")
  cat("SuperReplicationCount= ",mySuperReplicationCount,"\n")
  cat("NonCoverageProbability= ",myNonCoverageProbability,"\n")


}

test_that("Testing \'computeNonCoverageFreqArray\'", {
  computeNonCoverageFreqArrayFunction()
  cat("\nEnd of test computeNonCoverageFreqArray", "\n")
  cat("=====================")
})
