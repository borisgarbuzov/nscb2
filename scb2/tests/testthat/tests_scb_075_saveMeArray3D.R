saveMe3DForAlphaFunction <- function()
{
  cat ("\n Testing \'tests_75_saveMe3DForAlpha\'\n")
  alphas <- seq(0.01,0.05)
    maxAlpha <- max(alphas)
  sampleSize <- computeMinSampleSize(maxAlpha)

  tParCount <- 8


  lag <- 2
Start=Sys.time()
  testUtilsaveMe3DForAlpha(sampleSize = sampleSize,
                                     tParCount = tParCount,
                                     alphas = alphas,
                                     lag = lag)
  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
  cat("\n=====================")
  cat("\nTest parameters :","\n")
  cat("SampleSize= ",sampleSize,"\n")
  cat("TParCount= ",tParCount,"\n")
  cat("Lag= ",lag,"\n")
  cat("maxAlpha= ",maxAlpha,"\n")
  cat("alphas= ",alphas,"\n")
}
test_that("testing saveMe3DForAlpha",
          {
            saveMe3DForAlphaFunction()
            cat(" End of test saveMe3DForAlphaFunction", "\n")
            cat("=========================================")
          })
