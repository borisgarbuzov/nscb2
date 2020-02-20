saveMeForSampleSizeFunction <- function()
{
  cat ("\n Testing \'tests_81_saveMeForSampleSize\'\n")

  tParCount <- 10

  nonCoverageProbability <- 0.2
  minSampleSize <- computeMinSampleSize(nonCoverageProbability)
  maxSampleSize <- minSampleSize + 150
  sampleSize <- seq(minSampleSize,maxSampleSize,by=100)
  lag <- 2
  nMe <- 5


  Start=Sys.time()
  testUtilSaveMeForSampleSize(sampleSize = sampleSize,
                              tParCount = tParCount,
                              nonCoverageProbability = nonCoverageProbability,
                              lag = lag,
                              nMe = nMe)
  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
  cat("\n=====================")
  cat("\nTest parameters :","\n")
  cat("sampleSize= ",sampleSize,"\n")
  cat("minSampleSize= ",minSampleSize,"\n")
  cat("maxSampleSize= ",maxSampleSize,"\n")
  cat("TParCount= ",tParCount,"\n")
  cat("Lag= ",lag,"\n")
  cat("nCorHat= ",nMe,"\n")
  cat("nonCoverageProbability= ",nonCoverageProbability,"\n")

}
test_that("testing saveMeForSampleSizeFunction",{


  saveMeForSampleSizeFunction()
  cat(" End of test saveMeForSampleSizeFunction", "\n")
  cat("=========================================")
})
