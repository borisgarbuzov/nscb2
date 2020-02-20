saveDoubleAplhaHatArrayFunction <- function()
{
  cat ("\n Testing \'tests_73_saveDoubleAplhaHatArray\'\n")
  myTParCount  <- 20
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 6
  myReplicationCount <- 7

  myLag <- 2

  nonCoverageProbabilities <- c(0.01,0.05)

  myMaxAlpha <- max(nonCoverageProbabilities)
  sampleSize <- computeMinSampleSize(myMaxAlpha)
  myLagCount <- computeLagCount(lag = myLag,sampleSize = sampleSize)

  alphaHats<-createDoubleAlphaArray(superReplicationCount = mySuperReplicationCount,
                         replicationCount = myReplicationCount,
                         sampleSize = sampleSize,
                         lag = myLag,
                         alphaArray = nonCoverageProbabilities,
                         tParArray = myTParArray,
                         fileName = "tests_73_SaveDoubleAlphaHatArray")
Start=Sys.time()
   saveDoubleAplhaHatArray(nonCoverageProbabilities = nonCoverageProbabilities,
                          alphaHats = alphaHats, sampleSize = sampleSize,
                          lag = myLag, replicationCount = myReplicationCount,
                          superReplicationCount = mySuperReplicationCount,
                          fileName = "tests_73_SaveDoubleAlphaHatArray")
   End=Sys.time()
   Duration=End-Start
   cat("\nDuration",Duration,"\n")
   cat("\n=====================")
   cat("\nTest parameters :","\n")
   cat("SampleSize= ",sampleSize,"\n")
   cat("TParCount= ",myTParCount,"\n")
   cat("Lag= ",myLag,"\n")
   cat("NonCoverageProbabilities= ",nonCoverageProbabilities,"\n")
   cat("ReplicationCount= ",myReplicationCount,"\n")
   cat("SuperReplicationCount= ",mySuperReplicationCount,"\n")


 }
test_that("Testing \'saveNonCoverageFreqArray\'", {
  saveDoubleAplhaHatArrayFunction()
  cat("\nEnd of test saveNonCoverageFreqArray", "\n")
  cat("=====================")
})

