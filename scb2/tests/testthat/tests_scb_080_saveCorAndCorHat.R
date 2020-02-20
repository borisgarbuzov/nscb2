saveCorAndCorHatFunction <- function()
{
  cat ("\n Testing \'tests_80_saveCorAndCorHat\'\n")
  alpha <- 0.1
  sampleSize <- computeMinSampleSize(alpha)
  tParCount <- 10



  lag <- 1
  errorIfNotInputCompatible(alpha, lag = lag,sampleSize = sampleSize)

  nCorHat <- 5



  Start=Sys.time()
  testUtilSaveCorAndCorHat(sampleSize = sampleSize,
                           tParCount = tParCount,
                           lag = lag,
                           nCorHat = nCorHat)
  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
  cat("\n=====================")
  cat("\nTest parameters :","\n")
  cat("sampleSize= ",sampleSize,"\n")
  cat("TParCount= ",tParCount,"\n")
  cat("Lag= ",lag,"\n")
  cat("nCorHat= ",nCorHat,"\n")
  cat("alpha= ",alpha,"\n")
}
test_that("testing saveCorAndCorHatFunction",
          {
            saveCorAndCorHatFunction()
            cat(" End of test saveCorAndCorHatFunction", "\n")
            cat("=========================================")
          })

