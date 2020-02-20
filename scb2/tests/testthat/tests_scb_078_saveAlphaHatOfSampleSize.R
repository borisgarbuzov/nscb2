saveAlphaHatOfSampleSizeFunction <- function()
{
  cat ("\n Testing \'tests_78_saveAlphaHatOfSampleSize\'\n")


  nonCoverageProbability <- 0.1
  minSampleSize <- computeMinSampleSize(nonCoverageProbability)
  maxSampleSize <- minSampleSize + 10
  sampleSize <- seq(minSampleSize,maxSampleSize,by=1)
  tParCount <- 10


  lag <- 1



  replicationCount <- 42
  mySuperReplicationCount <- 1

  fileName = "tests_78_saveAlphaHatOfSampleSize"

  Start=Sys.time()
  testUtilSaveAlphaHatOfSampleSize(sampleSize = sampleSize,
                                   nonCoverageProbability = nonCoverageProbability,
                                   tParCount = tParCount,
                                   lag = lag,
                                   replicationCount = replicationCount,
                                   superReplicationCount = mySuperReplicationCount,
                                   fileName = fileName)
  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
  cat("\n=====================")
  cat("\nTest parameters :","\n")
  cat("sampleSize= ",sampleSize,"\n")
  cat("TParCount= ",tParCount,"\n")
  cat("Lag= ",lag,"\n")
  cat("minSamoleSize= ",minSampleSize,"\n")
  cat("maxSampleSize= ",maxSampleSize,"\n")
  cat("superReplicationCount= ",mySuperReplicationCount,"\n")
  cat("replicationCount= ",replicationCount,"\n")
  cat("NonCoverageProbability= ",nonCoverageProbability,"\n")
}
test_that("testing saveAlphaHatOfSampleSize",
          {
            saveAlphaHatOfSampleSizeFunction()
            cat("\n End of test saveAlphaHatOfSampleSize", "\n")
            cat("=========================================")
          })
