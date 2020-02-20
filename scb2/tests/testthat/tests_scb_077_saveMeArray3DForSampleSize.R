if(!require("lattice")) {
  install.packages("lattice")
  library(lattice)
}

saveMe3DForSampleSizeFunction <- function()
{
  cat ("\n Testing \'tests_77_saveMe3DForSampleSize\'\n")

  alphas <- seq(0.1,0.9,by = 0.2)
  sampleSize <- seq(20, 200,by = 20)



  tParCount <- 10
  lag <- 2
  Start=Sys.time()
  testUtilSaveMe3DForSampleSize(sampleSize = sampleSize,
                                alphas = alphas,
                                tParCount = tParCount,
                                lag = lag)
  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
  cat("\n=====================")
  cat("\nTest parameters :","\n")
  cat("SampleSize= ",sampleSize,"\n")
  cat("TParCount= ",tParCount,"\n")
  cat("Lag= ",lag,"\n")
  cat("alphas= ",alphas,"\n")

}
test_that("testing saveMe3DForSampleSize",
          {
            saveMe3DForSampleSizeFunction()
            cat(" End of test saveMe3DForSampleSize", "\n")
            cat("=========================================")
          })
