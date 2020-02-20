if(!require("lattice")) {
  install.packages("lattice")
  library(lattice)
}


saveMe3DForBandwidthFunction <- function()
{
  cat ("\n Testing \'tests_76_saveMe3DForBandwidth\'\n")
  alphas <- seq(0.01,0.05)
  maxAlpha <- max(alphas)
  sampleSize <- computeMinSampleSize(maxAlpha)


  tParCount <- 10




  lag <- 1
  bandwidth <- seq(0.1,0.9,by = 0.1)
  Start=Sys.time()

  bandwidth <- seq(0.1,0.9,by = 0.1)

  testUtilSaveMesaveMe3DForBandwidth(sampleSize = sampleSize,
                                     tParCount = tParCount,
                                     alphas = alphas,
                                     lag = lag,
                                     bandwidth = bandwidth)
  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
  cat("\n=====================")
  cat("\nTest parameters :","\n")
  cat("SampleSize= ",sampleSize,"\n")
  cat("TParCount= ",tParCount,"\n")
  cat("Lag= ",lag,"\n")
  cat("maxAlpha= ",maxAlpha,"\n")
  cat("bandwidth= ",bandwidth,"\n")
  cat("alphas= ",alphas,"\n")
}
test_that("testing saveMe3DForBandwidth",
          {
            saveMe3DForBandwidthFunction()
            cat(" End of test saveMe3DForBandwidth", "\n")
            cat("=========================================")
          })
