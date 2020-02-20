#'@export
testUtilErrorIfNotInputCompatible=function()
{
  cat("\n Testing \'tests_06_errorIfNotInputCompatible\'")

  myLag= 1
  myAlpha <- 0.3
  mySampleSize <- computeMinSampleSize(myAlpha)
  errorIfNotInputCompatible(alpha = myAlpha,sampleSize = mySampleSize,lag=myLag)
  cat("\n End of test errorIfNotInputCompatible", "\n")
  cat("=====================","\n")
}
