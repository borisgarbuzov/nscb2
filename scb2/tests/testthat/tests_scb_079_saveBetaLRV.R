saveBetaLRVFunction <- function()
{
  cat ("\n Testing \'tests_79_saveBetaLRV\'\n")
  tParCount <- 10



  #sampleSize <- computeMinSampleSizeForBandwidth()
   sampleSize = 100

  nBetaLrvHat <- 5


  Start=Sys.time()
  testUtilSaveBetaLRVToLag2(sampleSize = sampleSize,tParCount = tParCount,nBetaLrvHat = nBetaLrvHat)
  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
  cat("\n=====================")
  cat("\nTest parameters :","\n")
  cat("sampleSize= ",sampleSize)
  cat("TParCount= ",tParCount,"\n")
  cat("nBetaLRV= ",nBetaLrvHat,"\n")





}
test_that("testing saveBetaLRVFunction",
          {
            saveBetaLRVFunction()
            cat(" End of test saveBetaLRVFunction", "\n")
            cat("=========================================")
          })
