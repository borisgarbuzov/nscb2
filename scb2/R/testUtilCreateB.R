#'@export
testUtilCreateB<-function(sampleSize)
{
  cat("\n Testing \'tests_04_createB\' \n")
  lag <- 1
  alpha <- 0.05
  mySampleSize = computeMinSampleSize(alpha = alpha)
  errorIfNotInputCompatible(alpha = alpha,lag = lag,mySampleSize)
  Start=Sys.time()
  b <- computeB(mySampleSize)
  End=Sys.time()
  Duration=End-Start
  cat("\nTest parameters :","\n")
  cat("sampleSize= ",sampleSize,"\n")
  cat("=====================","\n")
  cat("bandwidth =", b, "\n")
  cat("Duration =",Duration,"\n")
  cat(" End of test createB","\n")
  cat("=====================")
}
