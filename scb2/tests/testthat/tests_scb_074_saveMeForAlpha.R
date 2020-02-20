saveMeForAlphaFunction <- function()
{
  cat ("\n Testing \'tests_74_saveMeForAlpha\'\n")
  nonCoverageProbability <- 0.1
  sampleSize <- computeMinSampleSize(nonCoverageProbability)
  sample <- createSample(sampleSize = sampleSize)

  myNMe <- 5
  lag <- 2


  tParCount <- 10
  errorIfNotInputCompatible(alpha = nonCoverageProbability,
                            lag = lag,sampleSize = sampleSize)
Start=Sys.time()
  testUtilSaveMeForAlpha(sampleSize = sampleSize,
                 sample = sample,nME = myNMe,
                 nonCoverageProbability = nonCoverageProbability,
                 lag = lag,
                 tParCount = tParCount)
  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
  cat("\n=====================")
  cat("\nTest parameters :","\n")
  cat("SampleSize= ",sampleSize,"\n")
  cat("TParCount= ",tParCount,"\n")
  cat("Lag= ",lag,"\n")
  cat("NonCoverageProbability= ",nonCoverageProbability,"\n")
}


test_that("testing saveMeForAlpha",{


  saveMeForAlphaFunction()
  cat(" End of test saveMeForAlphaFunction", "\n")
  cat("=========================================")
})
