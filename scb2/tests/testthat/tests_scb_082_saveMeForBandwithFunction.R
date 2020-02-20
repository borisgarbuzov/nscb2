saveMeForBandwithFunction <- function()
{
  cat ("\n Testing \'tests_82_saveMeForBandwith\'\n")

  bandwith <- seq(0.1,0.9,0.2)
  tParCount <- 10

  nonCoverageProbability <- 0.2
  alpha=0.1
  sampleSize <- computeMinSampleSize(alpha)
  lag <- 1


  Start=Sys.time()
  testUtilSaveMeForBandwith(sampleSize = sampleSize,
                            tParCount = tParCount,
                            bandwith = bandwith,
                            lag = lag,
                            nonCoverageProbability = nonCoverageProbability)
  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
  cat("\n=====================")
  cat("\nTest parameters :","\n")
  cat("sampleSize= ",sampleSize,"\n")
  cat("Bandwidth= ",bandwith,"\n")
  cat("TParCount= ",tParCount,"\n")
  cat("Lag= ",lag,"\n")
  cat("alpha= ",alpha,"\n")
  cat("nonCoverageProbability= ",nonCoverageProbability,"\n")
}
test_that("testing saveMeForBandwithFunction",{


  saveMeForBandwithFunction()
  cat(" End of test saveMeForBandwithFunction", "\n")
  cat("=========================================")
})

